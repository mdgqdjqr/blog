---
title: Linux Centos 忘记密码解决方法
date: 2022-03-021 15:30:23
categories:
  - Linux 教程
tag:
  - Linux
  - Centos
  - 密码
---



很多同学经常会忘记Linux系统的用户密码，忘记密码的情况该怎么办呢？

<!--more-->

一般情况下，忘记密码有两种，忘记忘记超级用户密码和普通用户密码，本文将分别介绍解决方法；

解决方法如下：



# 超级用户忘记密码

1. 在开机时进入到这个界面按上下键，打断其自动选择系统启动

   ![img](1.png)

2. 按e显示如下所示

   ![img](2.png)

   编辑可配置的项目，将红框内的内容改成rw rd.break，如下所示：

   ![img](3.png)

3. 根据上图提示，使用组合键CTRL+x进入到系统的紧急求援模式，如下所示：

   ![img](4.png)

4. 依次输入以下的命令配置新密码

   ```bash
   chroot /sysroot/                           ##进入shell模式
   passwd                                     ##配置新密码
   touch /.autorelabel                        ##建立新的SELinux安全脉络
   exit                                       ##退出shell模式
   exit                                       ##退出编辑
   ```

   如下图所示：

   ![img](5.png)

5. 重启过程有点慢，需要耐心等一会儿，重启之后就可以使用刚才重置的密码登录了

   ![img](6.png)

   ![img](7.png)

6. 到此，就成功修改超级用户登录密码了！



# 普通用户忘记密码

解决方法较为简单，使用超级用户身份登录后，修改普通用户的密码

```bash
passwd username         ##加上需要配置的用户名称
```

 如下所示：

```bash
[root@localhost ~]# passwd miya
Changing password for user miya.
New password:
Retype new password:
passwd: all authentication tokens updated successfully.
```

![img](8.png)

![img](9.png)

 到此，就成功修改普通用户登录密码了！

若以上方法不生效也可参考：[CentOS7忘记root密码，重置root密码](https://blog.csdn.net/gnail_oug/article/details/94721777)