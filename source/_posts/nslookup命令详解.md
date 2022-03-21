---
title: nslookup 命令详解
date: 2022-03-21 11:23:23
categories:
  - Linux 教程
tags:
  - Centos
  - Linux
  - nslookup
---



#	nslookup概述

nslookup 命令，是Linux里非常常用的网络命令，简而言之就是“查DNS信息用的”。

<!--more-->

nslookup 用于查询DNS的记录，查询域名解析是否正常，在网络故障时用来诊断网络问题

通过 man nslookup 可以看到对于 nslookup 的官方解释是 "query Internet name servers interactively"。



#	安装nslookup

```bash
[root@localhost ~]# dnf install bind-utils
```



#	nslookup 的两种模式

nslookup是一个能够查询互联网域名服务器信息的程序。他有两种工作模式，即“交互模式”和“非交互模式”。

1. 交互模式：允许用户查询域名服务器，以获取有关主机和域名的信息，或是打印域名中的主机列表。

   在以下情况下进入交互模式：

   1. 没有给出参数（将使用默认名称服务器），即直接输入nslookup命令，不加任何参数，此时nslookup会连接到默认的域名服务器（即/etc/resolv.conf的第一个dns地址）。
   2. 第一个参数是连字符 (-) 并且第二个参数是域名服务器的主机名或 IP 地址。

2. 非交互模式：允许用户获取指定主机或域名的名称或所需信息。

   当要查找的主机的名称或 IP 地址作为第一个参数给出时，进入非交互模式。即直接在nslookup命令后加上所要查询的IP或主机名。

   nslookup不仅支持设置参数，也是支持设置选项（options）的，比如可以使用-query来设置查询类型为主机信息，同时设置初始超时时限为10秒：输入：`nslookup -query=hinfo  -timeout=10`。



#	语法格式

nslookup [-option] [name | -] [server]



#	命令详解及参考实例

1. 直接查询域名（以www.baidu.com举例）

   ```bash
   [root@localhost ~]# nslookup
   > www.baidu.com
   Server:         192.168.142.2 // 上连的DNS服务器
   Address:        192.168.142.2#53 // 上连的DNS服务器的IP地址与端口号
   
   Non-authoritative answer: // 非权威答案，即从上连DNS服务器的本地缓存中读取出的值，而非实际去查询到的值
   www.baidu.com   canonical name = www.a.shifen.com. // 说明www.baidu.com有个别名叫www.a.shifen.com
   Name:   www.a.shifen.com	// 域名www.a.shifen.com
   Address: 220.181.38.149		// 对应的IP地址之一,对应的描述信息为“北京市 百度网讯科技”
   Name:   www.a.shifen.com	// 域名www.a.shifen.com
   Address: 220.181.38.150		// 对应的IP地址之二
   ```

2. server [domain]

   首先nslookup会连接到当前的默认上连DNS服务器去查询domain的IP地址，并将之作为当前默认上连DNS服务器。

   另外，还有一个命令叫做lserver [domain]，它与server的区别在于，它是取本地的第一台DNS服务器来查询domain的IP地址，并将之作为当前默认上连DNS服务器。（lserver中的首字母l就是local的意思）

   ```bash
   [root@localhost ~]# nslookup
   > www.baidu.com							// 以默认的上连DNS服务器来查询
   Server:         192.168.142.2
   Address:        192.168.142.2#53
   
   Non-authoritative answer:
   www.baidu.com   canonical name = www.a.shifen.com.
   Name:   www.a.shifen.com
   Address: 220.181.38.149
   Name:   www.a.shifen.com
   Address: 220.181.38.150
   >
   > server 8.8.8.8						// 更改了上连的DNS服务器地址
   Default server: 8.8.8.8
   Address: 8.8.8.8#53
   >
   > www.baidu.com							// 以更改后的上连DNS服务器来查询
   Server:         8.8.8.8
   Address:        8.8.8.8#53
   
   Non-authoritative answer:
   www.baidu.com   canonical name = www.a.shifen.com.
   www.a.shifen.com        canonical name = www.wshifen.com.
   Name:   www.wshifen.com
   Address: 103.235.46.39
   ```

   可见，两个不同的上连DNS服务器返回的IP地址是不同的。

