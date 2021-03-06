??    ?      ?  ?   ?      ?     ?     ?  "   ?  	  ?     ?  (   ?  #        +     A  &   W     ~     ?     ?  9   ?  *   ?     *     G     O  9   V  )   ?     ?  "   ?     ?       /      +   P     |     ?     ?     ?  #   ?  #   ?  %         '     H     \     o     ?     ?     ?  W   ?     "  "   ?     b  &   ?  "   ?     ?     ?     ?          0  !   O     q  '   ?  "   ?     ?     ?  !     #   )     M  !   `  %   ?     ?     ?  !   ?     ?  &     5   >  *   t  C   ?  =   ?     !  (   3  %   \  %   ?  0   ?  &   ?        /        B  $   T  >   y  Z   ?               1  3   F  ,   z     ?     ?     ?     ?     ?       '   *     R  '   k     ?     ?     ?  +   ?     ?           9      L      b      r      ?      ?      ?   	   ?      ?   %   ?   /   !     3!     Q!     l!  &   z!  *   ?!     ?!  !   ?!     "     ("     ."  1   5"  /   g"     ?"  !   ?"     ?"  ,   ?"  T   #     d#  
   ?#      ?#     $     $     +$     8$     F$     Y$     x$  4   ?$  $   ?$     ?$     %     *%     H%     d%     ?%  *   ?%  :   ?%     ?%      &  )   =&  $   g&     ?&  #   ?&  #   ?&  0   ?&     "'     3'  
   D'     O'     R'     f'     ~'     ?'     ?'  %   ?'     ?'     (     )(     F(  &   `(     ?(     ?(     ?(     ?(     ?(  4   ?(     )     )     )  ?   )     ?*     ?*     ?*    ?*  !   ?.  +   /     </     \/     o/  +   ?/  !   ?/     ?/     ?/  J   ?/  -   A0     o0  	   ?0     ?0  O   ?0  -   ?0     1  '   01     X1     n1  0   ?1  0   ?1     ?1     ?1     2     %2  "   82  "   [2  -   ~2     ?2     ?2     ?2     ?2     3      3     03  P   J3     ?3     ?3  !   ?3  +   ?3  (   $4     M4     k4     ~4     ?4     ?4     ?4     ?4     5     $5     =5     S5  $   i5     ?5     ?5      ?5  .   ?5  %   6  (   76     `6  !   6  '   ?6  9   ?6  0   7  C   47  :   x7     ?7  6   ?7  $   ?7  $   8  *   C8  &   n8     ?8  '   ?8     ?8  $   ?8  E   9  \   Z9     ?9     ?9     ?9  @   ?9  1   0:     b:     |:     ?:     ?:     ?:  "   ?:  +   ;     :;  '   M;     u;     ?;     ?;  8   ?;  %   ?;  (   <     H<     W<     p<     ?<     ?<     ?<     ?<  
   ?<  "   ?<  +   =  <   /=  1   l=  )   ?=     ?=  !   ?=  (   ?=  &   '>  *   N>     y>     ?>  	   ?>  6   ?>  5   ?>     ?      ?     6?  %   U?  T   {?  }   ??     N@     ^@     z@     ?@     ?@     ?@     ?@  %   ?@     ?@  B   A  0   \A     ?A  *   ?A     ?A     ?A     B     1B  *   JB  5   uB  !   ?B     ?B  )   ?B  !   C     8C  *   TC  *   C  1   ?C     ?C     ?C     D     D     D     ,D     CD     \D     xD  !   ?D     ?D  *   ?D  *   E     ,E  '   ?E     gE     iE     E  "   ?E     ?E  7   ?E     F     F     F        ?      P          z   ?   {      ,       R   ?   *                  c   ?   U                  (           /      g       ?          K   <   ?   r   	   ?      "   s       ?   ?   #   E   ?   ?       ?   ?   J       l       6   Z   ?       5               L       Y   ?      8   ?   .   ?   I       ?   ?      ?       e                        ^   ?   H          ?   ?       A         =   ?       ?           ?   a   \   ?   ?   X   ?   b      m   ?   i   ?   n   h       ~   4   ?   `       q           }   _          $   ?   N   v   ?           
   O   ?   C           ]   -   ?   T   ?   ?       ?      w   &   G          t       )      2   0   f           ?       y       ?   1       @   d   ?       ?                   M   9   3   ?           ?       :   ?   >   ?   B   7   j   ?   x   %   ?   ?   +   !               ?   p       ?   F   V   u             ?   [   k       ?   ?       '      |               S   ;       Q   ?   W       D           ?       o   ?    
 
(None) 
Error applying application rules. 
Usage: %(progname)s %(command)s

%(commands)s:
 %(enable)-31s enables the firewall
 %(disable)-31s disables the firewall
 %(default)-31s set default policy
 %(logging)-31s set logging to %(level)s
 %(allow)-31s add allow %(rule)s
 %(deny)-31s add deny %(rule)s
 %(reject)-31s add reject %(rule)s
 %(limit)-31s add limit %(rule)s
 %(delete)-31s delete %(urule)s
 %(insert)-31s insert %(urule)s at %(number)s
 %(route)-31s add route %(urule)s
 %(route-delete)-31s delete route %(urule)s
 %(route-insert)-31s insert route %(urule)s at %(number)s
 %(reload)-31s reload firewall
 %(reset)-31s reset firewall
 %(status)-31s show firewall status
 %(statusnum)-31s show firewall status as numbered list of %(rules)s
 %(statusverbose)-31s show verbose firewall status
 %(show)-31s show firewall report
 %(version)-31s display version information

%(appcommands)s:
 %(applist)-31s list application profiles
 %(appinfo)-31s show information on %(profile)s
 %(appupdate)-31s update %(profile)s
 %(appdefault)-31s set default application policy
  (skipped reloading firewall)  Attempted rules successfully unapplied.  Some rules could not be unapplied. %s is group writable! %s is world writable! '%(f)s' file '%(name)s' does not exist '%s' already exists. Aborting '%s' does not exist '%s' is not writable 'route delete NUM' unsupported. Use 'delete NUM' instead. (be sure to update your rules accordingly) : Need at least python 2.6)
 Aborted Action Added user rules (see 'ufw status' for running firewall): Adding IPv6 rule failed: IPv6 not enabled Available applications: Backing up '%(old)s' to '%(new)s'
 Bad destination address Bad interface name Bad interface name: can't use interface aliases Bad interface name: reserved character: '!' Bad interface type Bad port Bad port '%s' Bad source address Cannot insert rule at position '%d' Cannot insert rule at position '%s' Cannot specify 'all' with '--add-new' Cannot specify insert and delete Checking ip6tables
 Checking iptables
 Checking raw ip6tables
 Checking raw iptables
 Checks disabled Command '%s' already exists Command may disrupt existing ssh connections. Proceed with operation (%(yes)s|%(no)s)?  Could not back out rule '%s' Could not delete non-existent rule Could not find '%s'. Aborting Could not find a profile matching '%s' Could not find executable for '%s' Could not find profile '%s' Could not find protocol Could not find rule '%d' Could not find rule '%s' Could not get listening status Could not get statistics for '%s' Could not load logging rules Could not normalize destination address Could not normalize source address Could not perform '%s' Could not set LOGLEVEL Could not update running firewall Couldn't determine iptables version Couldn't find '%s' Couldn't find parent pid for '%s' Couldn't find pid (is /proc mounted?) Couldn't open '%s' for reading Couldn't stat '%s' Couldn't update application rules Couldn't update rules file Couldn't update rules file for logging Default %(direction)s policy changed to '%(policy)s'
 Default application policy changed to '%s' Default: %(in)s (incoming), %(out)s (outgoing), %(routed)s (routed) Deleting:
 %(rule)s
