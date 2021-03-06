??    P      ?  k         ?  K   ?  ?    ?   ?  ?   b	  8  *
  ?  c  ?     |  ?  0   +  9   \  6   ?  C   ?               6     U     i  9   r     ?     ?     ?     ?  -   ?  $     5   @  '   v  $   ?  $   ?  $   ?          +  &   E     l     ?  J   ?  $   ?          "  H   0     y     ?     ?     ?     ?     ?  "   ?     "  1   6     h  (   w     ?     ?     ?  &   ?          &     ?  "   N     q  0   ?     ?  (   ?     ?  ?     ?  ?  "   D     g  ?   ?     
  &   )     P     e     ~  ?   ?  7   m     ?  
   ?     ?     ?  ?  ?  N   T  ?  ?  n   ~   ?   ?   i  ?!  ?  S$  ?   ?%    ?&  =   ?(  =   !)  8   _)  =   ?)     ?)  &   ?)  '   *     .*  	   J*  9   T*     ?*     ?*     ?*     ?*  3   ?*  0   +  ;   9+  "   u+  #   ?+      ?+  /   ?+  #   ,     1,  "   I,     l,     ?,  O   ?,  !   ?,     -     *-  f   :-     ?-     ?-  $   ?-  %   ?-     .     ,.  1   K.     }.  5   ?.     ?.  9   ?.     /     +/     8/  /   N/     ~/     ?/     ?/  ,   ?/     ?/  )   0     .0  #   C0     g0  ?   t0  ?  1  3   ?3     ?3  ?   ?3  #   v4  /   ?4     ?4     ?4     ?4    	5  8   6     D6  	   K6     U6     Z6        G       B   :   A   1      (   	          >              M   P       0             ;          F   !       '   .       $   3                     7   -         9   ,   *       #          5       E      )   2   4      @   ?       
       <           H                        +   =      C   D                  N          O       I   K   8          6                 &   J       "   L   %   /       
Copyright (C) 1990, 92, 93, 94, 96, 97, 99 Free Software Foundation, Inc.
 
Fine tuning:
  -s, --strict           use strict mappings, even loose characters
  -d, --diacritics       convert only diacritics or alike for HTML/LaTeX
  -S, --source[=LN]      limit recoding to strings and comments as for LN
  -c, --colons           use colons instead of double quotes for diaeresis
  -g, --graphics         approximate IBMPC rulers by ASCII graphics
  -x, --ignore=CHARSET   ignore CHARSET while choosing a recoding path
 
If a long option shows an argument as mandatory, then it is mandatory
for the equivalent short option also.  Similarly for optional arguments.
 
If none of -i and -p are given, presume -p if no FILE, else -i.
Each FILE is recoded over itself, destroying the original.  If no
FILE is specified, then act as a filter and recode stdin to stdout.
 
Listings:
  -l, --list[=FORMAT]        list one or all known charsets and aliases
  -k, --known=PAIRS          restrict charsets according to known PAIRS list
  -h, --header[=[LN/]NAME]   write table NAME on stdout using LN, then exit
  -F, --freeze-tables        write out a C module holding all tables
  -T, --find-subsets         report all charsets being subset of others
  -C, --copyright            display Copyright and copying conditions
      --help                 display this help and exit
      --version              output version information and exit
 
Operation modes:
  -v, --verbose           explain sequence of steps and report progress
  -q, --quiet, --silent   inhibit messages about irreversible recodings
  -f, --force             force recodings even when not reversible
  -t, --touch             touch the recoded files after replacement
  -i, --sequence=files    use intermediate files for sequencing passes
      --sequence=memory   use memory buffers for sequencing passes
 
Option -l with no FORMAT nor CHARSET list available charsets and surfaces.
FORMAT is `decimal', `octal', `hexadecimal' or `full' (or one of `dohf').
 
REQUEST is SUBREQUEST[,SUBREQUEST]...; SUBREQUEST is ENCODING[..ENCODING]...
ENCODING is [CHARSET][/[SURFACE]]...; REQUEST often looks like BEFORE..AFTER,
with BEFORE and AFTER being charsets.  An omitted CHARSET implies the usual
charset; an omitted [/SURFACE]... means the implied surfaces for CHARSET; a /
with an empty surface name means no surfaces at all.  See the manual.
 
Report bugs to <recode-bugs@iro.umontreal.ca>.
 
