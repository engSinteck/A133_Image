??    ?      ?  ?   ?      ?     ?  L   ?  K   ?  4   D  ?   y  3   7  u   k  7   ?  k     }   ?  ?     [   ?  ?   ?  [   ~  ?   ?  ?   i  (   ?  (   '  (   P  1   y  %   ?  %   ?  1   ?  .   )  ?   X  ?   ?  (   ?  (     2   *  1   ]  ?   ?  (   ?     ?            /   *  .   Z     ?     ?     ?     ?     ?     ?  	     	        !     <     W     j     ~  (   ?     ?     ?     ?          +     I     f  *   x     ?  
   ?  %   ?  )   ?  %     !   C  !   e  $   ?     ?  :   ?  9     0   =  +   n  *   ?  .   ?     ?  "        1     D     W     m     ?     ?     ?     ?  "   ?  #        )     F     _     }  )   ?  %   ?  #   ?  +      +   /   1   [   1   ?   +   ?   1   ?   1   !     O!     k!  #   ?!  "   ?!  "   ?!      ?!  !   "  %   7"     ]"  <   q"     ?"     ?"     ?"     ?"     #  +   *#     V#  !   p#  "   ?#  +   ?#      ?#      $      #$     D$     d$  !   x$     ?$     ?$     ?$     ?$     ?$     %     1%     O%     m%     ?%     ?%     ?%  "   ?%     ?%     &     #&     >&     Q&  %   b&     ?&     ?&     ?&     ?&     ?&     ?&     
'     '  !   "'     D'  $   U'  %   z'     ?'     ?'  2   ?'  2   (  2   9(     l(     ?(     ?(     ?(     ?(     ?(     ?(  %   )     9)     Q)  -   q)  ;   ?)  /   ?)  	   *     *     2*     :*     J*     Z*      r*     ?*     ?*     ?*  ?  ?*     ?,  >   ?,  =   -  /   A-  ?   q-  5   
.  z   @.  2   ?.  z   ?.  T   i/  l   ?/  D   +0  i   p0  k   ?0  j   F1  s   ?1  (   %2  (   N2  (   w2  *   ?2  (   ?2  (   ?2  *   3  '   H3  0   p3  0   ?3  +   ?3  +   ?3  +   *4  *   V4  9   ?4  +   ?4     ?4     5     5  0   5  /   O5     5     ?5     ?5     ?5     ?5     ?5      6     	6     6     -6     C6     U6     g6  ,   ?6     ?6     ?6     ?6     ?6  *   7  *   A7     l7  "   ?7     ?7     ?7     ?7  "   ?7     8     18     L8     g8     ?8  E   ?8  E   ?8  6   *9  -   a9  4   ?9  3   ?9     ?9     :     ,:     >:     P:     e:     z:     ?:     ?:     ?:  "   ?:  #   ?:     ;     0;  %   @;     f;  ,   w;  '   ?;  '   ?;  1   ?;  1   &<  9   X<  9   ?<  1   ?<  9   ?<  9   8=     r=     ?=  #   ?=  "   ?=  "   ?=     >     ,>  0   F>     w>  9   ?>     ?>     ?>     ?>     ?     /?  '   H?     p?     }?     ??  #   ??     ??     ??     ??     	@     @     /@     N@     a@     t@     ?@     ?@     ?@     ?@     ?@     ?@     ?@     
A  	   A     $A     @A     PA     `A     vA     ?A  $   ?A     ?A     ?A     ?A     B     %B     ;B     QB  
   _B  !   jB     ?B     ?B  $   ?B  #   ?B     ?B  .   C  /   <C  .   lC     ?C     ?C     ?C     ?C     ?C     D     "D     =D     ]D     vD  3   ?D  7   ?D  4   E  	   6E     @E     VE     ]E     lE     {E     ?E     ?E     ?E     ?E     %   f   ?   ?   ?   ?   M   ?   ?                  ^   ?       ?   ?   X   :   ?   ?   r   W   e   ?       ?   ?   @               1   [   !           N   ?   q   C           R   l   T   ?   ?          g      ?   D              s   =           b   ?   ?   ?   p               {   Z   ?                   -                    ?   }   )       Q       ?   u   ?   <           ?       ?   I      ?   ?   k       ?       .   ?      ?       O   ?       |   ?   >   2   J   4   L   ?   m   \   ?   3   U   A   G   ?   $   c   P   6   S       ?   ?   ?      ?   h   +      B   y   d   _   F   ?   ?                  ?   a       ?       t       K   ?   "   ?   ,   z   ?   E   ?   9   5   '   /   7   ?      ?       8   
   ;   v                   `   ?   x   H   ?   n   ]          &   *                0       V   ?   	   j          Y      ?                     ~   #   w   ?                      (           i              ?       ?   ?       ?   o                              
 
  For the options above, The following values are supported for "ARCH":
    
  For the options above, the following values are supported for "ABI":
    
  aliases            Do print instruction aliases.
 
  cp0-names=ARCH           Print CP0 register names according to
                           specified architecture.
                           Default: based on binary being disassembled.
 
  debug_dump         Temp switch for debug trace.
 
  fpr-names=ABI            Print FPR names according to specified ABI.
                           Default: numeric.
 
  no-aliases         Don't print instruction aliases.
 
  reg-names=ABI            Print GPR and FPR names according to
                           specified ABI.
 
  reg-names=ARCH           Print CP0 register and HWR names according to
                           specified architecture.
 
The following AARCH64 specific disassembler options are supported for use
with the -M switch (multiple options should be separated by commas):
 
The following ARM specific disassembler options are supported for use with
the -M switch:
 
The following MIPS specific disassembler options are supported for use
with the -M switch (multiple options should be separated by commas):
 
The following PPC specific disassembler options are supported for use with
the -M switch:
 
The following S/390 specific disassembler options are supported for use
with the -M switch (multiple options should be separated by commas):
 
The following i386/x86-64 specific disassembler options are supported for use
with the -M switch (multiple options should be separated by commas):
   addr16      Assume 16bit address size
   addr32      Assume 32bit address size
   addr64      Assume 64bit address size
   att         Display instruction in AT&T syntax
   data16      Assume 16bit data size
   data32      Assume 32bit data size
   dpfp            Recognize FPX DP instructions.
   dsp             Recognize DSP instructions.
   fpud            Recognize double precision FPU instructions.
   fpus            Recognize single precision FPU instructions.
   i386        Disassemble in 32bit mode
   i8086       Disassemble in 16bit mode
   intel       Display instruction in Intel syntax
   spfp            Recognize FPX SP instructions.
   suffix      Always display instruction suffix in AT&T syntax
   x86-64      Disassemble in 64bit mode
 # <dis error: %08lx> $<undefined> %02x		*unknown* %dsp16() takes a symbolic address, not a number %dsp8() takes a symbolic address, not a number %s: Error:  %s: Warning:  'LSL' operator not allowed 'ROR' operator not allowed (DP) offset out of range. (SP) offset out of range. (unknown) *unknown* 21-bit offset out of range 64-bit address is disabled <function code %d> <illegal precision> <internal disassembler error> <internal error in opcode table: %s %s>
 <unknown register %d> ABORT: unknown operand Address 0x%s is out of bounds.
 Bad immediate expression Bad register in postincrement Bad register in preincrement Bad register name Don't know how to specify # dependency %s
 Error: read from memory failed Hmmmm 0x%x Immediate is out of range -128 to 127 Immediate is out of range -32768 to 32767 Immediate is out of range -512 to 511 Immediate is out of range -7 to 8 Immediate is out of range -8 to 7 Immediate is out of range 0 to 65535 Internal disassembler error Internal error:  bad sparc-opcode.h: "%s", %#.8lx, %#.8lx
 Internal error: bad sparc-opcode.h: "%s", %#.8lx, %#.8lx
 Invalid position, should be 0, 16, 32, 48 or 64. Invalid position, should be 0, 8, 16, or 24 Invalid position, should be 0,4, 8,...124. Invalid position, should be 16, 32, 64 or 128. Label conflicts with `Rx' Label conflicts with register name Missing '#' prefix Missing '.' prefix Missing 'pag:' prefix Missing 'pof:' prefix Missing 'seg:' prefix Missing 'sof:' prefix Operand is not a symbol Register list is not valid Register must be between r0 and r7 Register must be between r8 and r15 Register number is not valid SR/SelID is out of range Syntax error: No trailing ')' Unknown error %d
 Unrecognised disassembler CPU option: %s
 Unrecognised disassembler option: %s
 Unrecognised register name set: %s
 Unrecognized field %d while building insn.
 Unrecognized field %d while decoding insn.
 Unrecognized field %d while getting int operand.
 Unrecognized field %d while getting vma operand.
 Unrecognized field %d while printing insn.
 Unrecognized field %d while setting int operand.
 Unrecognized field %d while setting vma operand.
 Value is not aligned enough Value must be a multiple of 16 Value must be in the range 0 to 240 Value must be in the range 0 to 28 Value must be in the range 0 to 31 Value must be in the range 1 to  Value of A operand must be 0 or 1 W keyword invalid in FR operand slot. W register expected Warning: disassembly unreliable - not enough bytes available address writeback expected bad instruction `%.50s' bad instruction `%.50s...' branch operand unaligned branch to odd offset branch value not in range and to odd offset branch value out of range displacement value is not aligned displacement value is out of range don't know how to specify %% dependency %s
 dsp:16 immediate is out of range dsp:20 immediate is out of range dsp:24 immediate is out of range dsp:8 immediate is out of range extraneous register floating-point immediate expected illegal bitmask illegal immediate value illegal use of parentheses imm10 is out of range imm:6 immediate is out of range immediate is out of range 0-7 immediate is out of range 1-2 immediate is out of range 1-8 immediate is out of range 2-9 immediate offset immediate out of range immediate value immediate value cannot be register immediate value is out of range immediate value out of range invalid conditional option invalid mask field invalid register invalid register for stack adjustment invalid register name invalid register offset invalid shift amount invalid shift operator jump hint unaligned junk at end of line missing `)' missing `]' missing mnemonic in syntax string missing register negative immediate value not allowed negative or unaligned offset expected offset(IP) is not a valid form operand is not zero operand out of range (%ld not between %ld and %ld) operand out of range (%ld not between %ld and %lu) operand out of range (%lu not between %lu and %lu) register element index register number register number must be even shift amount shift amount must be 0 or 12 shift amount must be 0 or 16 shift amount must be 0 or 8 shift amount must be a multiple of 16 shift operator expected stack pointer register expected syntax error (expected char `%c', found `%c') syntax error (expected char `%c', found end of instruction) unable to change directory to "%s", errno = %s
 undefined unexpected address writeback unknown unknown	0x%02lx unknown	0x%04lx unknown constraint `%c' unrecognized form of instruction unrecognized instruction vector5 is out of range vector8 is out of range Project-Id-Version: opcodes 2.28.90
Report-Msgid-Bugs-To: bug-binutils@gnu.org
PO-Revision-Date: 2018-04-09 12:22+0000
Last-Translator: Boyuan Yang <073plan@gmail.com>
Language-Team: Chinese (simplified) <i18n-zh@googlegroups.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Launchpad-Export-Date: 2018-07-12 13:02+0000
X-Generator: Launchpad (build 18719)
Language: zh_CN
X-Bugs: Report translation errors to the Language-Team address.
 
 
  对于以上的选项，以下值可被用于 "ARCH"：
    
  对于以上的选项，以下值可被用于 "ABI"：
    
  aliases            要打印指令别名。
 
  cp0-names=ARCH           根据指定的架构打印 CP0 寄存器名。
                           默认：根据被反汇编的二进制代码。
 
  debug_dump         调试跟踪的临时开关。
 
  fpr-names=ABI            根据指定的 ABI 打印浮点寄存器名。
                           默认：数字。
 
  no-aliases         不要打印指令别名。
 
  reg-names=ABI            根据指定的 ABI 打印通用寄存器和浮点寄存
                           器名。
 
  reg-names=ARCH           根据指定的架构打印 CP0 和 HWR 寄存器名。
 
下列 AARCH64 特定的反汇编器选项可通过 -M 开关启用（使用逗号分隔多个选项）：
 
下列 ARM 特定的反汇编器选项可通过 -M 开关启用：
 
下列 MIPS 特定的反汇编器选项可通过 -M 开关启用（使用逗号分隔多个选项）：
 
下列 PPC 特定的反汇编器选项在使用 -M 开关时可用（使用逗号分隔多个选项）：
 
下列 S/390 特定的反汇编器选项可通过 -M 开关启用（使用逗号分隔多个选项）：
 
下列 i386/x86-64 特定的反汇编器选项在使用 -M 开关时可用（使用逗号分隔多个选项）：
   addr16      假定 16 位地址大小
   addr32      假定 32 位地址大小
   addr64      假定 64 位地址大小
   att         用 AT&T 语法显示指令
   data16      假定 16 位数据大小
   data32      假定 32 位数据大小
   dpfp            识别 FPX DP 指令。
   dsp             识别 DSP 指令。
   fpud            识别双精度 FPU 指令。
   fpus            识别单精度 FPU 指令。
   i386        在 32 位模式下反汇编
   i8086       在 16 位模式下反汇编
   intel       用 Intel 语法显示指令
   spfp            识别 FPX SP 指令。
   suffix      在 AT&T 语法中始终显示指令后缀
   x86-64      在 64 位模式下反汇编
 # <反汇编出错: %08lx> $<未定义> %02x		*未知* %dsp16() 使用一个符号地址，而非数字 %dsp8() 使用一个符号地址，而非数字 %s：错误：  %s：警告：  不允许 'LSL' 操作符 不允许 'ROR' 操作符 (DP) 偏移量越界 (SP) 偏移量越界。 (未知) *未知* 21位长的偏移量越界 64 位地址已禁用 <函数代码 %d> <非法的精度> <反汇编器内部错误> <操作数表中出现内部错误：%s %s>
 <未知的寄存器 %d> 中止：未知的操作数 地址 0x%s 越界。
 错误的立即数表达式 后置自增中使用了错误的寄存器 前置自增中使用了错误的寄存器 错误的寄存器名 不知道如何指定 # 依赖 %s
 错误：从内存读取失败 咦... 0x%x 立即数越界 (-128 到 127) 立即数越界 (-32768 到 32767) 立即数越界 (-512 到 511) 立即数越界 (-7 到 8) 立即数越界 (-8 到 7) 立即数越界 (0 到 65535) 反汇编器内部错误 内部错误：错误的 sparc-opcode.h：“%s”，%#.8lx，%#.8lx
 内部错误：错误的 sparc-opcode.h：“%s”，%#.8lx，%#.8lx
 无效的位置，应当为 0、16、32、48 或 64。 无效的位置，应当为 0、8、16 或 24 无效的位置，应当为 0、4、8、...、124。 无效的位置，应当为 16、32、64 或 128。 标号与‘Rx’冲突 标号与寄存器名冲突 缺失 '#' 前缀 缺失 '.' 前缀 缺失 'pag:' 前缀 缺失 'pof:' 前缀 缺失 'seg:' 前缀 缺失 'sof:' 前缀 操作数不是一个符号 寄存器列表无效 寄存器必须介于r0和r7之间 寄存器必须介于r8和r15之间 寄存器号无效 SR/SelID 越界 语法错误：没有结尾的‘)’ 未知错误 %d
 无法识别的反汇编器 CPU 选项：%s
 无法识别的反汇编器选项：%s
 无法识别的寄存器名称集：%s
 建立 insn 时遇到无法识别的字段 %d。
 解码 insn 时遇到无法识别的字段 %d。
 获得 int 操作数时遇到无法识别的字段 %d。
 获得 vma 操作数时遇到无法识别的字段 %d。
 打印 insn 时遇到无法识别的字段 %d。
 设置 int 操作数时遇到无法识别的字段 %d。
 设置 vma 操作数时遇到无法识别的字段 %d。
 数值对齐程度不够 值必须是 16 的倍数 值必须在 0 到 240 的范围中 值必须在 0 到 28 的范围中 值必须在 0 到 31 的范围中 值的范围必须在 1 到  A 操作数必须为0或1 W 关键字非法，在 FR 操作数槽位中。 预期的 W 寄存器 警告：反汇编不可靠 - 没有足够的可用字节 预期的地址写回 错误的指令‘%.50s’ 错误的指令‘%.50s...’ 分支操作数未对齐 跳转偏移量为奇数 跳转越界且跳转偏移量为奇数 跳转越界 偏移值未对齐 偏移值越界 不知道如何指定 %% 依赖 %s
 dsp:16 立即数越界 dsp:20 立即数越界 dsp:24 立即数越界 dsp:8 立即数越界 多余寄存器 预期的浮点常量立即数 非法的位掩码 非法的立即数 括号用法非法 imm10 越界 imm:6 立即数越界 立即数越界 0-7 立即数越界 1-2 立即数越界 1-8 立即数越界 2-9 立即数偏移 立即数越界 立即数 立即数不能是寄存器 立即数越界 立即数越界 无效的条件选项 无效的掩码字段 无效的寄存器 用于调整堆栈的寄存器无效 无效寄存器名 无效的寄存器偏移量 无效的移位操作数 无效的移位操作符 跳转提示未对齐 行尾有垃圾字符 缺少‘)’ 缺少 `]' 语法字符串中没有助记符 缺失寄存器 不允许负立即数 预期的负或未对齐的偏移量 偏移量（IP）不是合法格式 操作数不是 0 操作数越界(%ld 不在 %ld 和 %ld 之间) 操作数越界 (%ld 不在 %ld 和 %lu 之间) 操作数越界(%lu 不在 %lu 和 %lu 之间) 寄存器元素下标 寄存器数 寄存器数必须是偶数 移位操作数 移位量必须为 0 或 12 移位量必须为 0 或 16 移位量必须为 0 或 8 移位量必须是 16 的倍数 预期的移位操作符 预期的堆栈指针寄存器 语法错误(需要字符‘%c’，得到‘%c’) 语法错误(需要字符‘%c’，却到达指令尾) 无法将当前目录切换至“%s”，errno = %s
 未定义 意外的地址写回 未知 未知	0x%02lx 未知	0x%04lx 未知的约束‘%c’ 无法识别的指令格式 无法识别的指令 vector5 越界 vector8 越界 