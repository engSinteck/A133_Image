require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_BITS_SIGCONTEXT_H)) {
    eval 'sub _BITS_SIGCONTEXT_H () {1;}' unless defined(&_BITS_SIGCONTEXT_H);
    if(!defined (&_SIGNAL_H)  && !defined (&_SYS_UCONTEXT_H)) {
	die("Never use <bits/sigcontext.h> directly; include <signal.h> instead.");
    }
    unless(defined(&sigcontext_struct)) {
	eval 'sub sigcontext_struct () { &sigcontext;}' unless defined(&sigcontext_struct);
	require 'asm/sigcontext.ph';
	eval 'sub __need_NULL () {1;}' unless defined(&__need_NULL);
	require 'stddef.ph';
    }
}
1;
