---
title: koji 命令详解
date: 2022-03-21 10:31:23
categories:
  - Linux 教程
tag:
  - Linux
  - koji
  - Centos
---



#	koji

Koji 是用于构建 RPM 包的软件。 它使用 Mock 创建 chroot 环境来执行构建。

<!--more-->

#	koji 安装

1. 安装koji软件包及相关软件包

   ```c
   [root@localhost ~]# dnf install koji
   ```

2. 修改koji配置文件 `vim /etc/koji.conf` （URL可自行修改）

   ```c
   [koji]
   server = http://192.168.102.149/kojihub
   weburl = http://192.168.102.149/koji
   KeycloakCert = True
   topurl = http://192.168.102.149/kojifiles
   topdir = /mnt/koji
   ```



#	语法格式

用法： koji [global-options] command [command-options-and-arguments]



#	常用参数

```c
admin commands:
        add-external-repo         Create an external repo and/or add one to a tag
        add-group                 Add a group to a tag
        add-group-pkg             Add a package to a group's package listing
        add-group-req             Add a group to a group's required list
        add-host                  Add a host
        add-host-to-channel       Add a host to a channel
        add-pkg                   Add a package to the listing for tag
        add-tag                   Add a new tag to the database
        add-tag-inheritance       Add to a tag's inheritance
        add-target                Create a new build target
        add-user                  Add a user
        add-volume                Add a new storage volume
        assign-task               Assign a task to a host
        block-group               Block group in tag
        block-group-pkg           Block a package from a group's package listing
        block-group-req           Block a group's requirement listing
        block-pkg                 Block a package in the listing for tag
        clone-tag                 Duplicate the contents of one tag onto another tag
        disable-host              Mark one or more hosts as disabled
        disable-user              Disable logins by a user
        edit-external-repo        Edit data for an external repo
        edit-host                 Edit a host
        edit-tag                  Alter tag information
        edit-tag-inheritance      Edit tag inheritance
        edit-target               Set the name, build_tag, and/or dest_tag of an existing build target to new values
        edit-user                 Alter user information
        enable-host               Mark one or more hosts as enabled
        enable-user               Enable logins by a user
        free-task                 Free a task
        grant-cg-access           Add a user to a content generator
        grant-permission          Grant a permission to a user
        import                    Import externally built RPMs into the database
        import-archive            Import an archive file and associate it with a build
        import-cg                 Import external builds with rich metadata
        import-sig                Import signatures into the database and write signed RPMs
        list-signed               List signed copies of rpms
        lock-tag                  Lock a tag
        make-task                 Create an arbitrary task
        prune-signed-copies       Prune signed copies
        regen-repo                Force a repo to be regenerated
        remove-channel            Remove a channel entirely
        remove-external-repo      Remove an external repo from a tag or tags, or remove entirely
        remove-group              Remove group from tag
        remove-host-from-channel  Remove a host from a channel
        remove-pkg                Remove a package from the listing for tag
        remove-tag                Remove a tag
        remove-tag-inheritance    Remove a tag inheritance link
        remove-target             Remove a build target
        rename-channel            Rename a channel
        restart-hosts             Restart enabled hosts
        revoke-cg-access          Remove a user from a content generator
        revoke-permission         Revoke a permission from a user
        set-build-volume          Move a build to a different volume
        set-pkg-arches            Set the list of extra arches for a package
        set-pkg-owner             Set the owner for a package
        set-pkg-owner-global      Set the owner for a package globally
        set-task-priority         Set task priority
        unblock-group-pkg         Unblock a package from a group's package listing
        unblock-group-req         Unblock a group's requirement listing
        unblock-pkg               Unblock a package in the listing for tag
        unlock-tag                Unlock a tag
        write-signed-rpm          Write signed RPMs to disk

bind commands:
        move-build                'Move' one or more builds between tags
        tag-build                 Apply a tag to one or more builds
        untag-build               Remove a tag from one or more builds

build commands:
        build                     Build a package from source
        cancel                    Cancel tasks and/or builds
        chain-build               Build one or more packages from source
        image-build               Create a disk image given an install tree
        image-build-indirection   Create a disk image using other disk images via the Indirection plugin
        maven-build               Build a Maven package from source
        maven-chain               Run a set of Maven builds in dependency order
        resubmit                  Retry a canceled or failed task, using the same parameter as the original task.
        spin-appliance            Create an appliance given a kickstart file
        spin-livecd               Create a live CD image given a kickstart file
        spin-livemedia            Create a livemedia image given a kickstart file
        win-build                 Build a Windows package from source
        wrapper-rpm               Build wrapper rpms for any archives associated with a build.

download commands:
        download-build            Download a built package
        download-logs             Download a logs for package
        download-task             Download the output of a build task

info commands:
        buildinfo                 Print basic information about a build
        help                      List available commands
        hostinfo                  Print basic information about a host
        latest-build              Print the latest builds for a tag
        list-api                  Print the list of XML-RPC APIs
        list-buildroot            List the rpms used in or built in a buildroot
        list-builds               Print the build listing
        list-channels             Print channels listing
        list-external-repos       List external repos
        list-groups               Print the group listings
        list-history              Display historical data
        list-hosts                Print the host listing
        list-permissions          List user permissions
        list-pkgs                 Print the package listing for tag or for owner
        list-tag-inheritance      Print the inheritance information for a tag
        list-tagged               List the builds or rpms in a tag
        list-tags                 Print the list of tags
        list-targets              List the build targets
        list-tasks                Print the list of tasks
        list-untagged             List untagged builds
        list-volumes              List storage volumes
        mock-config               Create a mock config
        rpminfo                   Print basic information about an RPM
        show-groups               Show groups data for a tag
        taginfo                   Print basic information about a tag
        taskinfo                  Show information about a task

miscellaneous commands:
        call                      Execute an arbitrary XML-RPC call
        dist-repo                 Create a yum repo with distribution options
        import-comps              Import group/package information from a comps file
        moshimoshi                Introduce yourself
        version                   Report client and hub versions

monitor commands:
        add-notification          Add user's notification
        block-notification        Block user's notifications
        edit-notification         Edit user's notification
        list-notifications        List user's notifications and blocks
        remove-notification       Remove user's notifications
        unblock-notification      Unblock user's notification
        wait-repo                 Wait for a repo to be regenerated
        watch-logs                Watch logs in realtime
        watch-task                Track progress of particular tasks

search commands:
        search                    Search the system
```



#	参考实例

1. 临时编译

   ```c
   koji --user $name --password $passwd build $tag --scratch --nowait $src_rpm
   ```

2. 编译入库

   ```c
   koji --user $name --password $passwd build $tag --nowait $src_rpm
   ```

3. 添加 tag

   ```c
   koji --user $name --password $passwd tag-build $tag zip-1.0.1-1.el8
   ```



详细信息可参考：

[Fedora Koji Wiki](https://fedoraproject.org/wiki/Koji)

[koji 命令总结](https://blog.csdn.net/zhangna20151015/article/details/86236281)

