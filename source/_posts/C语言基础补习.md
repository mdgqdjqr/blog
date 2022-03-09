---
title: C语言基础补习
date: 2022-03-09 15:57:11
tags:
  - 嵌入式
  - Linux
  - C语言
categories:
  - 嵌入式开发
---



该文为学习笔记，仅作学习参考，如有错误，望指正！

<!--more-->

#	一.	基础命令

1. VMware Workstation虚拟机软件

   打开一个已经安装了ubuntu或deepin或其他操作系统的虚拟机，如下图所示：

   ![虚拟机主页](1.1-VMware主页.png)

   ![虚拟机主页](1.2-虚拟机主页.png)

2. 在虚拟机和宿主机切换鼠标：ctrl+alt；

3. ubuntu是一个桌面版的Linux系统；

4. shell终端 ，如下图所示：

   ![1.3-shell终端](1.3-shell终端.png)

5. 打开一个shell终端：

   ctrl + alt  + t  默认打开的路径是当前用户的家目录（～：代表家目录）；

   如果希望在当前终端下打开一个相同路径的终端的话，使用：ctrl + shit + n；

6. ctrl + alt + enter  切换全屏；

7. shell命令：

   ​     `cd 目录`：进入到某一目录下  ；

   ​     `cd ..`：回到上一级目录   依次多次执行，肯定会回到根路径 “/”，这是整个Linux文件系统的最顶层；

8. TAB 补齐  根据输入的首字母补齐，如果当前目录下存在以输入字母开头的多个文件的话，可以tab两下补齐，如果只有一个以输入字母开头的文件的话，只需要tab一次；

9. Linux世界中，一切皆文件；

10. pwd命令用于显示用户在文件系统中的当前位置，该命令没有任何选项和参数，命令执行结果显示为绝对路径名；

11. mkdir  创建一个文件夹/目录：如果希望创建多级目录的话，可以使用`mkdir -p  day01/model`；

12. Linux的文件组织模式犹如一颗倒置的树，所有的目录或者文件都是挂载到根目录下的；

    ```bash
    [root@localhost /]# ls
    bin  boot  box  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sudo  sys  tmp  usr  var
    [root@localhost /]# ls -la
    总用量 16
    dr-xr-xr-x.  19 root root  266 11月 15 15:08 .
    dr-xr-xr-x.  19 root root  266 11月 15 15:08 ..
    lrwxrwxrwx    1 root root    7  3月  6  2021 bin -> usr/bin
    dr-xr-xr-x.   6 root root 4096 11月  1 14:22 boot
    drwxrwxrwx    2 root root    6 11月  1 13:54 box
    drwxr-xr-x   20 root root 3920 11月 15 10:31 dev
    drwxr-xr-x  106 root root 8192 11月 15 14:47 etc
    -rw-r--r--    1 root root    0 11月  1 13:54 .exectl_all
    drwxr-xr-x    3 root root   19 11月 11 17:43 home
    lrwxrwxrwx    1 root root    7  3月  6  2021 lib -> usr/lib
    lrwxrwxrwx    1 root root    9  3月  6  2021 lib64 -> usr/lib64
    drwxr-xr-x    2 root root    6  3月  6  2021 media
    drwxr-xr-x    2 root root    6  3月  6  2021 mnt
    drwxr-xr-x    2 root root    6  3月  6  2021 opt
    dr-xr-xr-x  205 root root    0 11月 15 10:30 proc
    dr-xr-x---    5 root root  218 11月 15 14:51 root
    drwxr-xr-x   25 root root  720 11月 15 10:31 run
    lrwxrwxrwx    1 root root    8  3月  6  2021 sbin -> usr/sbin
    drwxr-xr-x    2 root root    6  3月  6  2021 srv
    drwx--x--x    3 root root   16 11月  1 13:56 sudo
    dr-xr-xr-x   14 root root    0 11月 15 10:30 sys
    drwxrwxrwt    9 root root  180 11月 15 15:08 tmp
    drwxr-xr-x   12 root root  144 11月  1 13:52 usr
    drwxr-xr-x   19 root root  264 11月  1 14:00 var
    ```

13. `ls` 列出当前目录下所有文件， 命令与选项之间用空格分隔；

    `ls -a`    列出当前目录下所有文件,包含隐藏文件；

    `ls -l`    列出当前目录下所有文件（不包含隐藏文件）的详细信息；

    `ls -l file`：在Linux世界，不是以文件的后缀名区分文件的，是通过“b c d - l s p”这些字段来区分的；

    drwxrwxr-x：d  目录，-  普通文件；

    rwx rwx r-x    代表权限；

    第一组权限代表文件所有者（user） 具有的权限   r 读权限  w 写权限      x 可执行权限；

    第二组权限代表同组用户（group）  具有的权限   r 读权限  w 写权限      x 可执行权限；

    第三组权限代表其他用户（other）  具有的权限   r 读权限  - 没有写权限  x 可执行权限；

    ```bash
    ying@ying-VMware-Virtual-Platform:~/桌面$ ls -la
    总用量 8
    drwxr-xr-x  2 ying ying 4096 11月 15 14:31 .
    drwx------ 20 ying ying 4096 11月 19 17:03 ..
    ```

    .   代表当前路径；

    ..  代表上一级路径；

    `cd day02` ：切换路径到当前目录下的day02目录，这里省略了“.”,相当于cd   ./day02 ；

    `cd  ../..`：切换路径到上两级目录下，三级四级路径依次类推  ；

14. 命令行提示符：

    ```
    ying@ying-VMware-Virtual-Platform:~/桌面$：
    ying：用户名；
    ying-VMware-Virtual-Platform：主机名；
    ：后的`~/桌面`：表示的是当前路径名；
    $：代表是一个普通用户
    
    另：
    /home/ying：代表当前用户ying的家目录；
    “~”：代表家目录
    ```

15. 绝对路径与相对路径

     ```
    从根路径开始写全路径名，这是绝对路径：`/home/linux/Desktop`
    ​ 以某一路径作参照，相对于此路径在某个位置   ./Desktop   相对路径
    ​ cd    ：在任一目录下都可以直接回到家目录
    ​ cd  ~ ：在任一目录下都可以直接回到家目录
    ​ cd  - ：回到上一次的工作目录
     ```

16. 清屏：clear & ctrl + l；

17. `cat  file`：在不打开文件的前提下查看文件内容；

18. cp  复制

    - 复制文件

      ```
      cp  file1   file2：在当前目录下拷贝file1为file2
      ​ cp  file1  /home/linux：拷贝当前目录下的file1文件到指定目录/home/linux下，文件名仍为file1
      ​ cp  file1  /home/linux/file2：拷贝当前目录下的file1文件到指定目录/home/linux下，文件名为file2
      ​ cp  /home/linux/file1   /home/linux/Desktop：拷贝指定目录下的file1文件到指定目录/home/linux/Desktop下
      ```

    - 复制目录

      ```
      复制目录和复制文件类似，只不过要在最后加上   -a  
      ​ cp  dir1  dir2  -a
      ​ cp  dir1 /home/linux  -a
      ​ cp  /home/linux/dir1   /home/linux/Desktop  -a
      ```

    ```
    
    ```

19. mv

    `mv file  new_file`：把当前目录下的文件file重命名为new_file

    `mv file  /home/linux`：把当前目录下的文件file移动到/home/linux，当前目录下就没有原文件file，相当于剪切

    `mv  /home/linux/file   /home/linux/Desktop/new_file`：把指定目录下的文件file移动到指定目录下，并重命名为new_file，原来目录下就没有原文件file，相当于剪切并重命名

    `mv  dir1  dir2`  

20. touch file  如果file不存在，则创建一个空文件；如果file存在，更新file的时间戳

21. `rm  file`

    `rm  /home/linux/file`

    `rm   dir   -rf`：删除文件夹 

22. 编辑器

    ​        `vi  file  file`文件不存在，新建一个文件，但是如果文件没有保存的话，不会实际创建file文件

    ​        `vi  file`  打开时进入一般模式，可以输入“i”切换到编辑模式，在编辑模式下就可以在文件中进行输入；“o”从光标所在的行的下一行开始插入，并切换到编辑模式

    ​       从编辑模式退出，可以使用“esc”按键；

    ​       通过输入“：”进入命令行模式

    ​       :w         保存

    ​       :wq        保存并退出

    ​       :q         不保存退出

    ​       :q!        强制退出，不保存

    ​       :wq!       强制保存并退出

    在一般模式下：

    x：删除光标所在的一个字符

    dd：删除光标所在的一行

    p：粘贴

    yy：复制光标所在的某一行

    r：替换光标所在的字符，输入完r之后，直接跟上要替换的字符

    :1,5y：复制第一行到第五行

23. 编写一个C程序

     `vi  HelloWorld.c`：创建的c程序文件的后缀一定是".c"

    ```c
    #include	//添加头文件
    int main()	//主函数，程序的入口
    {
        printf("Hello World!\n");
        return 0;
    }
    ```

