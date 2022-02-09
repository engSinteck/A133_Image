	,"DEBPKG:debian/cpan_definstalldirs - Provide a sensible INSTALLDIRS default for modules installed from CPAN."
	,"DEBPKG:debian/db_file_ver - https://bugs.debian.org/340047 Remove overly restrictive DB_File version check."
	,"DEBPKG:debian/doc_info - Replace generic man(1) instructions with Debian-specific information."
	,"DEBPKG:debian/enc2xs_inc - https://bugs.debian.org/290336 Tweak enc2xs to follow symlinks and ignore missing @INC directories."
	,"DEBPKG:debian/errno_ver - https://bugs.debian.org/343351 Remove Errno version check due to upgrade problems with long-running processes."
	,"DEBPKG:debian/libperl_embed_doc - https://bugs.debian.org/186778 Note that libperl-dev package is required for embedded linking"
	,"DEBPKG:fixes/respect_umask - Respect umask during installation"
	,"DEBPKG:debian/writable_site_dirs - Set umask approproately for site install directories"
	,"DEBPKG:debian/extutils_set_libperl_path - EU:MM: set location of libperl.a under /usr/lib"
	,"DEBPKG:debian/no_packlist_perllocal - Don't install .packlist or perllocal.pod for perl or vendor"
	,"DEBPKG:debian/fakeroot - Postpone LD_LIBRARY_PATH evaluation to the binary targets."
	,"DEBPKG:debian/instmodsh_doc - Debian policy doesn't install .packlist files for core or vendor."
	,"DEBPKG:debian/ld_run_path - Remove standard libs from LD_RUN_PATH as per Debian policy."
	,"DEBPKG:debian/libnet_config_path - Set location of libnet.cfg to /etc/perl/Net as /usr may not be writable."
	,"DEBPKG:debian/perlivp - https://bugs.debian.org/510895 Make perlivp skip include directories in /usr/local"
	,"DEBPKG:debian/deprecate-with-apt - https://bugs.debian.org/747628 Point users to Debian packages of deprecated core modules"
	,"DEBPKG:debian/squelch-locale-warnings - https://bugs.debian.org/508764 Squelch locale warnings in Debian package maintainer scripts"
	,"DEBPKG:debian/patchlevel - https://bugs.debian.org/567489 List packaged patches for 5.26.1-6ubuntu0.3 in patchlevel.h"
	,"DEBPKG:fixes/document_makemaker_ccflags - https://bugs.debian.org/628522 [rt.cpan.org #68613] Document that CCFLAGS should include $Config{ccflags}"
	,"DEBPKG:debian/find_html2text - https://bugs.debian.org/640479 Configure CPAN::Distribution with correct name of html2text"
	,"DEBPKG:debian/perl5db-x-terminal-emulator.patch - https://bugs.debian.org/668490 Invoke x-terminal-emulator rather than xterm in perl5db.pl"
	,"DEBPKG:debian/cpan-missing-site-dirs - https://bugs.debian.org/688842 Fix CPAN::FirstTime defaults with nonexisting site dirs if a parent is writable"
	,"DEBPKG:fixes/memoize_storable_nstore - [rt.cpan.org #77790] https://bugs.debian.org/587650 Memoize::Storable: respect 'nstore' option not respected"
	,"DEBPKG:debian/makemaker-pasthru - https://bugs.debian.org/758471 Pass LD settings through to subdirectories"
	,"DEBPKG:debian/makemaker-manext - https://bugs.debian.org/247370 Make EU::MakeMaker honour MANnEXT settings in generated manpage headers"
	,"DEBPKG:debian/kfreebsd-softupdates - https://bugs.debian.org/796798 Work around Debian Bug#796798"
	,"DEBPKG:fixes/autodie-scope - https://bugs.debian.org/798096 Fix a scoping issue with \"no autodie\" and the \"system\" sub"
	,"DEBPKG:fixes/memoize-pod - [rt.cpan.org #89441] Fix POD errors in Memoize"
	,"DEBPKG:debian/hurd-softupdates - https://bugs.debian.org/822735 Fix t/op/stat.t failures on hurd"
	,"DEBPKG:fixes/math_complex_doc_great_circle - https://bugs.debian.org/697567 [rt.cpan.org #114104] Math::Trig: clarify definition of great_circle_midpoint"
	,"DEBPKG:fixes/math_complex_doc_see_also - https://bugs.debian.org/697568 [rt.cpan.org #114105] Math::Trig: add missing SEE ALSO"
	,"DEBPKG:fixes/math_complex_doc_angle_units - https://bugs.debian.org/731505 [rt.cpan.org #114106] Math::Trig: document angle units"
	,"DEBPKG:fixes/cpan_web_link - https://bugs.debian.org/367291 CPAN: Add link to main CPAN web site"
	,"DEBPKG:fixes/time_piece_doc - https://bugs.debian.org/817925 Time::Piece: Improve documentation for add_months and add_years"
	,"DEBPKG:fixes/extutils_makemaker_reproducible - https://bugs.debian.org/835815 https://bugs.debian.org/834190 Make perllocal.pod files reproducible"
	,"DEBPKG:fixes/file_path_hurd_errno - File-Path: Fix test failure in Hurd due to hard-coded ENOENT"
	,"DEBPKG:debian/hppa_op_optimize_workaround - https://bugs.debian.org/838613 Temporarily lower the optimization of op.c on hppa due to gcc-6 problems"
	,"DEBPKG:debian/installman-utf8 - https://bugs.debian.org/840211 Generate man pages with UTF-8 characters"
	,"DEBPKG:fixes/file_path_chmod_race - https://bugs.debian.org/863870 [rt.cpan.org #121951] Prevent directory chmod race attack."
	,"DEBPKG:fixes/extutils_file_path_compat - Correct the order of tests of chmod(). (#294)"
	,"DEBPKG:fixes/getopt-long-2 - [rt.cpan.org #120300] Withdraw part of commit 5d9947fb445327c7299d8beb009d609bc70066c0, which tries to implement more GNU getopt_long campatibility. GNU"
	,"DEBPKG:fixes/getopt-long-3 - provide a default value for optional arguments"
	,"DEBPKG:fixes/getopt-long-4 - https://bugs.debian.org/864544 [rt.cpan.org #122068] Fix issue #122068."
	,"DEBPKG:fixes/test-builder-reset - https://bugs.debian.org/865894 Reset inside subtest maintains parent"
	,"DEBPKG:debian/hppa_opmini_optimize_workaround - https://bugs.debian.org/869122 Lower the optimization level of opmini.c on hppa"
	,"DEBPKG:debian/sh4_op_optimize_workaround - https://bugs.debian.org/869373 Also lower the optimization level of op.c and opmini.c on sh4"
	,"DEBPKG:fixes/json-pp-example - [rt.cpan.org #92793] https://bugs.debian.org/871837 fix RT-92793: bug in SYNOPSIS"
	,"DEBPKG:debian/perldoc-pager - https://bugs.debian.org/870340 [rt.cpan.org #120229] Fix perldoc terminal escapes when sensible-pager is less"
	,"DEBPKG:debian/prune_libs - https://bugs.debian.org/128355 Prune the list of libraries wanted to what we actually need."
	,"DEBPKG:debian/configure-regen - https://bugs.debian.org/762638 Regenerate Configure et al. after probe unit changes"
	,"DEBPKG:fixes/rename-filexp.U-phase1 - regen-configure: rename filexp.U to filexp_path.U, phase 1"
	,"DEBPKG:fixes/rename-filexp.U-phase2 - regen-configure: rename filexp.U to filexp_path.U, phase 2"
	,"DEBPKG:fixes/packaging_test_skips - Skip various tests if PERL_BUILD_PACKAGING is set"
	,"DEBPKG:debian/mod_paths - Tweak @INC ordering for Debian"
	,"DEBPKG:fixes/encode-alias-regexp - https://bugs.debian.org/880085 fix https://github.com/dankogai/p5-encode/issues/127"
	,"DEBPKG:fixes/regex-memory-leak - [910a6a8] https://bugs.debian.org/891196 [perl #132892] perl #132892: avoid leak by mortalizing temporary copy of pattern"
	,"DEBPKG:fixes/CVE-2018-6797 - [perl #132227] (perl #132227) restart a node if we change to uni rules within the node and encounter a sharp S"
	,"DEBPKG:fixes/CVE-2018-6798/pt1 - [perl #132063] Heap buffer overflow"
	,"DEBPKG:fixes/CVE-2018-6798/pt2 - [perl #132063] 5.26.1: fix TRIE_READ_CHAR and DECL_TRIE_TYPE to account for non-utf8 target"
	,"DEBPKG:fixes/CVE-2018-6798/pt3 - [perl #132063] (perl #132063) we should no longer warn for this code"
	,"DEBPKG:fixes/CVE-2018-6798/pt4 - [perl #132063] utf8.c: Don't dump malformation past first NUL"
	,"DEBPKG:fixes/CVE-2018-6913 - [perl #131844] (perl #131844) fix various space calculation issues in pp_pack.c"
	,"DEBPKG:fixes/CVE-2018-12015.patch - [PATCH] [PATCH] Remove existing files before overwriting them"
	,"DEBPKG:fixes/CVE-2018-18311.patch - [PATCH] Perl_my_setenv(); handle integer wrap"
	,"DEBPKG:fixes/CVE-2018-18312.patch - [PATCH 242/242] PATCH: [perl #133423] for 5.26 maint"
	,"DEBPKG:fixes/CVE-2018-18313.patch - [PATCH] regcomp.c: Convert some strchr to memchr"
	,"DEBPKG:fixes/CVE-2018-18314.patch - [PATCH] fix #131649 - extended charclass can trigger assert"
