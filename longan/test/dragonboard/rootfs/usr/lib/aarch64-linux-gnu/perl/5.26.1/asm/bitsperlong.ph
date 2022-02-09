require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&__ASM_BITSPERLONG_H)) {
    eval 'sub __ASM_BITSPERLONG_H () {1;}' unless defined(&__ASM_BITSPERLONG_H);
    eval 'sub __BITS_PER_LONG () {64;}' unless defined(&__BITS_PER_LONG);
    require 'asm-generic/bitsperlong.ph';
}
1;