24. 编译C程序

    - gcc HelloWorld.c   如果程序没有错误，默认会在当前目录下生成一个可执行文件a.out
    - gcc HelloWorld.c  -o  filename   如果程序没有错误，会在当前目录下生成一个通过“-o”指定文件名的可执行文件
    - gcc编译器要求源程序的后缀名为".c" 

25. ./a.out：执行编译成功之后的a.out   

26. //：注释一行   



#	二.	基础知识

1. 概念区分

   - 主存储器也称为内存储器、内存，是计算机的工作存储器。程序，待处理的数据和处理的结果都存储在内存中。内存通常以字节为单位对存储单元按顺序进行编址。内存读写速度比较快，但只能在加电时存储数据，掉电数据丢失。
   - 外存储器是用来长期保存数据的大容量存储器，目前多为磁存储器或光存储器。读写速度慢于内存，可以在不加电的情况下长期保存数据
   - 寄存器是CPU内部的高速存储器，速度快，数目少。

2. 程序的设计步骤：编辑 （ vi ） 、编译（ gcc ）、运行调试

3. 库函数是封装好的，可以直接拿来用，但是在使用库函数，一定要先包含相应头文件来说明，然后才可以使用。如果想知道某个库函数使用的头文件，我们可以使用“man 3  函数名”

4. GNU的含义：GNU is not Unix

5. gcc编译源程序，生成可执行文件分为四步：

   - 预处理：头文件包含，去注释、宏替换

     ```bash
     gcc -E Hello.c -o Hello.i
     ```

   - 编译：语法或者词法检查，如果没有错误，才会生成汇编文件；否则显示错误信息

     ```bash
     gcc -S Hello.i  -o Hello.s
     ```

   - 汇编：生成机器码相关的文件

     ```bash
     gcc -c Hello.s -o Hello.o
     ```

   - 链接，链接函数

     ```bash
     ld
     ```

6. 进制转换

   ```
   0x12af
   = 1 * 16^3 + 2 * 16^2 + 10 * 16^1 + 15 * 16^0
   = 4096 +  512 + 160 + 15
   = 4783
   20 转换二进制： 10100
   ```

7. 标识符：是由程序员按照命名规则自行定义的词法符号，用于定义宏名、变量名、函数名和自定义类型名等。

8. C语言的命名规则如下：

   - 标识符由一个或多个字母、数字或下划线组成
   - 标识符的第一个字符必须是字母或下划线
   - 标识符不能与任何关键字相同、大小写敏感；  ab  Ab  aB AB 、具有一定含义，见名知义，便于记忆,增加可读性

9. ｛｝：作用域，用于分清作用域内的数据只在当前作用域生效

10. 注释

    1. 多行注释

       ```bash
       /*
       注释的内容 
       */
       ```

    2. 单行注释 ：//

    3. 条件注释：#if  0   /   1，#endif

    注释使用实例如下：

    ```c
    #include <stdio.h>  //添加头文件
    int main()	//主函数，程序的入口
    {
        int x;  int  y;  //声明了两个int型变量x,y
        //int x;	//单行注释
        //int y;	//单行注释
    #if 1		//条件注释
        printf("Hello World!\n");
        int b = 40;
    /*		//多行注释
    	if(b == 40)
    	{
    		b = 99;
    		//int i = 90;
    	}
    */
    #endif
        //i = 100;
        return 0;
    }
    void fun()
    { //作用域
        int a = 20;
        a = 	a - 20;
    }
    ```

11. sizeof：是C语言中保留关键字，也可以认为是一种运算符，单目运算符，用于计算所占字节长度。

12. 定位语句所在文件名、函数名及行号

    ```C
    #include <stdio.h>   
    int main( )
    { 
        printf("%s,%s,%d\n",__FILE__,__FUNCTION__,__LINE__);	//FILE、FUNCTION、LINE：每个前后都是两个下划线
        // __FILE__：打印语句所在的文件名
        //__FUNCTION__：打印语句所在的函数名
        //__LINE__：打印语句所在的行号
        return 0;
    }
    ```

    ```c
    #include <stdio.h>
    int main()
    {
    	int i  = 0;
    	for(i = 0 ; i < 10; i++)
    	{
    		printf("%s,%s,%d\n",__FILE__,__FUNCTION__,__LINE__);
    		printf("i = %d\n",i);
    	}
    	return 0;
    }
    ```

13. 逻辑类型。只有两个量true和false，表示逻辑真值和逻辑假值。

    - bool：使用该类型值，就必须加头文件<stdbool.h>

      ```C
      #include <stdio.h>
      #include <stdbool.h>
      int main()
      {
      	bool b = -2;		//非零既真
      	if(b)				//条件判断，如果if后的（）里面的表达式为真，就执行if后的{}里的内容，否则执行else语句
      	{
      		printf("It is true!\n");
      		printf("%d\n",b);
      	}
      	else
      	{
      		printf("It is false!\n");
      		printf("%d\n",b);
      	}
      	return 0;
      }
      ```


    - _Bool：使用该类型值，不需要加任何头文件，其值非零既真
    
      ```c
      #include <stdio.h>
      int main()
      {
      	_Bool b = 2;
      	if(b)
      	{
      		printf("It is true!\n");
      	}
      	else
      	{
      	        printf("It is false!\n");
      	}
      	return 0;
      }
      ```

14. char类型：占有一个字节，一个字节占有8位，默认有符号，决定了char表示的数据范围 （-128~127），最高位是符号位，1 代表负数，0 代表正数

    - char a = 97=0110 0001

    - singed  char：表示的数据范围是 （-128 --  127），最高位为符号位

    - unsigned char：表示的数据范围是 （0   --  255）， 最高位也参与运算

      ```c
      #include <stdio.h>
      int main()
      {
      /*
      	//char a = 'a';
      	char a = 97;         //上述两种写法都可以
      	a = a + 1;
      	printf("%d\n",a); //十进制输出
      	printf("%c\n",a); //字符形式输出
      */
      //	char a = 98;
      	char a = 128;
      	a = 90;
      //	90 = 128;
      	printf("%d\n",a);
      	unsigned char  c2= -1;
      	printf("%d\n",c2);
      	return 0;
      }
      ```

      所谓字符常量是指一个单一字符， 其表示形式是由两个单引号包括的一个字符。字符常量的值就是该字符的ASCII码值，实际运算是拿相对应的ASCII来参与运算。

      ```C
      #include <stdio.h>
      int main()
      {
      	char a  = 10;
      	char b = 20;
      	a = 'b';                //字符常量赋值给变量a 
          char c = 'a' + 1;
      	char cc = 'A';
      	cc = 'A' + 32;
      	printf("%d\n",c);
      	printf("%c\n",cc);
      /*
      	'a'                //字符常量a
      	"a"               //字符串常量a
      */
      	return 0;
      }
      ```

15. 计算机中数据的存储方式，实际按照数据的补码形式存储

    | singed 正数   97 | 负数  -97                                        |
    | ---------------- | ------------------------------------------------ |
    | 原码   0110 0001 | 原码  1110 0001                                  |
    | 反码   0110 0001 | 反码  1001 1110   **符号位不变，剩余位按位取反** |
    | 补码   0110 0001 | 补码  1001 1111   **反码+1**                     |

    

    | char  a = 128;    **存储时只看数值，取出是看数据类型** | unsigned char  c2= -1；                    |
    | ------------------------------------------------------ | ------------------------------------------ |
    | 原码：1000 0000                                        | 原码： 1000 0001                           |
    | 反码：1000 0000                                        | 反码： 1111 1110                           |
    | 补码：1000 0000                                        | 补码： 1111 1111                           |
    | 原码： 1000 0000                                       | 原码： 1111 1111                           |
    | 反码： 1111 1111                                       | 反码： 1111 1111                           |
    | 补码： 1000 0000    取出时： -128                      | 补码：1111 1111            取出时：    255 |

    

    ```bash
    [root@localhost ~]# cat test.c
    #include <stdio.h>
    int main()
    {
    	float  f = -3243243243243243212.341234565686; //float默认保留小数点后六位
    	//printf("%.7f\n",f);
    	printf("%e\n",f);
    	return 0;
    }
    [root@localhost ~]# gcc test.c
    [root@localhost ~]# ls
    anaconda-ks.cfg  a.out  initial-setup-ks.cfg  KYLIN  test.c
    [root@localhost ~]# ./a.out
    -3.243243e+18
    ```

16. 所谓字符串常量是指用双引号括起来的一串字符来表示的数据。

    ```C
    #include <stdio.h>
    int main()
    {
    	char str1[] = "Hello";//字符串常量赋值给字符数组
    	char *str2 = "Hello";//字符串常量赋值给字符指针
    /*
    	'a'   //只包含一个字符常量a
    	"a"   //除了包含一个字符常量a之外，还有一个字符串结束符‘\0’
    */
    	char c1 = 'a';
    	char *c2 = "a";//c2 指向字符串的首地址
    	int i = 0;
    	for(i = 0; i < 2; i++)
    	{
    		//i = 0 时，取字符串的第一个字符；
    		//i = 1 时，取值符串的第二个字符.
    		printf("%d\n",*(c2+i));
    	}
    	return 0;
    }
    ```

