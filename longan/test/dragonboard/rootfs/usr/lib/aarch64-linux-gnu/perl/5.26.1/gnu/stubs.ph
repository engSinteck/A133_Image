require '_h2ph_pre.ph';

no warnings qw(redefine misc);

require 'bits/wordsize.ph';
if(!defined (&__AARCH64EB__)) {
    require 'gnu/stubs-lp64.ph';
}
if(defined (&__AARCH64EB__)) {
    require 'gnu/stubs-lp64_be.ph';
}
1;
