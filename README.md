miniOS
---

<a href="https://github.com/Qihoo360/evpp/releases"><img src="https://img.shields.io/github/release/Qihoo360/evpp.svg" alt="Github release"></a>
<a href="https://travis-ci.org/Qihoo360/evpp"><img src="https://travis-ci.org/Qihoo360/evpp.svg?branch=master" alt="Build status"></a>
[![Platform](https://img.shields.io/badge/platform-%20%20%20%20Linux-green.svg?style=flat)](https://github.com/Qihoo360/evpp)
[![License](https://img.shields.io/badge/license-%20%20BSD%203%20clause-yellow.svg?style=flat)](LICENSE)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)

## 项目概述

这是一个用C和汇编写的，运行于bochs虚拟机上的，从MBR开始，一步步编写了MBR、OBR、内存管理、进程管理、文件系统、fork, exec等常见系统调用，并最终以可交互的terminal形式运行的微型操作系统。

操作系统对于我来说，一直是一道想过但难以跨越的槛。想好好搞懂它却始终不得其门而入，在阅读了[《Operating Systems: Three Easy Pieces》](https://pages.cs.wisc.edu/~remzi/OSTEP/)，[《Linux Kernel Development》](https://book.douban.com/subject/3291901/)，并部分阅读了[《Understanding the Linux Kernel》](http://gauss.ececs.uc.edu/Courses/c4029/code/memory/understanding.pdf)、[《Linux内核完全剖析》](https://book.douban.com/subject/3229243//)、[《Linux Inside》](https://0xax.gitbooks.io/linux-insides/content/)等书后。很多概念虽然知道，但总觉得不够具体，难以完全理解，稍加挖掘便满头问号。为了深入理解，本项目在Linux上用C和汇编写了一个微型操作系统，进一步理解了软硬件如何协作完成内存管理、操作系统是如何一步步从BIOS开始，载入MBR、OBR、内核，从实模式到保护模式并开启分页，直到最终为用户提供可交互的终端服务（Terminal）。最终呈现出来的终端如下图所示：

![image-20230306153018332](https://raw.githubusercontent.com/a504644805/resources/master/miniOS/terminal.png)

本项目深度参考了[《操作系统真相还原》](https://book.douban.com/subject/26745156/)，在此十二分感谢该书作者的付出。



