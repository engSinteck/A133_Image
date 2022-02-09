require '_h2ph_pre.ph';

no warnings qw(redefine misc);

if(defined(&__LP64__)) {
    eval 'sub __WORDSIZE () {64;}' unless defined(&__WORDSIZE);
} else {
    eval 'sub __WORDSIZE () {32;}' unless defined(&__WORDSIZE);
    eval 'sub __WORDSIZE32_SIZE_ULONG () {1;}' unless defined(&__WORDSIZE32_SIZE_ULONG);
    eval 'sub __WORDSIZE32_PTRDIFF_LONG () {1;}' unless defined(&__WORDSIZE32_PTRDIFF_LONG);
}
eval 'sub __WORDSIZE_TIME64_COMPAT32 () {0;}' unless defined(&__WORDSIZE_TIME64_COMPAT32);
1;
