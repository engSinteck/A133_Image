require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&__ASM_POSIX_TYPES_H)) {
    eval 'sub __ASM_POSIX_TYPES_H () {1;}' unless defined(&__ASM_POSIX_TYPES_H);
    require 'asm-generic/posix_types.ph';
}
1;
