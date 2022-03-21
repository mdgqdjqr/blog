---
title: mash 命令详解
date: 2022-01-01 14:15:23
categories:
  - Linux 教程
tags:
  - Centos
  - Linux
  - mash
---

# mash

mash 命令：导出仓库软件包工具。

<!--more-->

系统环境：

| 项目     | 版本                            |
| -------- | ------------------------------- |
| Centos 8 | CentOS-8.2.2004-x86_64-dvd1.iso |


# mash安装使用

1. 安装mash软件包

   `dnf install mash`

2. 修改mash配置文件

   - 配置 `mash.conf`，主要是配置koji路径 `vim /etc/mash/mash.conf` ，以 `IP:192.168.102.128` 为例

     ```bash
     [defaults]
     use_sqlite = True
     use_repoview = False
     buildhost = http://192.168.102.128/kojihub
     repodir = http://192.168.102.128/kojifiles
     configdir = /etc/mash
     ```

   - 编写需要导出仓库 `tag` 的配置文件，以 `test_demo`为例 `vim /etc/mash/test-demo.mash`

     ```bash
     [test_demo]
     rpm_path = %(arch)s/Packages
     repodata_path = %(arch)s/
     source = True
     output_subdir = test_demo/rpms
     debuginfo = False
     multilib = True
     multilib_method = devel
     multilib_file = list_pkgs.test_demo
     tag = test_demo
     inherit = True
     strict_keys = True
     keys = #此处按需填写
     arches = x86_64
     delta = True
     max_delta_rpm_size = 800000000
     distro_tags = cpe:/o:centos:ns:test_demo Null
     black_list = hash_packages = False
     ```

3. mash的使用

   ```bash
   mash -o /mnt/koji/mash test_demo	#可以将tag=test_demo最新入库的rpm包导出到/mnt/koji/mash/test_demo/rpms目录下
   
   `mash`其他使用方式可以使用`mash --help`查看
   ```



#	mash软件包编译相关问题

```bash
Bytecompiling .py files below /root/rpmbuild/BUILDROOT/mash-0.6.02-1.el8.10.x86_64/usr/lib/python3.6 using /usr/libexec/platform-python
*** Error compiling '/root/rpmbuild/BUILDROOT/mash-0.6.02-1.el8.10.x86_64/usr/lib/python3.6/site-packages/mash/config.py'...
Sorry: TabError: inconsistent use of tabs and spaces in indentation (config.py, line 151)
```

在python3环境下编译软件包时，`tab` 或者`空格`分开使用，不要空格和tab混用



```bash
+ /usr/lib/rpm/redhat/brp-mangle-shebangs
mangling shebang in /usr/bin/mash from /usr/bin/python3 to #!/usr/libexec/platform-python
*** ERROR: ambiguous python shebang in /usr/share/mash/spam-o-matic: #!/usr/bin/python. Change it to python3 (or python2) explicitly.
error: Bad exit status from /var/tmp/rpm-tmp.Ip2foI (%install)
```

解释器需指定python3



```bash
  File "/usr/bin/mash", line 42
    print "ERROR: No configuration specified!\n"
                                               ^
SyntaxError: Missing parentheses in call to 'print'. Did you mean print("ERROR: No configuration specified!\n")?
```

python3下print语法稍有不同





