---
title: Hexo + GitHub 史上最全搭建个人 blog教程
date: 2022-03-01 15:30:23
categories:
  - Linux 教程
---


花了几天搭建了个网站，先上链接，欢迎来访：[史小胖的博客](https://mdgqdjqr.github.io/blog/)



由于希望搭建个人 `blog` ，现在市面上的博客很多，如 CSDN ，博客园，简书等平台，可以直接在上面发表，用户交互做的好，写的文章百度也能搜索的到。缺点是比较不自由，会受到平台的各种限制和恶心的广告。因而直接在 `github page` 平台上托管我们的博客，特写了这篇文章记录下来。

<!--more-->

教程共分四个部分：

- 第一部分：hexo 的初级搭建还有部署到 github page上，以及个人域名的绑定。
- 第二部分：hexo 的基本配置，更换主题，以及博客的简单美化。
- 第三部分：hexo 实现多终端工作。
- 第四部分：记录了一些在搭建过程中可能会遇到的问题及其解决方法。



搭建系统环境：

- 软件环境

  | 项目     | 版本                             | 系统环境        |
  | -------- | -------------------------------- | --------------- |
  | Centos 8 | CentOS-8.2.2004-x86_64-dvd1.iso  | Minimal Install |
  | ubuntu   | ubuntu-20.04.3-desktop-amd64.iso | 默认安装        |

- 硬件环境

  | 项目   | 配置         |
  | ------ | ------------ |
  | 内存   | 8 GB         |
  | 处理器 | 8            |
  | 硬盘   | 200 GB       |
  | 网络   | 可连接互联网 |
  
  

#	第一部分

`hexo` 的初级搭建还有部署到 `github page` 上，以及个人域名的绑定。



##	一、Hexo 简介

`Hexo` 是一款基于 `Node.js` 的静态博客框架，依赖少易于安装使用，可以方便的生成静态网页托管在 `GitHub` 和 `Coding` 上，是搭建博客的首选框架。大家可以进入 [hexo官网](https://hexo.io/zh-cn/) 进行详细查看，因为 `Hexo` 的创建者是台湾人，所以对中文的支持很友好，可以选择中文进行查看。而且 hexo 作为一个快速简洁的博客框架，用它来搭建博客真的非常容易。



##	二、Hexo 搭建步骤

1. 安装 `Git`
2. 安装 `Node 12`
3. 安装 `hexo`
4. 初始化 `hexo`
4. `GitHub` 创建个人仓库
4. 生成 `SSH` 添加到 `GitHub`
4. 将 `hexo` 部署到 `GitHub`
4. 设置个人域名



##	1.	安装 Git

`Git` 是目前世界上最先进的分布式版本控制系统，可以有效、高速的处理从很小到非常大的项目版本管理。也就是用来管理你的 `hexo` 博客文章，上传到 `GitHub` 的工具。`Git` 非常强大，建议每个人都去了解一下。

执行以下命令进行安装，安装好后，用`git --version` 来查看一下版本：

- centos 8.2

  ```bash
  dnf install git
  git --version
  ```

- ubuntu

  ```bash
  sudo apt-get install git
  git --version
  ```



##	2.	安装 Node 12

`Hexo` 是基于 `node.js` 编写的，所以需要安装 `node.js` 和里面的 `npm` 工具。

打开命令行，执行以下命令，安装完后，检查一下是否安装成功。

- centos 8.2

  ```bash
  dnf install curl -y
  curl -sL https://rpm.nodesource.com/setup_12.x | bash -
  dnf install nodejs -y
  npm install -g npm
  node -v
  npm -v
  ```

- ubuntu

  ```bash
  sudo apt-get install curl
  curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
  sudo apt-get install nodejs
  sudo npm install -g npm
  node -v
  npm -v
  ```



##	3.	安装 hexo

前面 `git` 和 `nodejs` 安装好后，执行以下命令就可以直接安装 `hexo` 了。

打开命令行，执行以下命令，安装完成后，检查是否安装成功。

- centos 8.2

  ```bash
  npm install -g hexo-cli
  hexo -v
  ```

- ubuntu

  ```bash
  sudo npm install -g hexo-cli
  hexo -v
  ```

至此就全部安装完了.



##	4.	初始化 hexo

接下来初始化 `hexo`，这个 `filename` 取什么名字都行，此文以 `blog` 为例。

```bash
hexo init blog
```

**注意centos 8.2 需关闭防火墙：**

- centos 8.2

  ```bash
  systemctl stop firewalld
  systemctl disable firewalld
  ```

进入blog目录：

```bash
cd blog/
npm install
```

打开 `hexo` 的服务：

```bash
hexo g
hexo s
```

在浏览器输入 `localhost:4000` 就可以看到你生成的博客了，如下所示：

![Hexo默认初始页面](Hexo默认初始页面.png)

`terminal` 使用 `ctrl+c` 可以把服务关掉。

`blog` 目录内容说明：

```bash
ls
_config.landscape.yml  _config.yml  db.json  node_modules  package.json  package-lock.json  public  scaffolds  source  themes
```

| 项目         | 说明               |
| ------------ | ------------------ |
| node_modules | 依赖包             |
| source       | 用来存放你的文章   |
| themes       | 主题               |
| _config.yml  | 博客的配置文件     |
| public       | 存放生成的页面     |
| scaffolds    | 生成文章的一些模板 |



##	5.	GitHub 创建个人仓库

前置条件：有 `GitHub` 账户，没有的话，需要先注册 `GitHub` 账号。

登录 `GitHub` 后，在 `GitHub.com` 中找到 `New repository`，新建仓库

![GitHub新建仓库](GitHub新建仓库.png)

创建 `blog` 仓库，点击 `create repository`。

![GitHub新建blog仓库](GitHub新建blog仓库.png)



##	6.	生成 SSH 添加到 GitHub

配置 `git` ，这里的 `youremail` 输入你 `GitHub` 的邮箱。这样 `GitHub` 才能知道你是不是对应它的账户。

打开命令行，执行以下命令：

```bash
git config --global user.name "yourname"
git config --global user.email "youremail"
```

执行以下命令，可以用以下两条，检查 `git` 配置是否正确。

```bash
git config user.name
git config user.email
```

执行以下命令，创建 `SSH`，一路回车。

```bash
ssh-keygen -t rsa -C "youremail"
```

而后在 `GitHub` 的 `setting` 中，找到 `SSH keys` 的设置选项，点击`New SSH key`，执行`cat ~/.ssh/id_rsa.pub`，并把`id_rsa.pub`里面的信息复制进去。

![GitHub添加sshkey](GitHub添加sshkey.png)

打开命令行，执行以下命令，查看是否成功。

```bash
ssh -T git@github.com
```



##	7.	将 hexo 部署到 GitHub

1. 这一步，将 `hexo` 和 `GitHub` 关联起来，也就是将本地 `blog` 目录内容部署到 `GitHub` 上，打开 `hexo` 网站配置文件 `blog/_config.yml`，翻到最后，修改为以下内容：

   ```bash
   # Deployment
   ## Docs: https://hexo.io/docs/one-command-deployment
   deploy:
     type: git
     repo: git@github.com:mdgqdjqr/blog.git
     branch: master
   ```

2. 安装用于发布文章的 `git`：

   ```bash
   cd blog/
   npm install hexo-deployer-git --save
   ```

3. 推送到 `github`：

   ```bash
   cd blog/
   hexo clean && hexo g && hexo d
   ```



##	8.	设置个人域名

现在你的个人网站的地址是 `yourname.github.io`，如果觉得这个网址逼格不太够，这就需要你设置个人域名了。但是需要花钱。

登陆 GitHub，进入 blog仓库 点击 `Settings -> GitHub Pages`

![GitHub-pages设置个人域名](hexo\GitHub-pages设置个人域名.png)

此时已经有个一个相当于个人网站的东西，图中绿色部分的地址点击即可访问



#	第二部分

`hexo` 的基本配置，更换主题，以及博客的简单美化。

##	1.	hexo 基本配置介绍

在文件根目录下的`_config.yml`，就是整个 `hexo` 框架的配置文件了。可以在里面修改大部分的配置。详细可参考 [官方的配置](https://hexo.io/zh-cn/docs/configuration) 描述。

### 网站

| 参数          | 描述                                                         |
| ------------- | ------------------------------------------------------------ |
| `title`       | 网站标题                                                     |
| `subtitle`    | 网站副标题                                                   |
| `description` | 网站描述                                                     |
| `author`      | 您的名字                                                     |
| `language`    | 网站使用的语言                                               |
| `timezone`    | 网站时区。`Hexo` 默认使用您电脑的时区。[时区列表](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones)。比如说：`America/New_York`, `Japan`, 和 `UTC` 。 |

其中，`description`主要用于 `SEO`，告诉搜索引擎一个关于您站点的简单描述，通常建议在其中包含您网站的关键词。`author`参数用于主题显示文章的作者。



### 网址

| 参数                 | 描述                                                         |
| -------------------- | ------------------------------------------------------------ |
| `url`                | 网址，在这里，你需要把`url`改成你的网站域名。可更改为blog的GitHub Page网址 |
| `root`               | 网站根目录                                                   |
| `permalink`          | 文章的 [永久链接](https://hexo.io/zh-cn/docs/permalinks) 格式，也就是你生成某个文章时的那个链接格式。 |
| `permalink_defaults` | 永久链接中各部分的默认值                                     |

以下是官方给出的示例，关于链接的变量还有很多，需要的可以去官网上查找 [永久链接](https://hexo.io/zh-cn/docs/permalinks) 。

| 参数                          | 结果                        |
| ----------------------------- | --------------------------- |
| :year/:month/:day/:title/     | 2013/07/14/hello-world      |
| :year-:month-:day-:title.html | 2013-07-14-hello-world.html |
| :category/:title              | foo/bar/hello-world         |

再往下翻，中间这些都默认就好了。

```
theme: landscape

# Deployment
## Docs: https://hexo.io/docs/deployment.html
deploy:
  type: git
  repo: <repository url>
  branch: [branch]
```

`theme` 就是选择什么主题，也就是在 `theme` 这个文件夹下，在官网上有很多个主题，默认安装的是 `lanscape` 这个主题。当你需要更换主题时，在官网上下载，把主题的文件放在 `theme` 文件夹下，修改这个参数为对应的名字就可以了。

接下来这个 `deploy` 就是网站的部署的，`repo` 就是仓库 (`Repository`) 的简写。`branch` 选择仓库的哪个分支。这个在之前进行 `github page` 部署的时候已经修改过了，不再赘述。而这个在后面进行双平台部署的时候会再次用到。



###	Front-matter

Front-matter 是文件最上方以 --- 分隔的区域，用于指定个别文件的变量，举例来说：

```bash
title: Hello World
date: 2013/7/13 20:46:25
---
```

下是预先定义的参数，您可在模板中使用这些参数值并加以利用。

| 参数         | 描述                 |
| ------------ | -------------------- |
| `layout`     | 布局                 |
| `title`      | 标题                 |
| `date`       | 建立日期             |
| `updated`    | 更新日期             |
| `comments`   | 开启文章的评论功能   |
| `tags`       | 标签（不适用于分页） |
| `categories` | 分类（不适用于分页） |
| `permalink`  | 覆盖文章网址         |


其中，分类和标签需要区别一下，分类具有顺序性和层次性，也就是说 Foo, Bar 不等于 Bar, Foo；而标签没有顺序和层次。

```bash
categories:
- Diary
  tags:
- PS3
- Games
```



###	layout（布局）

当你每一次使用代码

```bash
hexo new paper
```

它其实默认使用的是 `post` 这个布局，也就是在 `source` 文件夹下的 _post 里面。

`Hexo` 有三种默认布局：`post`、`page` 和 `draft`，它们分别对应不同的路径，而您自定义的其他布局和 `post` 相同，都将储存到 `source/_posts` 文件夹。

| 布局    | 路径           |
| ------- | -------------- |
| `post`  | source/_posts  |
| `page`  | source         |
| `draft` | source/_drafts |


而 `new` 这个命令其实是：

```bash
hexo new [layout] <title>
```

只不过这个 `layout` 默认是 `post` 罢了。



###	page

如果你想另起一页，那么可以使用

```bash
hexo new page board
```

系统会自动给你在 `source` 文件夹下创建一个 `board` 文件夹，以及 `board` 文件夹中的 `index.md` ，这样你访问的 `board` 对应的链接就是 http://xxx.xxx/board



###	draft
`draft` 是草稿的意思，也就是你如果想写文章，又不希望被看到，那么可以

```bash
hexo new draft newpage
```

这样会在 `source/_draft` 中新建一个 `newpage.md` 文件，如果你的草稿文件写的过程中，想要预览一下，那么可以使用

```bash
hexo server --draft
```

在本地端口中开启服务预览。

如果你的草稿文件写完了，想要发表到post中，

```bash
hexo publish draft newpage
```

就会自动把 `newpage.md` 发送到 `post` 中。



##	2.	blog 更换主题

如果你觉得默认的`landscape`主题不好看，那么可以在官网的主题中，选择你喜欢的一个主题进行修改就可以啦。[点这里](https://hexo.io/themes/)。

![hexo网站主题大全](hexo网站主题大全.png)

这里有200多个主题可以选。不过最受欢迎的就是那么几个，比如 [NexT主题](https://github.com/theme-next/hexo-theme-next)，非常的简洁好看。[Next主题](https://github.com/theme-next/hexo-theme-next) 是 [Github](https://so.csdn.net/so/search?q=Github&spm=1001.2101.3001.7020) 上 `Star` 最多的主题，其一直在更新维护，支持非常多的外部插件和功能选项，因此我目前使用的也是 `Next`。

![hexo主题-next](hexo主题-next.png)

直接在 `github` 链接上把源码下载下来解压，放到 `blog/theme` 文件夹下，并修改为自己想要的名字，本文以修改为 `Next` 为例。

然后修改 `hexo` 的基本配置文件 `blog/_config.yml` 把 `theme` 默认主题名字换成 `Next` ，它就会自动在 `theme` 文件夹中搜索你配置的主题，修改如下所示：

```bash
# theme: landscape
theme: Next
```

即可将 `Hexo` 博客主题替换为 `Next` 主题。

在 `blog/themes/Next` 目录可以看到里面也有一个配置文件 `_config.xml`，这个配置文件是修改你 `Next` 主题的配置文件。



##	3.	Next 主题美化



###	3.1	主题简单配置

`Next` 主题提供很多方便的功能，我们来一一介绍：



####	3.1.1	Next主题风格

`Next` 提供了四中主题风格 `scheme`，可以在主题配置文件 `blog/themes/Next/_config.yml` 文件中进行选择，分别是`Muse`、`Mist`、`Pisces`、`Gemini`：

```bash
# Schemes
scheme: Muse
#scheme: Mist
#scheme: Pisces
#scheme: Gemini
```

这里我选择的是 `Gemini` 主题，也就是最后一种样式，如下：

![莫的感情的机器人初创主页](莫的感情的机器人初创主页.png)



####	3.1.2	Next 主题一般设置

`Next` 主题 `blog/themes/NEXT/_config.yml` 的一般设置：

```bash
cache:
	enable:true	# 表示添加缓存功能，这样浏览器后续打开我们的博客网站会更快
	
menu:	# 设置博客各个页面的相对路径，默认根路径是blog/source
  home: / || home
  about: /about/ || user
  tags: /tags/ || tags
  categories: /categories/ || th
  archives: /archives/ || archive
  #schedule: /schedule/ || calendar	# 日历
  #sitemap: /sitemap.xml || sitemap	# 站点地图，供搜索引擎爬取
  #commonweal: /404/ || heartbeat	# 腾讯公益404

menu_settings:
  icons: true	# 是否显示各个页面的图标
  badges: true	# 是否显示分类/标签/归档页的内容量

scheme: Gemini
```

以上是 `Next` 最常规的配置，而相应的站点配置 `blog/_config.yml` 文件的基本配置为：

```shell
title: 莫得感情的机器人
subtitle: '记录点点滴滴的知识'
description: '微笑'
keywords:
author: mdgqdjqr
language: zh-CN # 主题语言
timezone: Asia/Shanghai #中国的时区，不要乱改城市

url: https://mdgqdjqr.github.io/blog/ #绑定域名
permalink: :year/:month/:day/:title/
permalink_defaults:

# Directory
source_dir: source
public_dir: public
tag_dir: tags
archive_dir: archives
category_dir: categories
code_dir: downloads/code
i18n_dir: :lang
skip_render: README.md # 部署的时候不包含的文件

# Writing
new_post_name: :title.md # 默认的新博文名称
default_layout: post # 默认布局
titlecase: false # Transform title into titlecase
external_link: true # Open external links in new tab
filename_case: 0 #把博客名称改成小写/大写（1,2）
render_drafts: false # 是否显示草稿
post_asset_folder: false #是否启用资源文件夹（用来存放相对路径图片或文件）
relative_link: false # 把链接改为与根目录的相对位址
future: true
highlight:
  enable: true #是否开启代码高亮
  line_number: true #是否增加代码行号
  auto_detect: true #自动判断代码语言
  tab_replace:
  
index_generator: #首页博客分布
  path: '' #博客的默认路径
  per_page: 10 #每页博客数量上限
  order_by: -date #博客排序

date_format: YYYY-MM-DD #博客日期格式
time_format: HH:mm:ss #博客时间格式

# Pagination
## Set per_page to 0 to disable pagination
per_page: 10 #同上

#归档页的分页设置
archive_generator: #归档页的配置
  per_page: 30 #归档页每页博客数
  yearly: true #按年归档
  monthly: true #按月归档
#标签页的分页设置
tag_generator:
  per_page: 20 #标签页每页博客数
  
theme: Next #选择博客主题，名字为themes中选择的主题文件夹名称

deploy: #博客部署
  type: git
  repo: 
    github: git@github.com:mdgqdjqr/blog.git
  branch: master
```



###	3.2	添加博客自定义图标

我们博客的默认图标是`N`，不过 `Next` 支持修改图标。

博客网站的图标可以在 [easyicon](https://www.easyicon.net/)、[bitbug](http://www.bitbug.net/)、[iconfont](https://www.iconfont.cn/plus/user/detail?uid=41718) 等网站选择和制作，然后选择或者创建相应大小的图标文件，放置在`blog/themes/Next/sources/images`目录下，并在主题配置文件中进行如下配置，只需要设置 small 和 medium 两个就可以：

```bash
favicon:
  small: /images/16x16.png
  medium: /images/32x32.png
  apple_touch_icon: /images/128x128.png
  safari_pinned_tab: /images/logo2.svg
```



###	3.3	作者头像设置

效果如下：

![Nest-头像](Nest-头像.png)

`blog/themes/NEXT/_config.yml` 可以设置当鼠标放置在头像上时，头像自动旋转，具体设置如下：

```bash
avatar:
  # url: #/images/avatar.gif
  url: /images/header.jpg	# 将我们的头像图片放置在blog/themes/next/source/images目录下，填写具体地址
  rounded: true	# 鼠标放在头像上时是否旋转
  rotated: true	# 头像是否设为圆形，否则为矩形
```



###	3.4	文章结束标志

效果如下：

![Next-文章结尾标志](Next-文章结尾标志.png)

在路径 `blog/themes/Next/layout/_macro` 中新建 `passage-end-tag.njk` 文件，并添加以下内容：

```bash
<div>
    {% if not is_index %}
        <div style="text-align:center;color: #ccc;font-size:14px;">-------------本文结束<i class="fa fa-paw"></i>感谢您的阅读-------------</div>
    {% endif %}
</div>
```

接着打开`blog/themes/Next/layout/_macro/post.njk`文件，在`post-body` 之后(`END POST BODY`)， `post-footer` 之前添加如下代码：

```bash
<div>
  {% if not is_index %}
    {% include 'passage-end-tag.njk' %}
  {% endif %}
</div>
```

然后打开主题配置文件（`blog/themes/NEXT/_config.yml`),在末尾添加：

```bash
# 文章末尾添加“本文结束”标记
passage_end_tag:
  enable: true
```



###	3.5	添加文章版权信息

效果如下：

![Next-文章版权信息](Next-文章版权信息.png)

要想开启博客的版权功能，需要修改主题配置文件 `blog/themes/NEXT/_config.yml`，去除注释：

```bash
creative_commons:
  license: by-nc-sa
  sidebar: true
  post: true
```



###	3.6	添加页面宠物

效果如下：

![Next-页面宠物](Next-页面宠物.png)

首先在博客目录下执行：

```bash
cd blog/
npm install -save hexo-helper-live2d
```

然后在**站点**配置文件中加入：

```bash
live2d:
  enable: true
  scriptFrom: local
  pluginRootPath: live2dw/
  pluginJsPath: lib/
  pluginModelPath: assets/
  tagMode: false
  model:
    use: live2d-widget-model-tororo  #选择哪种宠物模型
  display: #放置位置和大小
    position: right
    width: 150
    height: 300
  mobile:
    show: false #是否在手机端显示
```

上面模型的选择可在[lived2d](https://github.com/xiazeyu/live2d-widget-models)中选择，并下载相应的模型：

```bash
npm install live2d-widget-model-tororo
```



###	3.7	设置代码样式

效果如下：

![Next-设置代码样式](Next-设置代码样式.png)

代码块的行号显示在上面已经介绍了，位于站点配置文件，对于代码块的主题我们还能设置其背景，增加复制按钮等，可修改主题配置文件 `blog/themes/Next/_config.yml` 如下：

```bash
codeblock:
  highlight_theme: night
  border_radius:
  copy_button:
    enable: true
    show_result: true
```



###	3.8	添加搜索功能

效果如下：

![](搜索框.png)

安装 [hexo-generator-searchdb](https://links.jianshu.com/go?to=https%3A%2F%2Fgithub.com%2Fflashlab%2Fhexo-generator-search) 插件

```bash
cd blog
npm install hexo-generator-searchdb --save
```

打开站点配置文件 `blog/_config.yml`，找到 `Extensions` 在下面添加:

```bash
# 搜索
search:
  path: search.xml
  field: post
  format: html
  limit: 10000
```

同步修改主题配置文件 `blog/themes/Next/_config.yml`，搜索 `local_search`，修改 `enable` 为 `true`：

```bash
# Local Search
# Dependencies: https://github.com/next-theme/hexo-generator-searchdb
local_search:
  enable: true
```





###	3.9	添加文章分类

效果如下：

![Next-文章分类](Next-文章分类.png)

1. 打开命令行，执行以下命令：

   ```bash
   cd blog/
   hexo new page categories
   ```

2. 成功后会提示：

   ```
   INFO  Created: ~/blog/source/categories/index.md
   ```

3. 根据上面的路径，找到 `blog/source/categories/index.md` 这个文件，打开后默认内容是这样的：

   ```bash
   ---
   title: categories
   date: 2022-01-20 23:11:18
   ---
   ```

4. 修改后是这样的：

   ```bash
   ---
   title: 文章分类
   date: 2022-01-20 23:11:18
   type: "categories"
   ---
   ```

5. 给文章添加 "categories" 属性。

   打开需要添加分类的文章，为其添加 `categories` 属性。下方的 `categories: Linux 教程` 表示添加这篇文章到 "Linux 教程" 这个分类。

   注意：`hexo` 一篇文章只能属于一个分类，也就是说如果在 "- Linux 教程" 下方添加 "-xxx"，hexo 不会产生两个分类，而是把分类嵌套（即该文章属于 "- Linux 教程" 下的 "-xxx" 分类）。

   ```bash
   ---
   title: nslookup
   date: 2022-01-06 14:15:23
   categories:
     - Linux 教程
   ---
   ```

至此，成功给文章添加分类，点击首页的"分类"可以看到该分类下的所有文章。当然，只有添加了 `categories: xxx` 的文章才会被收录到首页的"分类"中。



###	3.10	添加文章标签

1. 打开命令行，执行以下命令：

   ```bash
   cd blog/
   hexo new page tags
   ```

2. 成功后会提示：

   ```bash
   INFO  Created: ~/blog/source/tags/index.md
   ```

3. 根据上面的路径，找到`index.md`这个文件，打开后默认内容是这样的：

   ```bash
   ---
   title: tags
   date: 2022-01-20 23:23:04
   ---
   ```

4. 修改后是这样的：

   ```bash
   ---
   title: 文章分类
   date: 2022-01-20 23:23:04
   type: "tags"
   ---
   ```

5. 给文章添加 "tags" 属性。

   打开需要添加标签的文章，为其添加tags属性。`tags:` 下方的 `- CentOS 8.2`就是这篇文章的标签了。

   ```bash
   ---
   title: nslookup
   date: 2022-01-06 14:15:23
   categories:
     - Linux 教程
   tags:
     - CentOS 8.2
   ---
   ```

至此，成功给文章添加分类，点击首页的“标签”可以看到该标签下的所有文章。当然，只有添加了`tags: xxx`的文章才会被收录到首页的“标签”中。



###	3.11	启用代码块复制功能

效果如下：

![Next-代码块复制功能](Next-代码块复制功能.png)

编辑 主题配置文件 `blog/themes/Next/_config.yml`，启用 `codeblock` 模块，如下：

```bash
codeblock:
  # Code Highlight theme
  # Available values: normal | night | night eighties | night blue | night bright | solarized | solarized dark | galactic
  # See: https://github.com/chriskempson/tomorrow-theme
  highlight_theme: night
  # Add copy button on codeblock
  copy_button:
    enable: true
    # Show text copy result.
    show_result: true
    # Available values: default | flat | mac
    style:
```



###	3.12	取消 "文章目录" 对标题的自动编号

效果如下：

![去除文章标号](去除文章标号.png)

编辑 主题配置文件 `blog/themes/NEXT/_config.yml`，取消 "文章目录" 对标题的自动编号。

```bash
toc:
  enable: true
  # Automatically add list number to toc.
  number: false
  # If true, all words will placed on next lines if header width longer then sidebar width.
  wrap: false
  # If true, all level of TOC in a post will be displayed, rather than the activated part of it.
  expand_all: false
  # Maximum heading depth of generated toc.
  max_depth: 6
```



###	3.13	设置blog首页显示文章摘要

效果如下：

![](设置文章摘要.png)

修改方法：文章内容中插入一行

```bash
<!--more-->
```

该行以上部分即为摘要显示内容，需点击阅读全文才能查看剩余的内容。



###	3.14	hexo 使用数学公式

效果如下：

![](hexo使用数学公式.png)

修改主题配置文件 `blog/themes/NEXT/_config.yml` 如下所示：

```bash
math:
  # Default (false) will load mathjax / katex script on demand.
  # That is it only render those page which has `mathjax: true` in front-matter.
  # If you set it to true, it will load mathjax / katex script EVERY PAGE.
  every_page: true

  mathjax:
    enable: true
    # Available values: none | ams | all
    tags: none

  katex:
    enable: false
    # See: https://github.com/KaTeX/KaTeX/tree/master/contrib/copy-tex
    copy_tex: false

```



###	3.15	文章插入本地图片

hexo 默认无法自动处理文章插入本地图片，需要通过扩展插件支持。

1. 开启站点配置文件 `blog/_config.yml`

   ```bash
   post_asset_folder: true
   ```

2. 安装插件

   ```bash
   npm install https://github.com/CodeFalling/hexo-asset-image --save
   注意不要用下面的命令，这个版本有bug
   npm install hexo-asset-image --save
   ```

3. 修改 hexo-asset-image 的 index.js 文件，即 `node_modules/hexo-asset-image/index.js`

   ```bash
   // $(this).attr('src', config.root + link + src);
   // console.info&&console.info("update link as:-->"+config.root + link + src);
   $(this).attr('src', '/' + link + src);
   console.info&&console.info("update link as:-->"+'/' + link + src);
   ```

4. 完成后即可在md文件中引用本地图片，格式如下：

   ```bash
   ![123](filename/123.jpg)：![标题](图片文件名)
   ```

   示例如下：

   ![](hexo插入本地图片.png)




#	第三部分

问题来了，如果你现在在自己的笔记本上写的博客，部署在了网站上，那么你在家里用台式机，或者实验室的台式机，发现你电脑里面没有博客的文件，或者要换电脑了，最后不知道怎么移动文件，怎么办？

在这里我们就可以利用git的分支系统进行多终端工作了，这样每次打开不一样的电脑，只需要进行简单的配置和在github上把文件同步下来，就可以无缝操作了。



##	机制

机制是这样的，由于`hexo d`上传部署到github的其实是hexo编译后的文件，是用来生成网页的，不包含源文件。

![](机制.png)

也就是上传的是在本地目录里自动生成的`.deploy_git`里面。

其他文件 ，包括我们写在source 里面的，和配置文件，主题文件，都没有上传到github，所以可以利用git的分支管理，将源文件上传到github的另一个分支即可。



##	上传分支

首先，先在github上新建一个hexo分支，如图：

![](新建分支.png)

然后在这个仓库的settings中，选择默认分支为hexo分支（这样每次同步的时候就不用指定分支，比较方便）。

![](修改默认分支.png)

然后在本地的任意目录下，打开git bash，

将其克隆到本地，因为默认分支已经设成了hexo，所以clone时只clone了hexo。

接下来在克隆到本地的ZJUFangzh.github.io中，把除了.git 文件夹外的所有文件都删掉

把之前我们写的博客源文件全部复制过来，除了 `.deploy_git`。这里应该说一句，复制过来的源文件应该有一个 `.gitignore`，用来忽略一些不需要的文件，如果没有的话，自己新建一个，在里面写上如下，表示这些类型文件不需要 `git`：

```bash
.DS_Store
Thumbs.db
db.json
*.log
node_modules/
public/
.deploy*/
```

注意，如果你之前克隆过theme中的主题文件，那么应该把主题文件中的`.git`文件夹删掉，因为git不能嵌套上传，最好是显示隐藏文件，检查一下有没有，否则上传的时候会出错，导致你的主题文件无法上传，这样你的配置在别的电脑上就用不了了。

而后

```bash
git add .
git commit -m "add branch"
git push
```

这样就上传完了，可以去你的github上看一看hexo分支有没有上传上去，其中`node_modules`、`public`、`db.json`已经被忽略掉了，没有关系，不需要上传的，因为在别的电脑上需要重新输入命令安装 。

这样就上传完了。



##	更换电脑操作

一样的，跟之前得环境搭建一样。

1. 安装 `git`

   - centos 8.2

     ```bash
     dnf install git
     ```
     
   - ubuntu

     ```bash
     sudo apt-get install git
     ```

   

2. 设置 `git` 全局邮箱和用户名

   ```bash
   git config --global user.name "mdgqdjqr"
   git config --global user.email "mdgqdjqr@163.com"
   ```

   

3. 设置 `ssh key`

   ```bash
   ssh-keygen -t rsa -C "mdgqdjqr@163.com"
   ```

   将生成的密钥填入 `github`，验证是否成功。

   ```bash
   ssh -T git@github.com
   ```

   

4. 安装 `nodejs`

   - centos 8.2

     ```bash
     dnf install curl -y
     curl -sL https://rpm.nodesource.com/setup_12.x | bash -
     dnf install nodejs -y
     npm install -g npm
     node -v
     npm -v
     ```

   - ubuntu

     ```bash
     sudo apt-get install curl
     curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
     sudo apt-get install nodejs
     sudo npm install -g npm
     node -v
     npm -v
     ```

     

5. 安装 `hexo`

   ```bash
   sudo npm install hexo-cli -g
   ```

   

6. 直接克隆 `blog` 即可，无需初始化

   ```bash
   git clone git@github.com:mdgqdjqr/blog.git
   ```

   

7. 进入克隆的文件夹，安装用于 `blog` 发布的 `git`

   ```bash
   cd blog/
   npm install
   npm install hexo-deployer-git --save
   ```

   

8. 生成，部署

   ```bash
   hexo g && hexo d
   ```

   

9. 然后就可以开始写你的信的博客啦

   ```bash
   hexo new newpage
   ```

   

**Tips：**

1. 不要忘记，每次写完最好都把源文件上传一下

   ```bash
   git add .
   git commit -m "xxx"
   git push
   ```

   

2. 如果是在已经编辑过的电脑上，已经有clone文件夹了，那么，每次只要和远端同步以下就行了。

   ```bash
   git pull
   ```

   

#	第四部分

在搭建 blog 过程中曾遇到如下问题，仅作为参考，希望能帮助到你。

##	1.	TypeError: line.matchAll is not a function

执行 `hexo g` 时出现错误，具体报错如下：

```bash
[root@localhost blog]# hexo g
INFO  Validating config
INFO  Start processing
FATAL { err:
   TypeError: line.matchAll is not a function
       at res.value.res.value.split.map.line (/root/blog/node_modules/hexo-util/lib/highlight.js:128:26)
       at Array.map (<anonymous>)
       at closeTags (/root/blog/node_modules/hexo-util/lib/highlight.js:126:37)
       at highlight (/root/blog/node_modules/hexo-util/lib/highlight.js:119:10)
       at highlightUtil (/root/blog/node_modules/hexo-util/lib/highlight.js:23:16)
       at data.content.dataContent.replace (/root/blog/node_modules/lib/plugins/filter/before_post_render/backtick_code_block.js:92:17)
       at String.replace (<anonymous>)
       at Hexo.backtickCodeBlock (/root/blog/node_modules/lib/plugins/filter/before_post_render/backtick_code_block.js:19:30)
       at Hexo.tryCatcher (/root/blog/node_modules/bluebird/js/release/util.js:16:23)
       at Hexo.<anonymous> (/root/blog/node_modules/bluebird/js/release/method.js:15:34)
       at Promise.each.filter (/root/blog/node_modules/lib/extend/filter.js:67:52)
       at tryCatcher (/root/blog/node_modules/bluebird/js/release/util.js:16:23)
       at Object.gotValue (/root/blog/node_modules/bluebird/js/release/reduce.js:166:18)
       at Object.gotAccum (/root/blog/node_modules/bluebird/js/release/reduce.js:155:25)
       at Object.tryCatcher (/root/blog/node_modules/bluebird/js/release/util.js:16:23)
       at Promise._settlePromiseFromHandler (/root/blog/node_modules/bluebird/js/release/promise.js:547:31)
       at Promise._settlePromise (/root/blog/node_modules/bluebird/js/release/promise.js:604:18)
       at Promise._settlePromiseCtx (/root/blog/node_modules/bluebird/js/release/promise.js:641:10)
       at _drainQueueStep (/root/blog/node_modules/bluebird/js/release/async.js:97:12)
       at _drainQueue (/root/blog/node_modules/bluebird/js/release/async.js:86:9)
       at Async._drainQueues (/root/blog/node_modules/bluebird/js/release/async.js:102:5)
       at Immediate.Async.drainQueues [as _onImmediate] (/root/blog/node_modules/bluebird/js/release/async.js:15:14) } 'Something\'s wrong. Maybe you can find the solution here: %s' '\u001b[4mhttps://hexo.io/docs/troubleshooting.html\u001b[24m'
```

经排查，发现问题出现在`Node.js`的版本上。由于`Node.js 10`在2021年8月30日已停止服务，新版本的`Hexo`需要`Node.js`版本在12.0+。

解决方法：升级nodejs到12.0+



##	2.	Error: Cannot find module 'jquery'

执行 `hexo s` 时出现错误，具体报错如下：

```bash
[root@localhost blog]# hexo s
INFO  Validating config
ERROR {
  err: Error: Cannot find module 'jquery'
  Require stack:
  - /root/blog/themes/Ying/scripts/tags/tabbed_codeblock.js
      at Function.Module._resolveFilename (internal/modules/cjs/loader.js:815:15)
      at Function.Module._load (internal/modules/cjs/loader.js:667:27)
      at Module.require (internal/modules/cjs/loader.js:887:19)
      at req (/root/blog/node_modules/lib/index.js:285:23)
      at /root/blog/themes/Ying/scripts/tags/tabbed_codeblock.js:11:9
      at /root/blog/node_modules/lib/index.js:298:14
      at tryCatcher (/root/blog/node_modules/bluebird/js/release/util.js:16:23)
      at Promise._settlePromiseFromHandler (/root/blog/node_modules/bluebird/js/release/promise.js:547:31)
      at Promise._settlePromise (/root/blog/node_modules/bluebird/js/release/promise.js:604:18)
      at Promise._settlePromise0 (/root/blog/node_modules/bluebird/js/release/promise.js:649:10)
      at Promise._settlePromises (/root/blog/node_modules/bluebird/js/release/promise.js:729:18)
      at _drainQueueStep (/root/blog/node_modules/bluebird/js/release/async.js:93:12)
      at _drainQueue (/root/blog/node_modules/bluebird/js/release/async.js:86:9)
      at Async._drainQueues (/root/blog/node_modules/bluebird/js/release/async.js:102:5)
      at Immediate.Async.drainQueues [as _onImmediate] (/root/blog/node_modules/bluebird/js/release/async.js:15:14)
      at processImmediate (internal/timers.js:461:21) {
    code: 'MODULE_NOT_FOUND',
    requireStack: [ '/root/blog/themes/Ying/scripts/tags/tabbed_codeblock.js' ]
  }
} Script load failed: %s themes/Ying/scripts/tags/tabbed_codeblock.js
```

经排查，发现未安装 jquery，打开命令行，执行以下命令即可：

```bash
npm install jquery --save
```



##	3.	FATAL YAMLException: can not read an implicit mapping pair; a colon is missed

执行 `hexo s -g` 时出现错误，具体报错如下：

```
FATAL YAMLException: can not read an implicit mapping pair; a colon is missed
```

报错信息是提示hexo的yml配置文件 冒号后面少了空格
解决方案：到提示行将对应的空格补上即可



##	4.	FATAL TypeError: Object.fromEntries is not a function

执行 `hexo` 相关操作出现错误，具体报错如下：

```bash
INFO  Validating config
FATAL TypeError: Object.fromEntries is not a function
```

查看 `node` 版本，发现是 `v10.19.0`，升级到 `v12.22.10` 即可



#	总结

到这里就基本做完了。其实都是参考别的博主的设置的，不一定仅限于 `NEXT` 主题，其他主题的设置也是大体相同的，所以如果你希望设置别的主题，那么仔细看一下这个主题的代码结构，也能够把上边的功能添加进去。

多看看别的博主的那些功能，如果有你能找到自己喜欢的功能，那么好好发动搜索技能，很快就能找到怎么做了。加油吧！