Proceed with operation (%(yes)s|%(no)s)?  Description: %s

 Duplicate profile '%s', using last found ERROR: this script should not be SGID ERROR: this script should not be SUID Firewall is active and enabled on system startup Firewall not enabled (skipping reload) Firewall reloaded Firewall stopped and disabled on system startup Found exact match Found exact match, excepting comment Found multiple matches for '%s'. Please use exact profile name Found non-action/non-logtype/comment match (%(xa)s/%(ya)s/'%(xc)s' %(xl)s/%(yl)s/'%(yc)s') From IPv6 support not enabled Improper rule syntax Improper rule syntax ('%s' specified with app rule) Insert position '%s' is not a valid position Invalid '%s' clause Invalid 'from' clause Invalid 'port' clause Invalid 'proto' clause Invalid 'to' clause Invalid IP version '%s' Invalid IPv6 address with protocol '%s' Invalid interface clause Invalid interface clause for route rule Invalid log level '%s' Invalid log type '%s' Invalid option Invalid policy '%(policy)s' for '%(chain)s' Invalid port with protocol '%s' Invalid ports in profile '%s' Invalid position ' Invalid position '%d' Invalid profile Invalid profile name Invalid token '%s' Logging disabled Logging enabled Logging:  Missing policy for '%s' Mixed IP versions for 'from' and 'to' Must specify 'tcp' or 'udp' with multiple ports Need 'from' or 'to' with '%s' Need 'to' or 'from' clause New profiles: No rules found for application profile Option 'comment' missing required argument Option 'log' not allowed here Option 'log-all' not allowed here Port ranges must be numeric Port: Ports: Profile '%(fn)s' has empty required field '%(f)s' Profile '%(fn)s' missing required field '%(f)s' Profile: %s
 Profiles directory does not exist Protocol mismatch (from/to) Protocol mismatch with specified protocol %s Resetting all rules to installed defaults. Proceed with operation (%(yes)s|%(no)s)?  Resetting all rules to installed defaults. This may disrupt existing ssh connections. Proceed with operation (%(yes)s|%(no)s)?  Rule added Rule changed after normalization Rule deleted Rule inserted Rule updated Rules updated Rules updated (v6) Rules updated for profile '%s' Skipped reloading firewall Skipping '%(value)s': value too long for '%(field)s' Skipping '%s': also in /etc/services Skipping '%s': couldn't process Skipping '%s': couldn't stat Skipping '%s': field too long Skipping '%s': invalid name Skipping '%s': name too long Skipping '%s': too big Skipping '%s': too many files read already Skipping IPv6 application rule. Need at least iptables 1.4 Skipping adding existing rule Skipping inserting existing rule Skipping malformed tuple (bad length): %s Skipping malformed tuple (iface): %s Skipping malformed tuple: %s Skipping unsupported IPv4 '%s' rule Skipping unsupported IPv6 '%s' rule Status: active
