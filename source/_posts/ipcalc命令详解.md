---
title: ipcalc 命令详解
date: 2022-01-01 14:16:23
categories:
  - Linux 教程
tag:
  - Linux
  - ipcalc
  - Centos
---



#	ipcalc

ipcalc命令的全称是：Calculate IP information for a host（计算主机的IP信息）

一个简单的ip地址计算器，可以完成简单的IP地址计算任务。
<!--more-->

#	ipcalc安装

```bash
[root@localhost ~]# dnf install initscripts
Last metadata expiration check: 0:03:34 ago on Thu 06 Jan 2022 11:23:44 AM CST.
Dependencies resolved.
==================================================================
 Package         Arch       Version              Repository  Size
==================================================================
Installing:
 initscripts     x86_64     10.00.15-1.el8       BaseOS     339 k

Transaction Summary
==================================================================
Install  1 Package

Total download size: 339 k
Installed size: 1.0 M
Is this ok [y/N]: y
Downloading Packages:
initscripts-10.00.15-1.el8.x86_64 1.8 MB/s | 339 kB     00:00
------------------------------------------------------------------
Total                             537 kB/s | 339 kB     00:00
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                          1/1
  Installing       : initscripts-10.00.15-1.el8.x86_64        1/1
  Running scriptlet: initscripts-10.00.15-1.el8.x86_64        1/1
  Verifying        : initscripts-10.00.15-1.el8.x86_64        1/1
Installed products updated.

Installed:
  initscripts-10.00.15-1.el8.x86_64

Complete!
```

#	语法格式

ipcalc [参数] [IP地址]

#	常用参数

```bash
[root@localhost ~]# ipcalc
ipcalc: ip address expected
Usage: ipcalc [OPTION...]
  -c, --check         Validate IP address for specified address family
  -4, --ipv4          IPv4 address family (default)
  -6, --ipv6          IPv6 address family
  -b, --broadcast     Display calculated broadcast address
  -h, --hostname      Show hostname determined via DNS
  -m, --netmask       Display default netmask for IP (class A, B, or C)
  -n, --network       Display network address
  -p, --prefix        Display network prefix
  -s, --silent        Don't ever display error messages

Help options:
  -?, --help          Show this help message
  --usage             Display brief usage message
```

| -b     | 由给定的IP地址和网络掩码计算出广播地址 |
| ------ | -------------------------------------- |
| -h     | 显示给定IP地址所对应的主机名           |
| -m     | 由给定的IP地址计算器网络掩码           |
| -p     | 显示给定的掩码或IP地址的前缀           |
| -n     | 由给定的IP地址和网络掩码计算网络地址   |
| -s     | 安静模式，不显示任何错误信息           |
| --help | 显示帮助信息                           |

#	参考实例

1. 计算给定掩码的前缀 ：

   ```bash
   [root@localhost ~]# ipcalc -p 192.168.142.135 255.255.255.0
   PREFIX=24
   ```

2. 给定IP和网络掩码计算网络地址 ：

   ```bash
   [root@localhost ~]# ipcalc -n 192.168.142.135 255.255.255.0
   NETWORK=192.168.142.0
   ```

3. 给定IP显示对应的主机名：

   ```bash
   [root@localhost ~]# ipcalc -h 192.168.142.135
   HOSTNAME=localhost.localdomain
   ```

4. 使用多个参数计算给定IP的网络掩码，广播地址，网络地址：

   ```bash
   [root@localhost ~]# ipcalc -m -b -n 192.168.142.135/21
   NETMASK=255.255.248.0
   BROADCAST=192.168.143.255
   NETWORK=192.168.136.0
   ```

   