Usage: %s [OPTION]... [ [CHARSET] | REQUEST [FILE]... ]
   -p, --sequence=pipe     same as -i (on this system)
   -p, --sequence=pipe     use pipe machinery for sequencing passes
  done
  failed: %s in step `%s..%s'
 %s failed: %s in step `%s..%s' %s in step `%s..%s' %s to %s %sConversion table generated mechanically by Free `%s' %s %sfor sequence %s.%s *Unachievable* *mere copy* Ambiguous output Cannot complete table from set of known pairs Cannot invert given one-to-one table Cannot list `%s', no names available for this charset Charset %s already exists and is not %s Charset `%s' is unknown or ambiguous Child process wait status is 0x%0.2x Codes %3d and %3d both recode to %3d Dec  Oct Hex   UCS2  Mne  %s
 Expecting `..' in request Following diagnostics for `%s' to `%s' Format `%s' is ambiguous Format `%s' is unknown Free `recode' converts files between various character sets and surfaces.
 Identity recoding, not worth a table Internal recoding bug Invalid input LN is some language, it may be `c', `perl' or `po'; `c' is the default.
 Language `%s' is ambiguous Language `%s' is unknown Misuse of recoding library No character recodes to %3d No error No table to print No way to recode from `%s' to `%s' Non canonical input Pair no. %d: <%3d, %3d> conflicts with <%3d, %3d> Recoding %s... Recoding is too complex for a mere table Request `%s' is erroneous Request: %s
 Required argument is missing Resurfacer set more than once for `%s' Sequence `%s' is ambiguous Sequence `%s' is unknown Shrunk to: %s
 Sorry, no names available for `%s' Step initialisation failed Step initialisation failed (unprocessed options) Symbol `%s' is unknown Syntax is deprecated, please prefer `%s' System detected problem This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2, or (at your option)
any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software Foundation,
Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 Try `%s %s' for more information.
 UCS2   Mne   Description

 Unless DEFAULT_CHARSET is set in environment, CHARSET defaults to the locale
dependent encoding, determined by LC_ALL, LC_CTYPE, LANG.
 Unrecognised surface name `%s' Unsurfacer set more than once for `%s' Untranslatable input Virtual memory exhausted Virtual memory exhausted! With -k, possible before charsets are listed for the given after CHARSET,