%(log)s
%(pol)s
%(app)s%(status)s Status: active%s Status: inactive Title: %s
 To Unknown policy '%s' Unsupported action '%s' Unsupported default policy Unsupported direction '%s' Unsupported policy '%s' Unsupported policy for direction '%s' Unsupported protocol '%s' WARN: '%s' is world readable WARN: '%s' is world writable Wrong number of arguments You need to be root to run this script n problem running problem running sysctl problem running ufw-init
%s running ufw-init uid is %(uid)s but '%(path)s' is owned by %(st_uid)s unknown y yes Project-Id-Version: ufw
Report-Msgid-Bugs-To: FULL NAME <EMAIL@ADDRESS>
PO-Revision-Date: 2016-04-13 06:30+0000
Last-Translator: YunQiang Su <wzssyqa@gmail.com>
Language-Team: Simplified Chinese <zh_CN@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Launchpad-Export-Date: 2018-07-12 14:17+0000
X-Generator: Launchpad (build 18719)
Language: zh_CN
 
 
(无) 
应用规则时出错。 
使用方法：%(progname)s %(command)s

%(commands)s:
 %(enable)-31s 启用防火墙
 %(disable)-31s 禁用防火墙
 %(default)-31s 设置默认策略
 %(logging)-31s 设置日志到 %(level)s
 %(allow)-31s 添加允许 %(rule)s
 %(deny)-31s 添加否定 %(rule)s
 %(reject)-31s 添加拒绝 %(rule)s
 %(limit)-31s 添加限制 %(rule)s
 %(delete)-31s 删除 %(urule)s
 %(insert)-31s 在 %(number)s 插入 %(urule)s
 %(route)-31s 添加路由 %(urule)s
 %(route-delete)-31s 删除路由 %(urule)s
 %(route-insert)-31s 在 %(number)s 插入路由 %(urule)s
 %(reload)-31s 重新加载防火墙
 %(reset)-31s 重新设置防火墙
 %(status)-31s 显示防火墙状态
 %(statusnum)-31s 按编号列表 %(rules)s 显示防火墙状态
 %(statusverbose)-31s 显示详细的防火墙状态
 %(show)-31s 显示防火墙报告
 %(version)-31s 显示版本信息