3. exit：退出nslookup的交互模式。

   ```bash
   [root@localhost ~]# nslookup
   > exit
   
   [root@localhost ~]#
   ```

4. set all：列出nslookup工具的常用选项的当前设置值。

   ```bash
   [root@localhost ~]# nslookup
   > set all
   Default server: 192.168.142.2
   Address: 192.168.142.2#53
   
   Set options:
     novc                  nodebug         nod2
     search                recurse
     timeout = 0           retry = 3       port = 53       ndots = 1
     querytype = A         class = IN
     srchlist = localdomain
   ```

5. set class=[value]：更改查询类，不同的类设定了不同的协议族。

   ```
   IN：Internet类（默认）
   CH：Chaos类
   HS：Hesiod类
   ```

   一般我们最长使用IN。而Hesiod之前仅在M.I.T（Massachusetts Institute of Technology，即麻省理工学院）范围内使用，现在甚至已经无人使用。而Chaos也几乎灭绝，曾经BIND套装用Chaos来协助检查版本号信息。

6. set [no]debug

   设置是否进入调试模式。如果set debug，则会进入到调试模式，查询过程中会显示完整的响应包以及其中的交互包。

   ```bash
   [root@localhost ~]# nslookup
   > set debug
   > www.baidu.com
   Server:         192.168.142.2
   Address:        192.168.142.2#53
   
   ------------
       QUESTIONS: //发出的查询请求
           www.baidu.com, type = A, class = IN
       ANSWERS: //返回的信息
       ->  www.baidu.com
           canonical name = www.a.shifen.com.
           ttl = 5
       ->  www.a.shifen.com
           internet address = 220.181.38.150
           ttl = 5
       ->  www.a.shifen.com
           internet address = 220.181.38.149
           ttl = 5
       AUTHORITY RECORDS:
       ADDITIONAL RECORDS:
   ------------
   Non-authoritative answer:
   www.baidu.com   canonical name = www.a.shifen.com.
   Name:   www.a.shifen.com
   Address: 220.181.38.150
   Name:   www.a.shifen.com
   Address: 220.181.38.149
   ------------
       QUESTIONS:
           www.a.shifen.com, type = AAAA, class = IN
       ANSWERS:
       AUTHORITY RECORDS:
       ->  a.shifen.com
           origin = ns1.a.shifen.com
           mail addr = baidu_dns_master.baidu.com
           serial = 2201060001
           refresh = 5
           retry = 5
           expire = 2592000
           minimum = 3600
           ttl = 5
       ADDITIONAL RECORDS:
   ------------
   ```

7. set [no]d2：开启了高级调试模式，会输出很多nslookup内部工作的信息，包括了许多函数调用信息。

8. set domain=[name]

   用于设置默认的域。这样的话，对于所有不包含“.”的查询请求，都会自动在尾部追查此域。

   ```bash
   [root@localhost ~]# nslookup
   > set all //显示上连DNS服务器信息以及所有的当前选项信息
   Default server: 192.168.142.2
   Address: 192.168.142.2#53
   
   Set options:
     novc                  nodebug         nod2
     search                recurse
     timeout = 0           retry = 3       port = 53       ndots = 1
     querytype = A         class = IN
     srchlist = localdomain  //可以看到srchlist（即search list为localdomain）
   > set domain=baidu.com
   > image // 查询imag
   Server:         192.168.142.2
   Address:        192.168.142.2#53
   
   Non-authoritative answer:
   image.baidu.com canonical name = image.n.shifen.com. //已默认追加了.baidu.com域，变成了image.baidu.com
   Name:   image.n.shifen.com
   Address: 124.237.176.67
   Name:   image.n.shifen.com
   Address: 240e:83:205:e:0:ff:b035:137d
   ```

9. set [no]search

   如果设置了set search，那么当查询的字串中只包含一个句点，且结尾非句点时，nslookup会将domain设置的域追加到查询字串的尾部来尝试查询。

10. set port=[value]

    众所周知，DNS默认的服务端口是53。当某些特殊情况，此端口改变时，可以通过本命令来设置。

