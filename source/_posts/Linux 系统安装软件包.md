---
title: Linux 系统安装软件包
date: 2022-03-21 15:57:11
categories:
  - Linux 教程
tags:
  - Centos
  - Linux
  - alias
---



#	Linux 系统安装软件包

安装开发过程中需要用到的软件。不同的开发需要的软件不一样，但安装方法相同。

<!--more-->

1. Centos：以安装rpm-build软件为例。

   1. 执行**dnf list installed | grep ***rpm-build* 查询rpm-build软件是否已安装。

      ```c
      $ dnf list installed | grep rpm-build
      ```

      查看命令打印信息，若打印信息中包含“rpm-build”，表示该软件已经安装了，则不需要再安装。若无任何打印信息，则表示该软件未安装。

   2. 清除缓存。

      ```c
      $ dnf clean all
      ```

   3. 创建缓存。

      ```c
      $ dnf makecache
      ```

   4. 安装rpm-build软件包。

      ```c
      $ dnf install rpm-build
      ```

   5. 查询rpm-build软件版本。

      ```c
      $ rpmbuild --version
      ```

2. Ubuntu：待更新～