%(appcommands)s:
 %(applist)-31s 列出应用程序配置文件
 %(appinfo)-31s 显示 %(profile)s 的信息
 %(appupdate)-31s 更新 %(profile)s
 %(appdefault)-31s 设置默认程序策略
  (跳过重新加载的防火墙)  成功撤销了对尝试规则的应用。  一些规则不能被撤销。 %s 全组可写！ %s 全局可写！ “%(f)s” 文件 “%(name)s” 不存在 “%s” 已存在。正在中止 “%s” 不存在 “%s” 不可写 “删除路由 NUM” 未被支持。请使用 “删除 NUM” 代替。 （请相应地更新你的防火墙规则） : 至少需要 python 2.6)
 已中止 动作 已添加的用户规则(查看正在运行的防火墙的 “ufw 状态”)： 添加 IPv6 规则失败： IPv6 未被启用 可用应用程序： 备份 “%(old)s” 至 “%(new)s”
 错误的目标地址 错误的接口名称 错误的接口名称：无法使用接口别名 错误的接口名称：保留字符：“！” 错误的接口类型 错误的端口 错误的端口 “%s” 错误的源地址 无法在 “%d” 处插入规则 无法在 “%s” 处插入规则 不能指定 “all” 使用 “--add-new” 无法指定插入和删除 检查 ip6tables
 检查 iptables
 检查原始的 ip6tables
 检查原始的 iptables
 检查被禁用 命令 “%s” 已存在 此命令可能会中断目前的 ssh 连接。要继续吗 (%(yes)s|%(no)s)？  无法备份规则 “%s” 无法删除不存在的规则 找不到 “%s”。正在中止 无法为 “%s” 找到相匹配的配置 无法找到 “%s” 的可执行文件 无法找到配置文件 '%s' 无法找到协议 无法找到规则 “%d” 无法找到规则 “%s” 无法取得监听状态 无法获得 “%s” 的数据 无法加载日志规则 不能标准化目标地址 不能标准化源地址 无法进行 “%s” 无法设置 LOGLEVEL 无法更新正在运行的防火墙 无法确定 iptables 版本 无法找到 “%s” 无法找到 “%s” 的父 pid 无法找到 pid (/proc 是否已经加载？) 无法打开 “%s” 进行读操作 无法在 “%s” 上运行 stat 命令 不能更新应用程序规则 无法更新防火墙规则文件 无法为日志记录更新规则文件 默认的 %(direction)s 策略更改为 “%(policy)s”
 默认应用程序策略已被改变为 “%s” 默认：%(in)s (incoming), %(out)s (outgoing), %(routed)s (routed) 将要删除：
