---
title: alias 命令详解
date: 2022-03-09 15:57:11
categories:
  - Linux 教程
tags:
  - Centos
  - Linux
  - alias
---



#	alias

alias命令：设置指令的别名。

<!--more-->



#	alias 安装

alias 为 bash 提供的命令，默认系统便已安装。



#	alias 语法格式

```
alias [别名]=[指令名称]
```

补充说明：用户可利用 alias 自定指令的别名。若仅输入alias，则可列出目前所有的别名设置；alias的效力仅及于该次登入的操作。若要每次登入时即自动设好别名，可在 .profile 或 .bashrc 中设定指令的别名。



#	参考实例

1. 不加任何参数，则列出目前所有的别名设置

   ```c
   [root@localhost ~]# alias 
   alias cp='cp -i'
   alias egrep='egrep --color=auto'
   alias fgrep='fgrep --color=auto'
   alias grep='grep --color=auto'
   alias l.='ls -d .* --color=auto'
   alias ll='ls -l --color=auto'
   alias ls='ls --color=auto'
   ```

2. 添加参数，设置别名

   ```c
   alias vi='vim'
   alias rpm='rpm -D "_topdir `pwd`"'
   alias rpmbuild='rpmbuild -D "_topdir `pwd`"'
   ```

3. 永久设置别名

   编辑用户的环境变量文件 .bash_profile，添加如下内容。

   ```c
   alias sc="source ~/.bash_profile"
   alias p="ps -u $USER"
   ```

   保存后退出，然后执行 `source .bash_profile`，重新载入环境变量文件。

   这时你就可以在当前用户下使用 sc 这个别名作为命令，它就等效你执行 `source ~/.bash_profile` 命令。