11. set type=[value]

    也可以写成set querytype=[value]，用于更改信息查询类型。
    默认情况下，nslookup是查询域名所对应的A记录，而如果你想查询其对应的MX记录等信息时，就需要专门设置type值了。
    目前常用的type值如下：

    ```
    A：查看主机的IPv4地址
    AAAA：查看主机的IPv6地址
    ANY：查看关于主机域的所有信息
    CNAME：查找与别名对应的正式名字
    HINFO：查找主机的CPU与操作系统类型
    MINFO：查找邮箱信息
    MX：查找邮件交换信息
    NS：查找主机域的域名服务器
    PTR：查找与给定IP地址匹配的主机名
    RP：查找域负责人记录
    SOA：查找域内的SOA地址
    UINFO：查找用户信息
    ```

    例如，针对MX类型的查询结果如下：

    ```bash
    > set type=MX
    > baidu.com //查询MX信息
    Server:         192.168.142.2
    Address:        192.168.142.2#53
    
    Non-authoritative answer:
    baidu.com       mail exchanger = 20 usmx01.baidu.com.
    baidu.com       mail exchanger = 20 jpmx.baidu.com.
    baidu.com       mail exchanger = 20 mx50.baidu.com.
    baidu.com       mail exchanger = 10 mx.maillb.baidu.com.
    baidu.com       mail exchanger = 15 mx.n.shifen.com.
    baidu.com       mail exchanger = 20 mx1.baidu.com.
    
    Authoritative answers can be found from:
    > set type=A
    > baidu.com //查询A记录
    Server:         192.168.142.2
    Address:        192.168.142.2#53
    
    Non-authoritative answer:
    Name:   baidu.com
    Address: 220.181.38.251
    Name:   baidu.com
    Address: 220.181.38.148
    ```

12. retry=[number] / timeout=[number]

    可以用来设置查询重试的次数，以及每次查询的超时时限。

13. 常用的查询一个域名的A记录：

    ```
    nslookup domain [dns-server]
    ```

    如果没指定dns-server，用系统默认的dns服务器。

    ```bash
    [root@localhost ~]# nslookup baidu.com
    Server:         192.168.142.2
    Address:        192.168.142.2#53
    
    Non-authoritative answer:
    Name:   baidu.com
    Address: 220.181.38.148
    Name:   baidu.com
    Address: 220.181.38.251
    ```

14. 查询更具体的信息

    ```bash
    nslookup –d [其他参数] domain [dns-server]
    ```

    只要在查询的时候，加上-d参数，即可查询域名的缓存。

15. 查询其他记录

    直接查询返回的是A记录，可以指定参数，查询其他记录，比如AAAA、MX等。

    其中，type可以是以下这些类型：

    ```
    A        地址记录
    AAAA     地址记录
    AFSDB    Andrew文件系统数据库服务器记录
    ATMA     ATM地址记录
    CNAME    别名记录
    HINFO    硬件配置记录，包括CPU、操作系统信息
    ISDN     域名对应的ISDN号码
    MB       存放指定邮箱的服务器
    MG       邮件组记录
    MINFO    邮件组和邮箱的信息记录
    MR       改名的邮箱记录
    MX       邮件服务器记录
    NS       名字服务器记录
    PTR      反向记录
    RP       负责人记录
    RT       路由穿透记录
    SRV      TCP服务器信息记录
    TXT      域名对应的文本信息
    X25      域名对应的X.25地址记录
    ```

    ```bash
    [root@localhost ~]# nslookup -qt=mx baidu.com 8.8.8.8
    *** Invalid option: qt=mx
    Server:         8.8.8.8
    Address:        8.8.8.8#53
    
    Non-authoritative answer:
    Name:   baidu.com
    Address: 220.181.38.148
    Name:   baidu.com
    Address: 220.181.38.251
    ```

    ```c
    [root@localhost ~]# nslookup -qt=mx baidu.com 8.8.8.8*** Invalid option: qt=mxServer:         8.8.8.8Address:        8.8.8.8#53​Non-authoritative answer:Name:   baidu.comAddress: 220.181.38.148Name:   baidu.comAddress: 220.181.38.251
    ```

    