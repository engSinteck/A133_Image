require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_PROCFS_H)) {
    eval 'sub _SYS_PROCFS_H () {1;}' unless defined(&_SYS_PROCFS_H);
    require 'features.ph';
    require 'sys/time.ph';
    require 'sys/types.ph';
    require 'sys/user.ph';
    eval 'sub ELF_NGREG () {($sizeof{\'struct user_regs_struct\'} / $sizeof{ &elf_greg_t});}' unless defined(&ELF_NGREG);
    eval 'sub ELF_PRARGSZ () {(80);}' unless defined(&ELF_PRARGSZ);
}
1;
