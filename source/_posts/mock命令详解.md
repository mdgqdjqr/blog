---
title: mock 命令详解
date: 2022-03-21 10:57:23
categories:
  - Linux 教程
tags:
  - Centos
  - Linux
  - mock
---



#	mock

mock：用于软件包构建的最小环境

<!--mock-->

#	mock 安装配置

1. 安装 mock 及其相关软件包

   ```c
   dnf install mock
   ```

2. 安装 koji 客户端，并修改配置文件

   方法见：[koji 命令详解](https://mdgqdjqr.github.io/blog/2022/03/21/koji%E5%91%BD%E4%BB%A4%E8%AF%A6%E8%A7%A3/)

3. 配置用户

   ```c
   useradd pungi
   usermod -a -G mock pungi	#将pungi添加到mock组中
   ```

4. 生成 mock 配置文件

   1. 利用koji任务编号获取配置文件

      ```c
      koji mock-config --tag=$tag --arch=x86_64 --task=160314 --latest -n $name >  /etc/mock/$name.cfg
      koji mock-config --tag=$tag --arch=aarch64 --task=161890 --latest -n $name > /etc/mock/$name.cfg
      ```

   2. 手动编写配置文件

      `vim /etc/mock/pungi.cfg`（名字、URL、安装的软件包可自行修改）

      ```c
      config_opts['basedir'] = '/var/lib/mock'
      config_opts['chroot_setup_cmd'] = 'groupinstall build'
      #config_opts['chroot_setup_cmd'] = 'install bash bzip2 coreutils cpio diffutils findutils gawk gcc gcc-c++ gdb gettext git grep gzip info kernel-rpm-macros kylin-release kylin-rpm-config  make patch rpm-build sed tar unzip util-linux which xz'
      config_opts['target_arch'] = 'x86_64'
      config_opts['root'] = 'pungi'
      
      config_opts['plugin_conf']['bind_mount_enable'] = True
      config_opts['plugin_conf']['bind_mount_opts']['dirs'].append(('/dev','/dev/'))
      config_opts['plugin_conf']['bind_mount_opts']['dirs'].append(('/dev/pts','/dev/pts/'))
      config_opts['plugin_conf']['bind_mount_opts']['dirs'].append(('/dev/shm','/dev/shm/'))
      
      config_opts['yum.conf'] = """
      
      [main]
      cachedir=/var/cache/yum
      debuglevel=1
      logfile=/var/log/yum.log
      reposdir=/dev/null
      retries=20
      obsoletes=1
      gpgcheck=0
      assumeyes=1
      
      # repos
      [build0]
      tag=build0
      baseurl=http://192.168.102.149/kojifiles/repos/$tag/latest/x86_64/
      """
      ```

      

5. 初始化mock环境

   ```c
   注意：下文均以/etc/mock/pungi.cfg为例演示
   su pungi -c "mock -r pungi init"
   
   若初始化过程中报环境变量相关错误，执行export PATH=/usr/bin/:$PATH更新环境变量
   ```

6. 安装软件包到mock环境

   ```c
   cd /var/lib/mock/pungi/root
   yum --installroot=`pwd` install vim yum-utils koji wget lrzsz createrepo scp genisoimage
   ```

7. 进入mock环境

   ```c
   cd /var/lib/mock/pungi/root
   chroot .
   
   注：有需要可指定环境变量export HOME=/builddir
   ```

8. 至此mock环境可正常使用啦！

   ```c
   注意：若初始化过程中显示useradd 的-n参数执行失败，可删除该参数
   vim /usr/lib/python3.7/site-packages/mockbuild/util.py +1100
   ```



#	参考实例

1. 初始化mock环境

   ```c
   su pungi -c "mock -r pungi init"
   ```

2. 清除已存在的mock环境

   ```bash
   su pungi -c "mock -r pungi --clean"
   ```

3. 挂载目录

   ```bash
   mount -t proc /proc proc
   mount --rbind /sys sys
   mount --rbind /dev dev
   ```

   