17. 标识符常量

    `#define  N    (8+6)`：原样替换，可以使用预处理查看替换结果

    ```c
    #include <stdio.h>
    #define   N    (8+8)
    #define   M   int main(){int a = N * N; printf("a = %d\n",a);return 0;}
    ```

18. 题目：1个水分子的质量约为3.0*10^-23克。1夸脱水大约是950克。编写一个程序，提示用户输入水的夸脱数，并显示水分子数量。（使用scanf函数）

    ```c
    #include <stdio.h>
    #include <math.h>
    int main()
    {
            double water_molecule;
        	int quart_number;
            printf("请输入水的总夸脱数：\n");
            scanf("%d",&quart_number);
            water_molecule=(quart_number*950)/(3.0*pow(10,-23));
            printf("%d夸脱数的水分子数为%e\n",quart_number,water_molecule);
            return 0;
    }
    ```

    ```bash
    [root@localhost ~]# gcc water_molecule.c
    [root@localhost ~]# ./a.out
    请输入水的总夸脱数：
    166
    166夸脱数的水分子数为5.256667e+27
    ```




#	三.	关系运算符

1. 变量名命名遵从标识符的命名规则

   ```c
   #include <stdio.h>
   #define ARCH
   int main()
   {
   #ifdef  ARCH
   	printf("ARM!\n");
   #endif
   	return 0;
   }
   ```

   ```c
   #include <stdio.h>
   #define AAA
   #define BBB 1
   int main()
   {
       #ifdef AAA		// ifdef能过，是因为这种带#的，都只关心他有没有定义过，无关于定义的内容
           printf("AAA is define\n");
       #endif
       if ( 1 == BBB)
       {
           printf("BBB is true\n");
       }
       return 0;
   }
   ```

   ```bash
   [root@localhost ~]# gcc model.c -o test
   [root@localhost ~]# ./test
   AAA is define
   BBB is true
   ```

2. 变量说明的一般形式是：<存储类型>    <数据类型 >    <变量名> ； 

   1. <存储类型>可以是关键词auto、register、static和extern之一；

   2. 声明变量时，不写存储类型，默认就是auto；

   3. register：寄存器存储类型，速度快，但是寄存器甚少，不一定能申请到。

      ```c
      #include <stdio.h>
      int main()
      {
      	register int i,j;
      	for(i = 0; i < 10000; i++)
      	{
      		for(j = 0; j < 1000; j++)
      		{
                  printf("%d\n", i+j);
      		}
      	}
      	return 0;
      }
      ```

3. static：声明变量，起到隔离与隐藏的作用；静态局部变量一般的使用场景，如下所示：

   - 需要保留函数上一次调用结束时的值。
   - 如果初始化后，变量只会被引用而不会改变其值，则这时用静态局部变量比较方便，以免每次调用时重新赋值。

   在静态数据区，内存中所有的字节默认值都是 0x00。静态变量与全局变量也一样，它们都存储在静态数据区中，因此其变量的值默认也为 0。演示示例如下所示。

   ```c
   #include <stdio.h>
   static int g_x;
   int g_y;
   int main(void)
   {
       static int x;
       printf("g_x：%d\ng_y：%d\nx：%d",g_x,g_y,x);
       return 0;
   }
   ```

   ```bash
   [root@localhost ~]# ./a.out
   g_x：0
   g_y：0
   x：0
   ```

4. extern：声明的变量，说明它不是在当前文件中声明的，而是在其他文件中声明的全局变量。extern称为外部参照引用型，使用extern说明的变量是想引用在其它文件中函数体外部说明的变量。

   ```c
   #include <stdio.h>
   int main()
   {
   	extern int a;
   	printf("a = %d\n",a);
   	return 0；
   }
   ```

5. 数据类型与所占内存空间大小息息相关。

6. 所谓表达式是指由运算符、运算量和标点符号组成的有效序列，其目的是用来说明一个计算过程。表达式可以独立形成语句，该语句称为表达式语句。

   表达式语句的一般形式为：

   ​		<表达式>  ；

7. C提供的算术运算符：+，-，*，/，%，++，--；注意：浮点数不能参加 % 运算；

   ++a和a++    都是对a自增1，但是有什么区别呢？

   - a++：先使用a的值，再对a自增1；
   - ++a：先对a自增1，然后在使用a的值。

   ```c
   #include <stdio.h>
   int main()
   {
           int a = 10;
           int b = 3;
           printf("%d\n", a + b);
           printf("%d\n", a - b);
           printf("%d\n", a * b);
           printf("%d\n", a / b);
           printf("%d\n", a % b);
           printf("%d\n",a++);		//	a++<=>先打印a再执行a = a + 1操作;
           printf("%d\n",++a);		//	++a<=>先执行a = a + 1后，再打印a的值;
           printf("%d\n",a);
           return 0;
   }
   ```

   ```bash
   [root@localhost ~]# gcc model.c
   [root@localhost ~]# ./a.out
   13
   7
   30
   3
   1
   10
   12
   12
   ```

   赋值预算符实例：

   ```c
   #include <stdio.h>
   int main()
   {
           int a = 10;
           int b,c;
           b = c = a;
           printf("%d,%d,%d\n",a,b,c);
           a += b;
           printf("%d,%d,%d\n",a,b,c);
           a = a + b;
           printf("%d,%d,%d\n",a,b,c);
           return 0;
   }
   ```

   ```bash
   [root@localhost ~]# gcc model.c 已写入
   [root@localhost ~]# ./a.out
   10,10,10
   20,10,10
   30,10,10
   ```

   逗号运算符实例：

   ```c
   #include <stdio.h>                
   int main()
   {
   	int a = 10, b = 20, c = 30;
       int a1, b1, c1;
   	c = (a += 3, b += 6, a + b);
   	printf("a = %d\n",a);
   	printf("b = %d\n",b);
   	printf("c = %d\n",c);
   	return 0;
   }
   ```

   ```bash
   [root@localhost ~]# gcc model.c
   [root@localhost ~]# ./a.out
   a = 13
   b = 26
   c = 39
   ```

8. 关系运算符：

   关系运算符运算之后都是会得到一个逻辑值： 真 or 假；

   关系运算符 == 是判断是否相等的，=   赋值运算符，如果担心把 a == 10 写错成 a = 10，可以直接写成10 == a ，这样如果误写成“10 = a”， 编译阶段就可以检查错误！

   ```c
   #include <stdio.h>
   int main()
   {
   	int a = 19,  b = 10;
   	if(10 == a)
   	{
   		printf("a ==  b\n");
   	}
   	else
   	{
   		printf("a !=  b\n");
   	}
   	printf("%d\n",a = b);
   	return 0;
   }
   ```

   ```bash
   [root@localhost ~]# gcc model.c
   [root@localhost ~]# ./a.out
   a !=  b
   10
   ```

9. 逻辑与“&&”运算符的运算规律：一假即假，同真为真

   短路法则：逻辑与“&&”运算时，左边为假，决定了运算结果一定为假，所以右边运算量就不需要运算了！

10. 逻辑或“||”运算符的运算规律：一真即真，同假为假

    短路法则：逻辑与“&&”运算时，左边为真，决定了运算结果一定为真，所以右边运算量就不需要运算了！

    ```c
    #include <stdio.h>
    int main()
    {
            int a = 9, b = 10;
            printf("%d\n",!(a < b));
            printf("%d\n",(a > 0 && a < b));
            printf("%d\n",((a < 0) || (a = 20)));	// 注意：此处为赋值
            printf("a = %d\n",a);
            return 0;
    }
    ```

    ```bash
    [root@localhost ~]# gcc model.c
    [root@localhost ~]# ./a.out
    0
    1
    1
    a = 20
    ```

11. 位逻辑与“&”运算符的运算规律：一零即零，同一为一

12. 位逻辑或“|”运算符的运算规律：一一为一，同零为零

13. 位逻辑异或“^”运算符的运算规律：相同为0，不同为1

    ```c
    #include <stdio.h>
    int main()
    {
    	char a = 8, b = 3;
    //  8
    //  0000 1000
    //  3
    //  0000 0011
    //            &
    //  0000 0000
    	printf("%d\n",a & b);
    // 0000 1000
    // 0000 0011   
    //			 |
    // 0000 1011
    //
    	printf("%d\n",a | b);
    // 0000 1000
    // 0000 0011    
    //			 ^
    // 0000 1011
    	printf("%d\n",a ^ b);
    //0000 1000
    //0010 0000
    	printf("%d\n",a <<  2);
    	return 0;
    }
    ```

    ```bash
    [root@localhost ~]# gcc model.c
    [root@localhost ~]# ./a.out
    0
    11
    11
    32
    ```

14. m >> n：>> 导致数据变小，结果为 原来数m / 2的n次方

15. m << n：<< 导致数据变大，结果为 原来数m * 2的n次方

