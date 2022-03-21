---
title: 配置系统本地和远端repo源
date: 2022-03-21 13:19:11
categories:
  - Linux 教程
tags:
  - Centos
  - Linux
  - repo
---



# 配置系统本地和远端repo源

可以通过直接获取 repo 源文件的方式配置 repo 源或通过挂载 ISO 的方式配置 repo 源。

<!--more-->

#	**方式一：通过直接获取repo源文件的方式配置repo源。**

1. 配置yum所需的gpg公钥

   ```bash
   $ cd /etc/pki/rpm-gpg
   $ wget https://repo.openeuler.org/openEuler-20.03-LTS/OS/aarch64/RPM-GPG-KEY-openEuler
   ```

2. 进入到yum源目录。

   ```bash
   $ cd /etc/yum.repos.d
   ```

3. 新建local.repo文件并编辑local.repo，将repo源文件配置为yum源。

   ```bash
   $ vi local.repo
   ```

   编辑local.repo文件的内容如下：

   ```bash
   [basiclocal]
   name=basiclocal
   baseurl=http://repo.openeuler.org/openEuler-20.03-LTS/OS/aarch64/
   enabled=1
   gpgcheck=1
   gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-openEuler
   
   [srclocal]
   name=srclocal
   baseurl=http://repo.openeuler.org/openEuler-20.03-LTS/source/
   enabled=1
   gpgcheck=1
   gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-openEuler
   
   [everythinglocal]
   name=everythinglocal
   baseurl=http://repo.openeuler.org/openEuler-20.03-LTS/everything/aarch64/
   enabled=1
   gpgcheck=1
   gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-openEuler
   ```

#	**方式二：通过挂载ISO的方式配置repo源。**

1. 下载ISO。

   - 创建存放ISO的目录。

     ```bash
     $ mkdir /home/basiciso
     $ mkdir /home/everythingiso
     $ mkdir /home/srciso
     ```

   - 登录openEuler社区，网址为：[https://openeuler.org](https://openeuler.org/)。

   - 单击“下载”，进入下载页面。

   - 单击“获取ISO：”后面的“Link”，显示版本列表。

   - 选择需要下载的版本，如openEuler 20.03 LTS，则单击“openEuler-20.03-LTS”，进入下载列表。

   - 单击“ISO”，进入ISO下载列表。

     - aarch64：AArch64架构的ISO。
     - x86_64：x86_64架构的ISO。
     - source：openEuler源码ISO。

   - 单击“aarch64”，进入AArch64架构的ISO下载列表。

   - 右键单击“openEuler-20.03-LTS-aarch64-dvd.iso”，单击“复制链接地址”，将openEuler基础ISO地址记录好。

   - 右键单击“openEuler-20.03-LTS-everything-aarch64-dvd.iso”，单击“复制链接地址”，将openEuler全量ISO地址记录好。

   - 返回到“ISO”，单击“source”。

   - 右键单击“openEuler-20.03-LTS-source-dvd.iso”，单击“复制链接地址”，将openEuler源码ISO地址记录好。

   - 使用**wget**命令远程下载ISO文件到开发环境，命令中的 *ipaddriso_ basiceverything* 、 *ipaddriso_everything* 和 *ipaddriso_source* 分别为[1.8](https://gitee.com/openeuler/community/blob/master/zh/contributors/prepare-environment.md#li45321952115717)、[1.9](https://gitee.com/openeuler/community/blob/master/zh/contributors/prepare-environment.md#li98171862002)和[1.11](https://gitee.com/openeuler/community/blob/master/zh/contributors/prepare-environment.md#li121355504292)中记录的地址。

     ```bash
     $ cd /home/basiciso
     $ wget ipaddriso_basic
     $ cd /home/everythingiso
     $ wget ipaddriso_everything
     $ cd /home/srciso
     $ wget ipaddriso_source
     ```

2. 挂载ISO。

   - 创建挂载点。

     ```bash
     $ mkdir /mnt/basicdvd
     $ mkdir /mnt/everythingdvd
     $ mkdir /mnt/srcdvd
     ```

   - 执行**mount**命令，将iso分别挂载到挂载点。

     ```bash
     $ mount /home/basiciso /mnt/basicdvd
     $ mount /home/everythingiso /mnt/everythingdvd
     $ mount /home/srciso /mnt/srcdvd
     ```

   - 执行**df -h**命令，查看挂载是否成功。

     若打印信息中包含/mnt/basicdvd，/mnt/everythingdvd，/mnt/srcdvd，则表示已挂载成功。若挂载点未出现在打印信息中，则表示该挂载点挂载失败，需要执行**mount**命令，重新刷新该挂载点。

     ```bash
     $ df -h
     ```

3. repo源配置为yum源

   1. 进入到yum源目录。

      ```bash
      $ cd /etc/yum.repos.d
      ```

   2. 新建local.repo文件并编辑local.repo，将挂载的3个ISO配置为yum源。

      ```bash
      $ vi local.repo
      ```

      编辑local.repo文件的内容如下：

      ```bash
      [basicisolocal]
      name=basicisolocal
      baseurl=file:///mnt/basicdvd
      enabled=1
      gpgcheck=0
      
      [everythingisolocal]
      name=everythingisolocal
      baseurl=file:///mnt/everythingdvd
      enabled=1
      gpgcheck=0
      
      [srcisolocal]
      name=srcisolocal
      baseurl=file:///mnt/srcdvd
      enabled=1
      gpgcheck=0
      ```

      