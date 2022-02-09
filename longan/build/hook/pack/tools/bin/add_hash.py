#!/usr/bin/env python
#
# Copyright (C) 2011 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""
Add hashtree footer to image_file using args in properties_file.

Usage:  add_hash.py properties_file image_file
"""

from __future__ import print_function

import logging
import os
import os.path
import re
import shutil
import sys

sys.path.append("build/make/tools/releasetools/")

import common
import verity_utils

logger = logging.getLogger(__name__)

OPTIONS = common.OPTIONS
BLOCK_SIZE = common.BLOCK_SIZE
BYTES_IN_MB = 1024 * 1024


class AddHashTreeFooterError(Exception):
  """An Exception raised during image building."""

  def __init__(self, message):
    Exception.__init__(self, message)

def AddHashTreeFooter(prop_dict, image_file):
  """Add hashtree footer to image_file using args in properties_file.

  Args:
    prop_dict: A property dict that contains info like partition size.
    image_file: The image file to handle.

  Raises:
    AddHashTreeFooterError: On handling failures.
  """
  # Get a builder for creating an image that's to be verified by Verified Boot,
  # or None if not applicable.
  verity_image_builder = verity_utils.CreateVerityImageBuilder(prop_dict)

  # Adjust the image size to make room for the hashes if this is to be verified.
  if verity_image_builder:
    max_image_size = verity_image_builder.CalculateMaxImageSize()
    prop_dict["image_size"] = str(max_image_size)

  # Create the verified image if this is to be verified.
  if verity_image_builder:
    verity_image_builder.Build(image_file)

def LoadGlobalDict(filename):
  """Load "name=value" pairs from filename"""
  d = {}
  f = open(filename)
  for line in f:
    line = line.strip()
    if not line or line.startswith("#"):
      continue
    k, v = line.split("=", 1)
    d[k] = v
  f.close()
  return d

def main(argv):
  if len(argv) != 2:
    print(__doc__)
    sys.exit(1)

  common.InitLogging()

  glob_dict_file = argv[0]
  image_file = argv[1]

  glob_dict = LoadGlobalDict(glob_dict_file)
  image_properties = glob_dict

  try:
    AddHashTreeFooter(image_properties, image_file)
  except:
    logger.error("Failed to build %s from %s", image_file)
    raise


if __name__ == '__main__':
  try:
    main(sys.argv[1:])
  finally:
    common.Cleanup()
