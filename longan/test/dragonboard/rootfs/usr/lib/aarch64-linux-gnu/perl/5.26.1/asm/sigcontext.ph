require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&__ASM_SIGCONTEXT_H)) {
    eval 'sub __ASM_SIGCONTEXT_H () {1;}' unless defined(&__ASM_SIGCONTEXT_H);
    unless(defined(&__ASSEMBLY__)) {
	require 'linux/types.ph';
	eval 'sub FPSIMD_MAGIC () {0x46508001;}' unless defined(&FPSIMD_MAGIC);
	eval 'sub ESR_MAGIC () {0x45535201;}' unless defined(&ESR_MAGIC);
	eval 'sub EXTRA_MAGIC () {0x45585401;}' unless defined(&EXTRA_MAGIC);
	eval 'sub SVE_MAGIC () {0x53564501;}' unless defined(&SVE_MAGIC);
    }
    eval 'sub SVE_VQ_BYTES () {16;}' unless defined(&SVE_VQ_BYTES);
    eval 'sub SVE_VQ_MIN () {1;}' unless defined(&SVE_VQ_MIN);
    eval 'sub SVE_VQ_MAX () {512;}' unless defined(&SVE_VQ_MAX);
    eval 'sub SVE_VL_MIN () {( &SVE_VQ_MIN *  &SVE_VQ_BYTES);}' unless defined(&SVE_VL_MIN);
    eval 'sub SVE_VL_MAX () {( &SVE_VQ_MAX *  &SVE_VQ_BYTES);}' unless defined(&SVE_VL_MAX);
    eval 'sub SVE_NUM_ZREGS () {32;}' unless defined(&SVE_NUM_ZREGS);
    eval 'sub SVE_NUM_PREGS () {16;}' unless defined(&SVE_NUM_PREGS);
    eval 'sub sve_vl_valid {
        my($vl) = @_;
	    eval q((($vl) %  &SVE_VQ_BYTES == 0 && ($vl) >=  &SVE_VL_MIN  && ($vl) <=  &SVE_VL_MAX));
    }' unless defined(&sve_vl_valid);
    eval 'sub sve_vq_from_vl {
        my($vl) = @_;
	    eval q((($vl) /  &SVE_VQ_BYTES));
    }' unless defined(&sve_vq_from_vl);
    eval 'sub sve_vl_from_vq {
        my($vq) = @_;
	    eval q((($vq) *  &SVE_VQ_BYTES));
    }' unless defined(&sve_vl_from_vq);
    eval 'sub SVE_SIG_ZREG_SIZE {
        my($vq) = @_;
	    eval q((( &__u32)($vq) *  &SVE_VQ_BYTES));
    }' unless defined(&SVE_SIG_ZREG_SIZE);
    eval 'sub SVE_SIG_PREG_SIZE {
        my($vq) = @_;
	    eval q((( &__u32)($vq) * ( &SVE_VQ_BYTES / 8)));
    }' unless defined(&SVE_SIG_PREG_SIZE);
    eval 'sub SVE_SIG_FFR_SIZE {
        my($vq) = @_;
	    eval q( &SVE_SIG_PREG_SIZE($vq));
    }' unless defined(&SVE_SIG_FFR_SIZE);
    eval 'sub SVE_SIG_REGS_OFFSET () {(($sizeof{\'struct sve_context\'} + ( &SVE_VQ_BYTES - 1)) /  &SVE_VQ_BYTES *  &SVE_VQ_BYTES);}' unless defined(&SVE_SIG_REGS_OFFSET);
    eval 'sub SVE_SIG_ZREGS_OFFSET () { &SVE_SIG_REGS_OFFSET;}' unless defined(&SVE_SIG_ZREGS_OFFSET);
    eval 'sub SVE_SIG_ZREG_OFFSET {
        my($vq, $n) = @_;
	    eval q(( &SVE_SIG_ZREGS_OFFSET +  &SVE_SIG_ZREG_SIZE($vq) * ($n)));
    }' unless defined(&SVE_SIG_ZREG_OFFSET);
    eval 'sub SVE_SIG_ZREGS_SIZE {
        my($vq) = @_;
	    eval q(( &SVE_SIG_ZREG_OFFSET($vq,  &SVE_NUM_ZREGS) -  &SVE_SIG_ZREGS_OFFSET));
    }' unless defined(&SVE_SIG_ZREGS_SIZE);
    eval 'sub SVE_SIG_PREGS_OFFSET {
        my($vq) = @_;
	    eval q(( &SVE_SIG_ZREGS_OFFSET +  &SVE_SIG_ZREGS_SIZE($vq)));
    }' unless defined(&SVE_SIG_PREGS_OFFSET);
    eval 'sub SVE_SIG_PREG_OFFSET {
        my($vq, $n) = @_;
	    eval q(( &SVE_SIG_PREGS_OFFSET($vq) +  &SVE_SIG_PREG_SIZE($vq) * ($n)));
    }' unless defined(&SVE_SIG_PREG_OFFSET);
    eval 'sub SVE_SIG_PREGS_SIZE {
        my($vq) = @_;
	    eval q(( &SVE_SIG_PREG_OFFSET($vq,  &SVE_NUM_PREGS) -  &SVE_SIG_PREGS_OFFSET($vq)));
    }' unless defined(&SVE_SIG_PREGS_SIZE);
    eval 'sub SVE_SIG_FFR_OFFSET {
        my($vq) = @_;
	    eval q(( &SVE_SIG_PREGS_OFFSET($vq) +  &SVE_SIG_PREGS_SIZE($vq)));
    }' unless defined(&SVE_SIG_FFR_OFFSET);
    eval 'sub SVE_SIG_REGS_SIZE {
        my($vq) = @_;
	    eval q(( &SVE_SIG_FFR_OFFSET($vq) +  &SVE_SIG_FFR_SIZE($vq) -  &SVE_SIG_REGS_OFFSET));
    }' unless defined(&SVE_SIG_REGS_SIZE);
    eval 'sub SVE_SIG_CONTEXT_SIZE {
        my($vq) = @_;
	    eval q(( &SVE_SIG_REGS_OFFSET +  &SVE_SIG_REGS_SIZE($vq)));
    }' unless defined(&SVE_SIG_CONTEXT_SIZE);
}
1;