both being tabular charsets, with PAIRS of the form `BEF1:AFT1,BEF2:AFT2,...'
and BEFs and AFTs being codes are given as decimal numbers.
 Written by Franc,ois Pinard <pinard@iro.umontreal.ca>.
 byte reversible ucs2 variable Project-Id-Version: recode 3.6
Report-Msgid-Bugs-To: 
PO-Revision-Date: 2007-07-10 14:23+0000
Last-Translator: Meng Jie <Unknown>
Language-Team: Chinese (simplified) <i18n-zh@googlegroups.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Launchpad-Export-Date: 2018-07-12 13:18+0000
X-Generator: Launchpad (build 18719)
X-Poedit-Basepath: z:\recode-3.6
 
版权所有 (C) 1990，92，93，94，96，97，99 自由软件基金会。
 
细节调整：
  -s，--strict           即使为可放松的字符也使用严格映射
  -d，--diacritics       只为 HTML/LaTeX 转换变音记号等
  -S，--source[=语言]    将重新编码的范围限制在某编程语言的字符串和注释中
  -c，--colons           使用冒号而不是双引号来表示分音符
  -g，--graphics         用 ASCII 符号模拟 IBMPC 标尺
  -x，--ignore=字符集    在选择重新编码途径时忽略某字符集
 
长选项必须带的参数在使用与之等价的短选项时也是必须的。可选参数亦是如此。
 
如果没有给出 -i 或 -p，当命令行中有文件时使用 -p，否则使用 -i。
为每个文件就地重新编码，丢弃其原始内容。如果没有在命令行中指定文件，
则将标准输入的内容重新编码为标准输出。
 
列表:
  -l，--list[=格式]          列出某个或所有已知的字符集和别名
  -k，--known=映射           仅列出匹配已知“映射”列表的字符集
  -h，--header[=[语言/]表名] 在标准输出上输出符合某语言语法的转换表，然后退出
  -F，--freeze-tables        输出一个包括所有转换表的 C 模块
  -T，--find-subsets         报告所有是其他字符集子集的字符集
  -C，--copyright            显示版权信息和复制条件
      --help                 显示本帮助信息后退出
      --version              输出版本信息后退出
 
操作模式：
  -v，--verbose           报告转换步骤序列和过程
  -q，--quiet，--silent   不报告不可逆的重新编码
  -f，--force             强制进行不可逆的重新编码
  -t，--touch             在替换之后 touch 重新编码的文件
  -i，--sequence=files    为系列转换使用中间文件
      --sequence=memory   为系列转换使用内存缓冲区
 
选项 -l 后如果没有指定“格式”或“字符集”，则列出所有可用的字符集和外在编码。
“格式”可以为‘decimal’、‘octal’、‘hexadecimal’或‘full’(或者‘dohf’
中的任一个字母)。
 
“请求”格式为“子请求[,子请求]...”；“子请求”格式为“编码[..编码]...”
“编码”格式为“[字符集][/[外在编码]]...”；“请求”一般有“源..目的”的形式，
“源”和“目的”均为字符集名。如果省略“字符集”，则表示通常的字符集；如果省略
“[/外在编码]...”则表示“字符集”默认的外在编码；只给出“/”而在其后不给出任
何外在编码则表示没有任何外在编码。详情请参见手册。
 
请向 <recode-bugs@iro.umontreal.ca> 报告程序缺陷。
 
用法：%s [选项]... [ [字符集] | 请求 [文件]...]
   -p，--sequence=pipe     在此系统下与 -i 等效
   -p，--sequence=pipe     为系列转换使用管道机制
  完成
  失败：%s 在步骤‘%s..%s’中
 %s 失败：%s 在步骤‘%s..%s’中 %s 在步骤‘%s..%s’中 %s 到 %s %sConversion table generated mechanically by Free `%s' %s %s为转换系列 %s.%s *无法到达* *仅复制* 有歧义的输出 无法从已知映射集中形成完整的转换表 无法求出给定的一一对应转换表的逆 无法列出‘%s’，此字符集没有可用的字符名 字符集 %s 已存在且并非 %s 字符集‘%s’未知或有歧义 子进程等待状态为 0x%0.2x 代码 %3d 和 %3d 都将被重新编码为 %3d 十   八  十六  UCS2  助记 %s
 请求中要有‘..’ ‘%s’到‘%s’的诊断信息 格式‘%s’意义不明确 格式‘%s’未知 自由的‘recode’将文件在不同的字符集和外在编码间转换。
 恒等变换，不需要转换表 内部重新编码缺陷 无效的输入 “语言”是某种编码语言，可以为‘c’、‘perl’或‘po’，‘c’为默认值。
 语言‘%s’意义不明确 语言‘%s’未知 对重新编码库的使用不正确 没有字符集可重新编码到 %3d 没有错误 没有可以打印的转换表 没有从‘%s’重新编码至‘%s’的途径 不正规的输入 第 %d 号映射：<%3d，%3d> 与 <%3d，%3d> 冲突 重新编码 %s... 重新编码太过复杂，无法以一张转换表表示 请求‘%s’有错误 请求：%s
 缺少需要的参数 为‘%s’施加了多于一个的外在编码 序列‘%s’意义不明确 序列‘%s’未知 缩减到：%s
 对不起，‘%s’没有可用的字符名 步骤初始化失败 步骤初始化失败(未处理的选项) 符号‘%s’未知 语法已过时，请改用‘%s’ 系统问题 本程序是自由软件；请参看源代码的版权声明。本软件不提供任何担保；
包括没有适销性和某一专用目的下的适用性担保。
 此程序是自由软件；您可以在自由软件基金会发布的 GNU 通用公共许
可证的条款下重新分发和(或)修改它；您可以选择使用 GPL 第二版，
或(按照您的意愿)任何更新的版本。

该程序分发的目的是为了其他人可以使用它，但是没有任何担保；也没
有对其适销性和某一特定目的下的适用性的担保。请查阅 GNU 通用公
共许可证来获得更多的信息。

你应该已经跟本程序一起收到一份 GNU 通用公共许可证；如果没有，
请写信至：Free Software Foundation, Inc., 
59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 请尝试执行‘%s %s’以得到更多信息。
 UCS2   助记     描述

 如果没有设置 DEFAULT_CHARSET 环境变量，字符集默认为区域选项的编码，由 LC_ALL、
LC_CTYPE、LANG 决定。
 无法识别的外在编码‘%s’ 为‘%s’去除了多于一个的外在编码 无法翻译的输入 虚拟内存耗尽 虚拟内存耗尽！ 使用 -k 时，目标字符集可能对应的所有的源字符集都将列出，两者均为表格化的字符
集，“映射”具有‘源1:目标1,源2:目标2,...’的形式，其中“源x”和“目标x”均
须以十进制数的形式给出。
 由 Francois Pinard <pinard@iro.umontreal.ca> 编写。
 字节 可逆的 ucs2 变量 