16. 条件运算符"? :"：是一个三目运算符

    一般形式是: <表达式1> ? <表达式2>  :  <表达式3>

    首先执行表达式1，如果表达式1为真，执行表达式2；否则，执行表达式3

    ```c
    #include <stdio.h>
    int main()
    {
    	int a = 10, b = 9;
    	int max;
    	(a > b && a > 8) ? (max = a) : (max = b);
    	(a < b) ? (a) : (b = 20);
    	printf("max = %d\n",max);
    	printf("b = %d\n",b);
    	return 0;
    }
    ```

    ```bash
    [root@localhost ~]# gcc model.c
    [root@localhost ~]# ./a.out
    max = 10
    b = 20
    ```

17. sizeof 运算符的一般形式如下：

    sizeof(<类型或变量名>)  ，注意：它只针对数据类型，而不针对变量！ 

    ```c
    #include <stdio.h>
    int main()
    {
    	char a ;
    	short b;
    	long c;
    	float f;
    	double d;
    	char array[2];
    	printf("%d %d\n",sizeof(char),sizeof(a));
    	printf("%d %d\n",sizeof(short),sizeof(b));
    	printf("%d %d\n",sizeof(long),sizeof(c));
    	printf("%d %d\n",sizeof(float),sizeof(f));
    	printf("%d %d\n",sizeof(double),sizeof(d));
    	printf("%d %d\n",sizeof(char),sizeof(array[0]));
    	return 0;
    }
    ```

    ```bash
    [root@localhost ~]# gcc model.c
    [root@localhost ~]# ./a.out
    1 1
    2 2
    8 8
    4 4
    8 8
    1 1
    ```