%(rule)s
要继续吗 (%(yes)s|%(no)s)？  描述： %s

 重复的配置 “%s”，使用上次发现的配置 错误： 这个脚本不能被 SGID 错误： 这个脚本不能被 SUID 在系统启动时启用和激活防火墙 未启用防火墙(跳过重新载入) 已经重新载入防火墙 防火墙在系统启动时自动禁用 找到完全匹配项 找到完全匹配项，除了注释 “%s” 找到了多个匹配。请使用更精确的配置名称。 找到非行为/非日志类型/注释匹配 (%(xa)s/%(ya)s/'%(xc)s' %(xl)s/%(yl)s/'%(yc)s') 来自 IPv6 支持未被启用 规则的语法不正确 不正确的规则语法 ( “%s” 是由程序规则指定的) 插入位置 “%s” 不是一个有效的位置 无效的 “%s” 子句 无效的 “from” 子句 无效的 “port” 子句 无效的 “proto” 子句 无效的 “to” 子句 错误的 IP 协议版本 “%s” 使用 “%s” 协议的无效 IPv6 地址 无效接口条款 针对路由规则的无效接口条款 无效的日志级别 “%s” 无效的日志类型 “%s” 无效选项 针对 “%(chain)s” 的策略 “%(policy)s” 无效 使用 “%s” 协议的无效端口 配置 “%s” 中含有无效的端口 无效位置 ' 无效的位置 “%d” 非法配置文件 非法的配置文件名 无效的标记 “%s” 日志被禁用 日志被启用 日志：  针对 “%s” 的策略不存在 “from” 和 “to” 的 IP 版本不同 必须在复合的端口中指定 “tcp” 或者 “udp” 需要 “from” 或者 “to” 使用 “%s” 需要 “to”' 或者 “from” 子句 新建配置文件: 没有发现程序配置的规则 “注释” 选项丢失要求的参数 此处不允许使用 “log” 选项 此处不允许使用 “log-all” 选项 端口范围必须为数字 端口: 端口： 配置 “%(fn)s” 的必需字段 “%(f)s” 为空 配置 “%(fn)s” 缺少必需的字段 “%(f)s” 配置: %s
 配置目录不存在 from 和 to 的协议不匹配 协议与指定的协议 %s 不匹配 所有规则将被重设为安装时的默认值。要继续吗 (%(yes)s|%(no)s)？  所有规则将被重设为安装时的默认值。这可能会中断目前的 ssh 连接。要继续吗 (%(yes)s|%(no)s)？  规则已添加 标准化后规则被改变 规则已删除 规则已插入 规则已更新 防火墙规则已更新 规则已更新(v6) 配置 “%s” 的规则已经升级 跳过重新加载防火墙 跳过 “%(value)s”： 对于 “%(field)s”来说，值过长 跳过 “%s”：在 /etc/services 中也存在 跳过 “%s”：不能执行 跳过 “%s”：不能进行 stat 操作 跳过 “%s”：域太长 跳过 “%s”：非法名称 跳过 “%s”：名称太长 跳过 “%s”：太大 跳过 “%s”：已经打开太多文件 忽略 IPv6 应用规则。需要 iptables 1.4 以上 跳过添加已经存在的规则 跳过插入已存在的规则 忽略错误的元组(长度错误)： %s 忽略错误的元组(iface)：%s 忽略错误的元组： %s 忽略未被支持的 IPv4 “%s” 规则 忽略未被支持的 IPv6 “%s” 规则 状态：激活
%(log)s
%(pol)s
%(app)s%(status)s 状态： 激活%s 状态：不活动 标题：%s
 至 未知的策略 “%s” 不支持的动作'%s' 不支持的默认策略 不支持的方向 “%s” 策略 “%s” 未被支持 “%s” 方向不支持的策略 未被支持的协议 “%s” 警告：“%s” 可被任意用户读取 警告：“%s” 可被任意用户修改 参数数目错误 只有 root 用户才能运行此脚本 n 运行时出现问题 运行 sysctl 时出现问题 运行 ufw-init 时出现问题
%s 运行 ufw-init uid 是 %(uid)s 但是 “%(path)s” 属于 %(st_uid)s 未知 y 是 