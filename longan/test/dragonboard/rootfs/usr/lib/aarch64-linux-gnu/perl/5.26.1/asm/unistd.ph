require '_h2ph_pre.ph';

no warnings qw(redefine misc);

eval 'sub __ARCH_WANT_RENAMEAT () {1;}' unless defined(&__ARCH_WANT_RENAMEAT);
require 'asm-generic/unistd.ph';
1;