18. 格式化输入函数:scanf(“格式控制串”，地址表）

    **功能**：按指定格式从键盘读入数据，存入地址表指定存储单元中,并按回车键结束；

    **返回值**： 按指定格式从键盘读入数据，如果数据格式合法，就会把数据存储到地址表指定的存储单元中，否则地址表中不存储数据，函数退出。正常，返回成功输入数据的个数；

    **地址表**：变量的地址，常用取地址运算符&，输入为字符串时，也不需要&；

    注意：

    - %d  格式化输入一个十进制整数，TAB、空格、回车可以作为分隔符，可以多个空格或者多个回车和TAB组合；

      ```c
      #include <stdio.h>
      int main()
      {
      	int a = 0, b = 0;
      	int num;
      	if( 2 == (num = scanf("%d%d",&a,&b)))
      	{
      		printf("a = %d\n",a);
      		printf("b = %d\n",b);
      	}
      	printf("num = %d\n",num);
      	printf("a  = %d\n",a);
      	return 0;
      }
      ```

      ```bash
      [root@localhost ~]# gcc model.c
      [root@localhost ~]# ./a.out
      4 9
      a = 4
      b = 9
      num = 2
      a  = 4
      ```

    - %c  用“%c”格式符时，TAB、空格、回车和转义字符作为有效字符输入；

      ```c
      #include <stdio.h>
      int main()
      {
      	char c1,c2;
      	scanf("%c%c",&c1,&c2);		// %c %c中间的空格可匹配中间输入的多个TAB、空格、回车和转义字符
      	printf("%d\n",c1);
      	printf("%d\n",c2);
      	return 0;
      }
      ```

      ```bash
      [root@localhost ~]# ./a.out
      a
      b
      97
      98
      ```

    - 因为%c把TAB、空格、回车当做有效字符来处理，如果想要处理这些垃圾的话，可以: <br />scanf("%c%*c%c",&c1,&c2)：只能处理一个TAB、空格、回车；<br />scanf("%c %c",&c1,&c2) ：%c %c中间保留空格，可处理多个TAB、空格、回车；<br />scanf("%c,%c",&c1,&c2)：这里把逗号当做分隔符，要求输入时，必须输入“，”

      getchar()可用于回收垃圾字符

19. 强制转换

    ```c
    #include <stdio.h>
    int main()
    {
    	float f = 1.234;
    	printf("%f\n",f);
    	printf("%d\n",(int)f);
    	return 0;
    }
    ```

    ```bash
    [root@localhost ~]# gcc model.c
    [root@localhost ~]# ./a.out
    1.234000
    1
    ```

20. 全局变量与局部变量

    ```c
    #include <stdio.h>
    int c = 9;
    int main()
    {
    	int a = 10 , b = 20;
    	printf("%d\n",a + b);
    	return 0;
    }
    ```

    ```bash
    [root@localhost ~]# gcc model.c
    [root@localhost ~]# ./a.out
    30
    ```

21. 输入两个整数，实现两个数的交换

    ```c
    #include <stdio.h>
    int main()
    {
    	int a,b,c;
    	printf("please input two numbers a and b:");
    	scanf("%d%d",&a,&b);
    	c=a;
    	a=b;
    	b=c;
    	printf("the numbers are:\na=%d\nb=%d\n",a,b);
    	return 0;
    }
    ```

    ```bash
    [root@localhost ~]# gcc model.c
    [root@localhost ~]# ./a.out
    please input two numbers a and b:17 21
    the numbers are:
    a=21
    b=17
    ```

22. 输入三角形的边长，求面积

    | 注意：                                                       |
    | ------------------------------------------------------------ |
    | [C标准库 在线速查手册](https://www.w3xue.com/manual/c/)      |
    | [GCC -l选项：手动添加链接库](http://c.biancheng.net/view/2382.html) |
    | GCC调用math.h库时报错的问题分析和解决：<br />在[Linux](https://so.csdn.net/so/search?from=pc_blog_highlight&q=Linux)下使用gcc编译c语言时遇到报错：<br/>**undefined reference to `sqrt’**<br/>这是因为math.h函数库不在标准库中，使用时需要链接到外部库进行调用。<br/>解决方法是编译时在命令末尾加上 -lm（-l是指定程序链接哪个库，m表示的是数学库） |

    sqrt函数加头文件math.h，编译的时候需要加上 -lm，即gcc  -test.c -o test   -lm；

    ```c
    #include <stdio.h>
    #include <math.h>
    int main(){
            int a, b, c;
            float p, S;
            printf("请输入三角形三边长:\n");
            scanf("%d %d %d",&a, &b, &c);
            p = (a + b + c) / 2;
            S = sqrt(p*(p-a)*(p-b)*(p-c));
            printf("%d,%d,%d组成的三角形面积为：%f\n",a, b, c, S);
            return 0;
    }
    ```

    ```bash
    [root@localhost ~]# ./a.out
    请输入三角形三边长:
    1 2 3
    1,2,3组成的三角形面积为：0.000000
    [root@localhost ~]# ./a.out
    请输入三角形三边长:
    3 4 5
    3,4,5组成的三角形面积为：6.000000
    ```

23. 输出百位数中个位、十位与百位数相加之和

    ```c
    #include <stdio.h>
    int main(){
            int num, a, b, c;
            printf("请输入一个百位数字进行计算个位、十位、百位相加：\n");
            scanf("%d",&num);
            if(!((num > 99) && (num <1000))){
                    printf("输入错误的数据，程序异常退出！\n");
                    return 0;
            }
            a = num % 10;
            b = (num / 10) % 10;
            c = num / 100;
            printf("%d的个位、十位、百位相加为：%d\n",num,a+b+c);
            return 0;
    }
    ```

    ```bash
    [root@localhost ~]# gcc model.c
    [root@localhost ~]# ./a.out
    请输入一个百位数字进行计算个位、十位、百位相加：
    1000
    输入错误的数据，程序异常退出！
    [root@localhost ~]# ./a.out
    请输入一个百位数字进行计算个位、十位、百位相加：
    167
    167的个位、十位、百位相加为：14
    ```




#	四.	输入输出命令

1. scanf：%s - 输入一个字符串，用字符数组来存储

   ```c
   #include <stdio.h>
     int main()
     {
          char str[10];	//声明char类型长度为10的字符数组，数组名是数组首地址
          scanf("%s",str);
          printf("%s\n",str);
          return 0;
     }
   ```

   ```bash
   [root@localhost ~]# gcc model.c
   [root@localhost ~]# ./a.out
   你好！
   你好！
   ```

   - TAB、空格、回车都是分隔符。

   - `scanf("%[^\n]",str1)`：除了'\n'之外都可以作为字符串的有效字符进行输入；

     ```c
     #include <stdio.h>
     int main()
     {
             char str1[20];
             char str2[20];
             scanf("%[^\n]%s",str1,str2);
             printf("str1 = %6s, str2 = %s\n",str1,str2);
             return 0;
     }
     ```

     ```bash
     [root@localhost ~]# gcc model.c
     [root@localhost ~]# ./a.out
     lslslsl         lslsls
     tttttttt
     str1 = lslslsl          lslsls, str2 = tttttttt
     ```

     ```c
     #include <stdio.h>
     int main()
     {
             char str1[20];
             scanf("%6s",str1);
             printf("str1 = %s\n",str1);
             return 0;
     }
     ```

     ```bash
     [root@localhost ~]# gcc model.c
     [root@localhost ~]# ./a.out
     lslslslslslsls
     str1 = lslsls
     ```

   - `scanf("%md",&a)`：指定数据宽度，遇到空格和不可转换字符结束；

     `scanf("%2d",&a)`：读一个两位整数

     ```c
     #include <stdio.h>
     int main()
     {
             int a;
             scanf("%2d",&a);
             printf("a = %d\n",a);
             return 0;
     }
     ```

     ```bash
     [root@localhost ~]# gcc model.c
     [root@localhost ~]# ./a.out
     321
     a = 32
     ```

   - `scanf("%2c",&a)`：一次读取两个字符，但是只把第一个字符存储到指定的地址中， 如果在这个scanf后紧跟一个`scanf("%c",&b)`，  这时b中存的是第三个字符

     ```c
     #include <stdio.h>
     int main()
     {
     	int  a;
     	char str1[10],str2[10];
     	scanf("%3c",str1);
     	scanf("%2c",str2);
     	printf("str1 = %s\n",str1);
     	printf("str2 = %s\n",str2);
     	return 0;
     }
     ```

     ```bash
     [root@localhost ~]# gcc model.c
     [root@localhost ~]# ./a.out
     webdsqqqq
     str1 = web
     str2 = ds
     ```

2. printf：格式说明符

   格式：printf(“格式控制串”，输出表)

   功能：按指定格式向显示器输出数据

   输出表：要输出的数据

   格式控制串：包含两种信息；

   - `printf("Hello World!\n")`：普通字符Hello World!原样输出；

   - 格式说明：%[修饰符]格式字符，用于指定输出格式。

     `printf("%s\n","Hello World!")`：按照%s指定格式输出；

   ```c
   #include <stdio.h>
   int main()
   {
   	int a = 10;
   	printf("Hello World!\n");
   	printf("%s\n","Hello World!");
   	printf("%d\n",a);
   	printf("%#x\n",a);
   	printf("%#o\n",a);
   	printf("%c\n",a);
   	printf("%f\n",a);
   	printf("%%\n");
   	return 0;
   }
   ```

   ```bash
   [root@localhost ~]# gcc model.c
   [root@localhost ~]# ./a.out
   Hello World!
   Hello World!
   10
   0xa
   012
   
   0.000000
   %
   ```

3. printf：附加格式说明符

   - m：控制输出数据的域宽，如果长度
   - .n：实数而言，控制小数点后输出的位数（四舍五入），字符串而言，实际输出的字符个数
   - m.n：输出实数时，保留小数点后n为，数据长度为m，但是小数点占有数据长度的一位；输出字符串时，控制实际输出n个字符，但是要求数据输出域宽为m，如果长度<m，左边补空格；否则就按照实际长度输出
   - `printf("%-+010.5f\n",f);`
   - 保留小数点后五位，四舍五入；输出的数据域宽是10，如果长度< 10，左边补空格；但是我们这里有 0 ，所以补0；但是输出时要求输出 +， 这个 +  占一位。 

   ```c
   #include <stdio.h>
   int main()
   {
   	int a = 12;
   	float f = 12.345678;
   	printf("%-+4d\n",a);
   	printf("%+010.5f\n",f);
   	printf("%.4s\n","Hello!");
   	printf("%3.4s\n","Hello!");
   	return 0;
   }  
   ```

   ```bash
   [root@localhost ~]# gcc model.c
   [root@localhost ~]# ./a.out
   +12
   +012.34568
   Hell
   Hell
   ```

4. 字符输入函数getchar

   格式:  getchar( )；

   功能：从键盘读一字符；

   返回值：正常，返回读取的代码值；出错或结束键盘输入,返回-1；

   getchar（）读取一个字符，TAB、回车、空格都是有效字符；

5. 字符输出函数putchar

   格式: putchar( c )；

   参数: c为字符常量、变量或表达式；

   功能：把字符c输出到显示器上；

   返回值：正常，为显示的代码值；putchar( c )；  输出字符c，这里c可以是字符，也可以是字符所对应的ASCII值。

   ```c
   #include <stdio.h>
   int main()
   {
           char c = getchar();
           printf("the number = %d\n",c);
           c = getchar();
           putchar(c);
           putchar(10);
           printf("the number = %d\n",c);
           return 0;
   }
   ```

   ```bash
   [root@localhost ~]# gcc model.c
   [root@localhost ~]# ./a.out
   abcd
   the number = 97
   b
   the number = 98
   ```

6. 字符串输入函数gets

   格式： char * gets(char  *s)；

   功能：从键盘输入一以回车结束的字符串放入字符数组中，并自动加'\0'；

   - 说明  1：输入字符串长度应小于字符数组维数
   - 说明  2：与scanf函数不同，gets函数并不以空格作为字符串输入结束的标志。gets函数有风险，因为它不会做越界检查！！！尽量少用

   ```c
   #include <stdio.h>
   int main()
   {
           char str1[10];
           gets(str1);
           int i  = 0;
           for( i = 0; i < 11; i++)
           {
                   printf("%d\n",str1[i]);
           }
           return 0;
   }
   ```

   ```c
   [root@localhost ~]# gcc model.c
   model.c: 在函数‘main’中:
   model.c:5:2: 警告：implicit declaration of function ‘gets’; did you mean ‘fgets’? [-Wimplicit-function-declaration]
     gets(str1);
     ^~~~
     fgets
   /usr/bin/ld: /tmp/ccSwYBNz.o: in function `main':
   model.c:(.text+0x15): 警告：the `gets' function is dangerous and should not be used.
   ```

7. 字符串输出函数puts

   格式： puts(const char *s)

   功能：向显示器输出字符串（输出完，换行）

   说明：字符数组必须以‘\0’结束，相当于printf（"%s\n",s）;

   ```c
   #include <stdio.h>
   int main()
   {
           char a[] = {'1','a','\0','b','c','\0'};
           puts(a);
           printf("%s\n",a);
           printf("%s\n","Hello!");
           return 0;
   }
   ```

   ```bash
   [root@localhost ~]# gcc model.c
   [root@localhost ~]# ./a.out
   1a
   1a
   Hello!
   ```

8. if 语句

   格式：if (表达式)  语句块1    else语句块2

   - if条件判断，如果表达式的结果为真，执行语句块1，如果为假，执行语句块2

   - 表达式是要得到逻辑值：真或者假

   - 在语句块内，当有若干条语句时，必须用{…}括起来，如果只有一条语句，可以省略括号{}不写

   - if可以单独存在，但是else不可以单独存在；并且else找就近的if；else和if之间 不可以隔多个语句。

   - 以下是合法的

     ```c
     if('a'){
     		printf("a = %d\n",a);
     	    printf("a = %d\n",a);
     }else                                                                     
     		printf("b = %d\n",b);
     ```

   - 以下是非法的

     ```c
     if('a')
     		printf("a = %d\n",a);
     		printf("a = %d\n",a);
     else                                                                     
     		printf("b = %d\n",b);
     ```

   model实例如下：

   ```c
   #include <stdio.h>
   int main()
   {
           int a = 0 , b = 0 ,max = 0;
           puts("Please input two number:");
           if(scanf("%d%d",&a,&b) == 2){
                   if(a > b){
                           max = a;
                   }else{
                           max = b;
                   }
           }else{
                   puts("Input error!");
           }
           printf("max = %d\n",max);
           return 0;
   }
   ```

   ```bash
   [root@localhost ~]# gcc model.c
   [root@localhost ~]# ./a.out
   Please input two number:
   21      47
   max = 47
   ```

   ```c
   #include <stdio.h>
   int main()
   {
           int a = 9, b = 10;
           if('a'){
                   printf("a = %d\n",a);
                   printf("a = %d\n",a);
           }else if(a > 8){
                   printf("b = %d\n",b);
                   printf("b = %d\n",b);
           }else{
           }
           if('d'){
                   printf("hello!\n");
           }
           printf("b = %d\n",b);
           printf("b = %d\n",b);
           return 0;
   }
   ```

   ```bash
   [root@localhost ~]# gcc model.c
   [root@localhost ~]# ./a.out
   a = 9
   a = 9
   hello!
   b = 10
   b = 10
   ```

9. switch 语句

   格式：

   ```
   switch (表达式)
   {  
   	case 常量表达式1:语句块1；break;
   	case 常量表达式2:语句块2; break;
       ….
   	case 常量表达式n:语句块n; break;
   	default	:语句块n+1
   }
   ```

   - 表达式会有确定值，它会和大括号里的所有case分支进行匹配；

   - 每个常量表达式的值必须各不相同,否则将会出现矛盾。

   - 当表达式的值与case后面的常量表达式值相等时就执行此case后面的语句。

   - break语句在switch中的作用：强行跳出switch体转到其它某条语句，每个case后面应有一个break语句（否则程序的执行顺序将改变），default分支后的break可以省略。  

   - 各个case出现的先后顺序不影响程序的执行结果.

   - 如果全部没有匹配成功，最后执行default语句

   <font color=red>注意：</font>

   1. switch  后跟的表达式最后要有一个确切值
   2. case 语句也可以写一个表达式，但是不是匹配表达式，而是匹配表达式最终的结果
   3. case 语句的表达式的最终值是不允许重复的

   ```c
   #include <stdio.h>
   int main()
   {
           switch('A'+2)
           {
                   case  'B':puts("B");break;
                   case  'C':puts("C");break;
                   case  'D':puts("D");break;
                   case  'A':puts("A");break;
                   default:puts("END!");
           }
           return 0;
   }
   ```

   ```bash
   [root@localhost ~]# gcc model.c
   [root@localhost ~]# ./a.out
   C
   ```

10. 题目：外部输入学生整数成绩，输出评分

    ```
    90 - 100			A
    80 - 89				B
    70 - 79				C 
    60 - 69				D
    0  - 60				E
    ```

    - if 语句实现

      ```c
      #include <stdio.h>
      int main()
      {
              int score;
              puts("Please input one score:");
              if(scanf("%d",&score) == 1){
                      if(score >=0 && score <= 100){
                              if(score >=90){
                                      puts("A!");
                              }else if(score >=80){
                                      puts("B!");
                              }else if(score >= 70){
                                      puts("C!");
                              }else if(score >= 60){
                                      puts("D!");
                              }else{
                                      puts("E!");
                              }
                      }else{
                              puts("score is [0-100]");
                      }
              }
              else{
                      puts("Input error!");
              }
              return 0;
      }
      ```

      ```bash
      [root@localhost ~]# gcc model.c
      [root@localhost ~]# ./a.out
      Please input one score:
      66
      D!
      [root@localhost ~]# ./a.out
      Please input one score:
      90
      A!
      ```

    - swith 语句实现

      ```c
      #include <stdio.h>
      int main()
      {
              int score;
              puts("Please input score:");
              if(scanf("%d",&score) == 1){
                      if(score >=0 && score <= 100){
                              switch(score/10){
                              case 10:
                              case 9:puts("A!");break;
                              case 8:puts("B!");break;
                              case 7:puts("C!");break;
                              case 6:puts("D!");break;
                              default:puts("E!");break;
                              }
                      }
              }
              return 0;
      }
      ```

      ```bash
      [root@localhost ~]# gcc model.c
      [root@localhost ~]# ./a.out
      Please input score:
      77
      C!
      ```

11. 题目：输入三个数：按照从小到大的顺序进行排列

    ```
    int a = 10, b = 5, c = 20;
    ...
    a = 5, b = 10, c = 20
    ```

    ```c
    #include <stdio.h>
    int main()
    {
            int a,b,c,x,y,z;
            printf("please input three different numbers:\n");
            scanf("%d %d %d",&a,&b,&c);
            x=a<b?a:b;
            y=x<c?x:c;
            printf("min = %d\n",y);
            if(y==a){
                    if(b<c){
                            printf("mid = %d\n",b);
                            printf("max = %d\n",c);
                    }else{
                            printf("mid = %d\n",c);
                            printf("max = %d\n",b);
                    }
            }else if(y==b){
                    if(a<c){
                            printf("mid = %d\n",a);
                            printf("max = %d\n",c);
                    }else{
                            printf("mid = %d\n",c);
                            printf("max = %d\n",a);
                    }
            }else{
                    if(a<b){
                            printf("mid = %d\n",a);
                            printf("max = %d\n",b);
                    }else{
                            printf("mid = %d\n",b);
                            printf("max = %d\n",a);
                    }
            }
            return 0;
    }
    ```

    ```bash
    [root@localhost ~]# gcc model.c
    [root@localhost ~]# ./a.out
    please input three different numbers:
    32 44 37
    min = 32
    mid = 37
    max = 44
    [root@localhost ~]# ./a.out
    please input three different numbers:
    32 22 66
    min = 22
    mid = 32
    max = 66
    [root@localhost ~]# ./a.out
    please input three different numbers:
    32 22 31
    min = 22
    mid = 31
    max = 32
    [root@localhost ~]# ./a.out
    please input three different numbers:
    77 54 11
    min = 11
    mid = 54
    max = 77
    ```

12. 题目：输入年，判断是闰年（leap year）还是平年（nonleap year）	

    闰年：能够被4整除但是不能被100整除 或者 能够被400整除

    ```c
    #include <stdio.h>
    int main()
    {
            int x;
            printf("please input year:");
            scanf("%d",&x);
            if((x%400==0||x%4==0)&&x%100!=0)
            {
                    printf("今年是闰年\n");
            }
            else
            {
                    printf("今年是平年\n");
            }
            return 0;
    }
    ```

    ```bash
    [root@localhost ~]# gcc model.c
    [root@localhost ~]# ./a.out
    please input year:2018
    今年是平年
    [root@localhost ~]# ./a.out
    please input year:2040
    今年是闰年
    ```




#	五.	循环体

1. for 循环一般格式：

   ```
   for(expression1; expression2; expression3)
   {
             循环体;
   }
   ```

   for 循环执行过程：

   - 先求解表达式1;   （一般表达式1都是一个赋值语句）。
   - 求解表达式2,若为真,进进入循环，执行循环体一次，然后再去执行表达式3;若为假,循环结束，执行循环后的语句。-->表达式2一般是条件判断，会得到逻辑值。
   - 表达式3一般是一个自增或者自减运算，是一个改变变量的语句。执行完表达式3，然后再去跳到表达式2去执行，若为真,进进入循环，执行循环体一次，然后再去执行表达式3;直到表达式2为假，循环结束。

   <font color=red>注意：</font>

   - 表达式可以省，但是分号不可以省；
   - 表达式1省略，但是必须在这之前有初始化语句；
   - 表达式2一般是条件判断，是用来判断是否继续执行的条件；如果省略掉，默认一直为真，就进入了死循环了！
   - 表达式3 可以省略，但是需要在循环体内做值的更改；

   for 循环实例如下：

   ```c
   #include <stdio.h>
   int main()
   {
           int i = 0;
           for( ;  i <= 5; ){
                   i++;
                   printf("i = %d\n",i);
           }
           printf("iiiiiii = %d\n",i);
           return 0;
   }
   ```

   ```bash
   [root@localhost ~]# gcc model.c
   [root@localhost ~]# ./a.out
   i = 1
   i = 2
   i = 3
   i = 4
   i = 5
   i = 6
   iiiiiii = 6
   ```

   ```c
   #include <stdio.h>
   int main()
   {
           int num,ge,shi,bai;
           for(num = 100 ;  num < 1000; num++){
                   ge = num % 10;
                   shi = num / 10 % 10;
                   bai = num / 100;
                   if(num == ge *ge *ge + shi * shi *shi + bai * bai *bai){
                           printf("%d\n",num);
                   }
           }
           return 0;
   }
   ```

   ```bash
   [root@localhost ~]# gcc model.c
   [root@localhost ~]# ./a.out
   153
   370
   371
   407
   ```

   ```c
   #include <stdio.h>
   int main()
   {
           int array[5];
           int i;
           for(i = 0; i < sizeof(array) / sizeof(int); i++)
           {
                   printf("请输入数组array的第%d个数据：",i);
                   scanf("%d",&array[i]);
           }
           for(i = 0; i < sizeof(array) / sizeof(int); i++)
           {
                   printf("array[%d] = %d\n",i,array[i]);
           }
           return 0;
   }
   ```

   ```bash
   [root@localhost ~]# gcc model.c
   [root@localhost ~]# ./a.out
   请输入数组array的第0个数据：1
   请输入数组array的第1个数据：2
   请输入数组array的第2个数据：3
   请输入数组array的第3个数据：4
   请输入数组array的第4个数据：5
   array[0] = 1
   array[1] = 2
   array[2] = 3
   array[3] = 4
   array[4] = 5
   ```

   ```c
   #include <stdio.h>
   int main()
   {
           int i = 0 , j = 0;
           for( i = 0; i < 4; i++)
           {
                   printf("i = %d\n",i);
                   for(; j < 5; j++)
                   {
                           printf("j = %d\n",j);
                   }
                   putchar(10);
           }
           return 0;
   }
   ```

   ```bash
   [root@localhost ~]# gcc model.c
   [root@localhost ~]# ./a.out
   i = 0
   j = 0
   j = 1
   j = 2
   j = 3
   j = 4
   
   i = 1
   
   i = 2
   
   i = 3
   
   ```

   ```c
   #include  <stdio.h>
   int main()
   {
           int i = 0, j = 0;
           char c;
           for(i = 0 ; i < 6; i++)              // 外层循环控制输出行数
           {
                   c = 'F';
                   for(j = 1; j <= i ; j++)            // 内层循环控制列数
                   {
                           putchar('_');
                   }
                   for(j = 0 ;j <= i ; j++ )
                   {
                           putchar(c-j);
                   }
                   putchar('\n');
           }
           return 0;
   }
   ```

   ```bash
   [root@localhost ~]# gcc model.c
   [root@localhost ~]# ./a.out
   F
   _FE
   __FED
   ___FEDC
   ____FEDCB
   _____FEDCBA
   ```

   model：九九乘法表

   ```c
   #include <stdio.h>
   int main()
   {
           int i ,j;
           for(i = 1 ; i <= 9 ;i++)
           {
                   for(j = 1; j <= i; j++)
                   {
                           printf("%d * %d = %d\t",j,i,i*j);
                   }
                   putchar(10);
           }
           return 0;
   }
   ```

   ```bash
   [root@localhost ~]# gcc model.c
   [root@localhost ~]# ./a.out
   1 * 1 = 1
   1 * 2 = 2       2 * 2 = 4
   1 * 3 = 3       2 * 3 = 6       3 * 3 = 9
   1 * 4 = 4       2 * 4 = 8       3 * 4 = 12      4 * 4 = 16
   1 * 5 = 5       2 * 5 = 10      3 * 5 = 15      4 * 5 = 20      5 * 5 = 25
   1 * 6 = 6       2 * 6 = 12      3 * 6 = 18      4 * 6 = 24      5 * 6 = 30      6 * 6 = 36
   1 * 7 = 7       2 * 7 = 14      3 * 7 = 21      4 * 7 = 28      5 * 7 = 35      6 * 7 = 42      7 * 7 = 49
   1 * 8 = 8       2 * 8 = 16      3 * 8 = 24      4 * 8 = 32      5 * 8 = 40      6 * 8 = 48      7 * 8 = 56      8 * 8 = 64
   1 * 9 = 9       2 * 9 = 18      3 * 9 = 27      4 * 9 = 36      5 * 9 = 45      6 * 9 = 54      7 * 9 = 63      8 * 9 = 72      9 * 9 = 81
   ```

2. 题目：输出1000以内的水仙花数（个位、十位、百位数的各个位数的立方和与原数值相等）

   ```c
   #include <stdio.h>
   int main(){
           int ge, shi, bai, sum;
           int i = 0;
           for(; i < 1000; i++){
                   ge = i % 10;
                   shi = (i / 10) % 10;
                   bai = i / 100;
                   sum = (ge * ge * ge) + (shi * shi * shi) + (bai * bai * bai);
                   if(i == sum){
                           printf("%d 是水仙花数\n",i);
                   }
           }
           return 0;
   }
   ```

   ```bash
   [root@localhost ~]# gcc model.c
   [root@localhost ~]# ./a.out
   0 是水仙花数
   1 是水仙花数
   153 是水仙花数
   370 是水仙花数
   371 是水仙花数
   407 是水仙花数
   ```

3. 题目：1到10的累加和

   ```c
   #include <stdio.h>
   int main()
   {
           int i = 0;
           int sum = 0;
   loop:
           if(i++ < 10)
           {
                   sum += i;
                   goto loop;
           }
           printf("sum = %d\n",sum);
   END:
           puts("This is End!");
           return 0;
   }
   ```

   ```bash
   [root@localhost ~]# gcc model.c
   [root@localhost ~]# ./a.out
   sum = 55
   This is End!
   ```

   ```c
   #include <stdio.h>
   int main()
   {
           int sum = 0,i = 0;
           for(i = 1; i <= 10 ;i++)
           {
                   sum += i;
           }
           printf("sum = %d\n",sum);
   }
   ```

   ```bash
   [root@localhost ~]# gcc model.c
   [root@localhost ~]# ./a.out
   sum = 55
   ```

4. while 语句构成循环的一般形式

   ```
   while (表达式)			//直到表达式为假，循环才真正结束 
   {
   		statatments;
   }
   ```

   ```c
   #include <stdio.h>
   int main()
   {
           int i = 10;
           int sum = 0;
           while(i--)
           {
                   sum += i;
                   printf("i = %d\n",i);
           }
           printf("sum = %d\n",sum);
           return 0;
   }
   ```

   ```bash
   [root@localhost ~]# gcc model.c
   [root@localhost ~]# ./a.out
   i = 9
   i = 8
   i = 7
   i = 6
   i = 5
   i = 4
   i = 3
   i = 2
   i = 1
   i = 0
   sum = 45
   ```

5. do-while语句构成循环一般形式

   ```
   do{
   		statatments;
   }while(表达式);             //后面是有一个分号的
   ```

6. goto：标号，直接跳转到标号所在的位置，灵活度很大，破坏程序正常执行过程，所以慎用！

   ```c
   #include <stdio.h>
   int main()
   {
           int i = 0;
           for( i = 0; i< 10; i++)
           {
                   if(3 == i)
                   {
                           goto END;
                   }
                   printf("i = %d\n",i);
           }
   END:
           puts("This is End!");
           return 0;
   }
   ```

   ```bash
   [root@localhost ~]# gcc model.c
   [root@localhost ~]# ./a.out
   i = 0
   i = 1
   i = 2
   This is End!
   ```

   ```c
   #include <stdio.h>
   int main()
   {
           int i = 0;
           int sum = 0;
   loop:
           if(i++ < 10)
           {
                   sum += i;
                   goto loop;
           }
           printf("sum = %d\n",sum);
   END:
           puts("This is End!");
           return 0;
   }
   ```

   ```bash
   [root@localhost ~]# gcc model.c
   [root@localhost ~]# ./a.out
   sum = 55
   This is End!
   ```

7. break语句用于从循环体内跳出，即提前结束循环。break只能用在循环语句和switch语句中.跳出switch循环

8. continue语句结束只是本次循环,后续循环继续执行。

9. continue与break的区别：continue直结束本次循环,而break终止本层循环.

   ```c
   #include <stdio.h>
   int main()
   {
           int i , j;
           for(i = 0 ; i < 5; i++)
           {
                   printf("i = %d\n",i);
                   for(j = 0; j < 4; j++ )
                   {
                           if(1 == j)
                           {
                           //      printf( "########j = %d\n",j);
                           //      break;            //结束break所在的那个 整个循环
                              continue;             //结束当前这一次循环
                           //      goto end;
                           }
                           printf("j = %d\n",j);
                   }
                   printf("This is End!\n");
           }
   end:
           printf("fffff!\n");
           return 0;
   }
   ```

   ```bash
   [root@localhost ~]# gcc model.c
   [root@localhost ~]# ./a.out
   i = 0
   j = 0
   j = 2
   j = 3
   This is End!
   i = 1
   j = 0
   j = 2
   j = 3
   This is End!
   i = 2
   j = 0
   j = 2
   j = 3
   This is End!
   i = 3
   j = 0
   j = 2
   j = 3
   This is End!
   i = 4
   j = 0
   j = 2
   j = 3
   This is End!
   fffff!
   ```

   ```c
   #include <stdio.h>
   int main()
   {
           int i , j;
           for(i = 0 ; i < 5; i++)
           {
                   printf("i = %d\n",i);
                   for(j = 0; j < 4; j++ )
                   {
                           if(1 == j)
                           {
                           //      printf( "########j = %d\n",j);
                                   break;            //结束break所在的那个 整个循环
                                   //continue;             //结束当前这一次循环
                           //      goto end;
                           }
                           printf("j = %d\n",j);
                   }
                   printf("This is End!\n");
           }
   end:
           printf("fffff!\n");
           return 0;
   }
   ```

   ```bash
   [root@localhost ~]# gcc model.c
   [root@localhost ~]# ./a.out
   i = 0
   j = 0
   This is End!
   i = 1
   j = 0
   This is End!
   i = 2
   j = 0
   This is End!
   i = 3
   j = 0
   This is End!
   i = 4
   j = 0
   This is End!
   fffff!
   ```

10. return：结束函数

    ```c
    #include <stdio.h>
    int main()
    {
            int i = 0, j = 0;
            for(i = 0; i < 4; i++)
            {
                    for(j = 0; j< 5; j++)
                    {
                            printf("ii = %d\tjj = %d\n",i,j);
                    }
                    printf("i = %d\tj = %d\n",i,j);
                    return -1;      //结束函数
            }
            return 0;
    }
    ```

    ```bash
    [root@localhost ~]# gcc model.c
    [root@localhost ~]# ./a.out
    ii = 0  jj = 0
    ii = 0  jj = 1
    ii = 0  jj = 2
    ii = 0  jj = 3
    ii = 0  jj = 4
    i = 0   j = 5
    ```

11. 数组：构造数据类型之一   int a[6]

    数组是具有一定顺序关系的若干个变量的集合，组成数组的各个变量称为数组的元素。

    数组中各元素的数据类型要求相同，用数组名和下标确定。

    数组可以是一维的，也可以是多维的。

    声明了一个数组，数组的数据类型是int，也就代表这个数组中的元素都是int数据类型

    a是以为数组的数组名，遵循标识符的命名规则

    [] 代表这是一个一维数组

    10 代表这个一维数组可以存储10个元素

    数组是具有一定顺序关系的若干个变量的集合

    数组的每个元素在内存当中是地址空间连续的

    数组名表示这个数组在内存中存放的那片连续内存的首地址，是地址常量

    每个元素所占有的地址空间大小是由数据类型决定的

    编译时分配连续内存    内存字节数=数组维数*sizeof(元素数据类型)

    ```c
    #include <stdio.h>
    int main()
    {
            int a[10];
            printf("%d\n",10 * sizeof(int));
            return 0;
    }
    ```

    ```bash
    [root@localhost ~]# gcc model.c
    [root@localhost ~]# ./a.out
    40
    ```

    ```c
    #include <stdio.h>
    int main()
    {
            int a[]  = {1,4,5,3};              //全部初始化
            //a[0] = 1;                         //部分初始化，没有被初始化的元素默认值为零
            //a[1] = 4;
            //a[2] = 5;
            //a[3] = 3;
            //a[4] = 0;
            int i;
            for(i = 0; i< 4; i++)
            {
                    printf("%d\n",a[i]);
            }
            return 0;
    }
    ```

    ```bash
    [root@localhost ~]# gcc model.c
    [root@localhost ~]# ./a.out
    1
    4
    5
    3
    ```

12. 题目：计算Fibonacci数列前10项并逆序给出结果。（某一项等于前两项的数据和）

    ex：1 1 2 3 5 8 13 21 34 55

    ```c
    #include <stdio.h>
    int main()
    {
            int i;
            int a[10];
            a[0] = a[1] = 1;
    
            for(i = 2; i < 10; i++)
            {
                    a[i] = a[i-1] + a[i-2];
            }
            for(i = 9; i >=0 ; i--)
            {
                    printf("a[%d] = %d\n",i,a[i]);
            }
            return 0;
    }
    ```

    ```bash
    [root@localhost ~]# gcc model.c
    [root@localhost ~]# ./a.out
    a[9] = 55
    a[8] = 34
    a[7] = 21
    a[6] = 13
    a[5] = 8
    a[4] = 5
    a[3] = 3
    a[2] = 2
    a[1] = 1
    a[0] = 1
    ```

13. 题目：冒泡排序

    - 比较第一个数与第二个数，若为逆序a[0]>a[1]，则交换；然后比较第二个数与第三个数；依次类推，直至第n-1个数和第n个数比较为止——第一趟冒泡排序，结果最大的数被安置在最后一个元素位置上；
    - 对前n-1个数进行第二趟冒泡排序，结果使次大的数被安置在第n-1个元素位置；
    - 重复上述过程，共经过n-1趟冒泡排序后，排序结束；

    ```
    ex：5,1,3,8,7
    5 > 1    1 5 3 8 7
    5 > 3    1 3 5 8 7
    5 > 8    1 3 5 8 7
    8 > 7    1 3 5 7 8
    ```

    ![冒泡排序](5.1-冒泡排序.gif)

    ```c
    #include <stdio.h>
    int main()
    {
            int i;
            int a[5]={5,1,3,8,7};
            for(i = 1; i < 5; i++){
                    if(a[i-1] > a[i]){
                            int temp = a[i];
                            a[i] = a[i-1];
                            a[i-1] = temp;
                    }
            }
            for(i = 0; i < 5; i++){
                    printf("a[%d] = %d\n", i, a[i]);
            }
    }
    ```

    ```bash
    [root@localhost ~]# gcc model.c
    [root@localhost ~]# ./a.out
    a[0] = 1
    a[1] = 3
    a[2] = 5
    a[3] = 7
    a[4] = 8
    ```

14. 简单选择法排序

    ![简单选择排序](5.2-简单选择排序.gif)

    ```c
    #include <stdio.h>
    int main()
    {
            int i, j;
            int a[5]={5,1,3,8,7};
            for(i = 0; i < 5; i++){
                    for(j = i + 1; j < 5; j++){
                            if(a[i] > a[j]){
                                    int temp = a[j];
                                    a[j] = a[i];
                                    a[i] = temp;
                            }
                    }
            }
            for(i = 0; i < 5; i++){
                    printf("a[%d] = %d\n", i, a[i]);
            }
    }
    ```

    ```bash
    [root@localhost ~]# ./a.out
    a[0] = 1
    a[1] = 3
    a[2] = 5
    a[3] = 7
    a[4] = 8
    ```

15. 1000以内的所有完数。（ 完数：完美的数，一个数的所有因子，除去它本身相加还等于这个数，则这个数称之为完数）

    ```c
    #include"stdio.h"
    int main()
    {
            int j,k,sum;
            for(k=2;k<=1000;k++)
            {
                    sum =0;
                    for(j=1;j<k;j++)
                    {
                            if(k%j==0)
                            sum+=j;
                    }
                    if(sum==k)
                    {
                            printf("%d\n",k);
                    }
            }
            return 0;
    }
    ```

    ```bash
    [root@localhost ~]# gcc model.c
    [root@localhost ~]# ./a.out
    6
    28
    496
    ```

16. 求100以内所有的质数。（质数：只能够1和它本身整除）

    ```c
    #include"stdio.h"
    int main()
    {
            int s,i,j;
            for(i=3;i<=100;i++)
            {
                    for(s=0,j=2;j<i;j++)
                    {
                            if(i%j==0)
                            {
                                    s=1;
                                    break;
                            }
                    }
                    if(s!=1)
                            printf("%d  ",i);
            }
            return 0;
    }
    ```

    ```bash
    [root@localhost ~]# gcc model.c
    [root@localhost ~]# ./a.out
    3  5  7  11  13  17  19  23  29  31  37  41  43  47  53  59  61  67  71  73  79  83  89  97 
    ```

17. 从外部输入数组元素，找出数组里面的最大值

    ```c
    #include"stdio.h"
    int main()
    {
            int a[10],i,j,t;
            printf("input 10 numbers:\n");
            for (i=0;i<10;i++)
                    scanf("%d",&a[i]);
            for (i=0;i<10;i++)
            {
                    t=i;
                    for (j=i+1;j<10;j++)
                    {
                            if(a[t]<a[j])
                                    t=j;
                    }
                    printf("max num is：%d\n",a[t]);
                    break;
            }
            return 0;
    }
    ```

    ```bash
    [root@localhost ~]# gcc model.c
    [root@localhost ~]# ./a.out
    input 10 numbers:
    17 2 4 5 9 21 23 22 7 9
    max num is：23
    ```



#	六.	二维数组

1. gdb调试方法：https://www.cnblogs.com/life2refuel/p/5396538.html

2. <font color=red>区分：</font>

   - 字符串常量：

     `char *a = "Hello World!"`（默认带'\0'）；

     `char a[] = "Hello World"`（字符数组默认加'\0'）；

   - 字符常量：   `char  a = 'H'`（字符常量不带'\0'）

3. 二维数组一般形式如下：

   `<存储类型>   <数据类型>   <数组名>[<常量表达式1>][<常量表达式2>]；`

   - 数据类型：决定二维数组中每个成员的数据类型
   - 数组名：遵循标示符的命名规则；地址常量
   - 元素个数：常量表达式1值 * 常量表达式2值

   `int a[3][4]`：声明了一个int型的二维数组，每个数组成员的数据类型是int，这个数组有 3 * 4 = 12个成员，二维数组也是通过数组名＋下标的方式表示数组的元素。二维数组是按行序优先 。

   `int a[3][4]`：这是一个3行四列的数组，总共有三行，每行有四列  ，下标也是从0开始

   ```
   第一行：
   a[0][0]      a[0][1]     a[0][2]     a[0][3]
   第二行：
   a[1][0]      a[1][1]     a[1][2]     a[1][3]
   第三行： 
   a[2][0]      a[2][1]     a[2][2]     a[2][3]
   ```

   ```c
   #include <stdio.h>
   int main()
   {
           //int a[2][3] = {{2,5,12},{4,6,7}};                     //全部初始化
           //int a[2][3] = {2,5,12,4,6,7};                         //全部初始化
           //int a[2][3] = {{2,5,12},{4,7}};                       //按行部分初始化
           //int a[2][3] = {2,5,12,4,7};                           //部分初始化
           #if 0
           int a[2][3];
           a[0][0] = 2;
           a[0][1] = 5;
           a[0][2] = 12;
           a[1][0] = 4;
           a[1][1] = 7;
           a[1][2] = 0;
           #endif
           //int a[2][3] = {{2,5,12},{6,7}};                       //全部初始化
           //int a[][3] = {6,2,5,12,7};                            //部分初始化
           int a[2][3];                                            //部分初始化
           int i,j;
           for(i = 0; i < 2; i++)                                  //行数
           {
                   for(j = 0; j < 3; j++)                          //列数
                   {
                           printf("a[%d][%d] = %d\n",i, j, a[i][j]);
                   }
           }
           return 0;
   }
   ```

   ```bash
   [root@localhost ~]# gcc model.c
   [root@localhost ~]# ./a.out
   a[0][0] = 4198832
   a[0][1] = 0
   a[0][2] = 4198464
   a[1][0] = 0
   a[1][1] = -1491004464
   a[1][2] = 32766
   ```

