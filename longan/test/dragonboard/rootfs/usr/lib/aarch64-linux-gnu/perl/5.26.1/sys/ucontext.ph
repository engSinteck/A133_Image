require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_UCONTEXT_H)) {
    eval 'sub _SYS_UCONTEXT_H () {1;}' unless defined(&_SYS_UCONTEXT_H);
    require 'features.ph';
    require 'bits/types/sigset_t.ph';
    require 'bits/types/stack_t.ph';
    if(defined(&__USE_MISC)) {
	eval 'sub __ctx {
	    my($fld) = @_;
    	    eval q($fld);
	}' unless defined(&__ctx);
    } else {
	eval 'sub __ctx {
	    my($fld) = @_;
    	    eval q( &__  $fld);
	}' unless defined(&__ctx);
    }
    if(defined(&__USE_MISC)) {
	require 'sys/procfs.ph';
    }
    undef(&__ctx) if defined(&__ctx);
}
1;
