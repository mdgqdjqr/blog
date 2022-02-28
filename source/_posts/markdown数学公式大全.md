---
title: markdown数学公式大全
date: 2022-01-07 14:15:23
categories:
  - 学术知识积累
---

在用 markdown 写文档时有时候少不了需要插入一些公式，然而 markdown 公式输入远没有 word 这么直观，有很多复杂的格式和符号的英语缩写需要记忆，经常是刚用完，过几天不用又都忘记了，因此在这里将数学公式的 Latex 编辑方式做一个整理，以方便自己和读者今后使用，希望能帮助到你。

<!--more-->

希腊字母

| 字母       | markdown | 字母          | markdown    |
| ---------- | -------- | ------------- | ----------- |
| A          | A        | $\alpha$      | \alpha      |
| B          | B        | $\beta$       | \beta       |
| $\Gamma$   | \Gamma   | $\gamma$      | \gamma      |
| $\Delta$   | \Delta   | $\delta$      | \delta      |
| E          | E        | $\epsilon$    | \epsilon    |
|            |          | $\varepsilon$ | \varepsilon |
| Z          | Z        | $\zeta$       | \zeta       |
| H          | H        | $\eta$        | \eta        |
| $\Theta$   | \Theta   | $\theta$      | \theta      |
| I          | I        | $\iota$       | \iota       |
| K          | K        | $\kappa$      | \kappa      |
| $\Lambda$  | \Lambda  | $\lambda$     | \lambda     |
| M          | M        | $\mu$         | \mu         |
| N          | N        | $\nu$         | \nu         |
| $\Xi$      | \Xi      | $\xi$         | \xi         |
| O          | O        | $\omicron$    | \omicron    |
| $\Pi$      | \Pi      | $\pi$         | \pi         |
| P          | P        | $\rho$        | \rho        |
| $\Sigma$   | \Sigma   | $\sigma$      | \sigma      |
| T          | T        | $\tau$        | \tau        |
| $\Upsilon$ | \Upsilon | $\upsilon$    | \upsilon    |
| $\Phi$     | \Phi     | $\phi$        | \phi        |
|            |          | $\varphi$     | \varphi     |
| X          | X        | $\chi$        | \chi        |
| $\Psi$     | \Psi     | $\psi$        | \psi        |
| $\Omega$   | \Omega   | $\omega$      | \omega      |



其他符号

| 符号      | markdown | 符号     | markdown |
| --------- | -------- | -------- | -------- |
| $\forall$ | \forall  | $\exist$ | \exist   |



**关系运算符**

| 运算符   | markdown |
| -------- | -------- |
| $\pm$    | \pm      |
| $\times$ | \times   |
| $\div$   | \div     |
| $\sum$   | \sum     |
| $\prod$  | \prod    |
| $\neq$   | \neq     |
| $\leq$   | \leq     |
| $\geq$   | \geq     |



**三角函数**

| 三角函数  | markdown |
| --------- | -------- |
| $sin x$   | sinx     |
| $arcsinx$ | arcsinx  |
| $cosx$    | cosx     |
| $arccosx$ | arccosx  |
| $tanx$    | tanx     |
| $arctanx$ | arctanx  |
| $secx$    | secx     |
| $cscx$    | cscx     |



**对数函数**

| 算式        | markdown  |
| ----------- | --------- |
| $\ln15$     | \ln15     |
| $\log_2 10$ | \log_2 10 |
| $lg7$       | \lg7      |



**分式**

| 算式                 | markdown           |
| -------------------- | ------------------ |
| $\frac{6x+4}{3+y^2}$ | \frac{6x+4}{3+y^2} |



**上标，下标**

| 算式      | markdown |
| --------- | -------- |
| $x_2-x_1$ | x_2-x_1  |
| $x^3-x^2$ | x^3-x^2  |



**省略号**

| 省略号   | markdown |
| -------- | -------- |
| $\cdots$ | \cdots   |



**行内公式 - 使用一个$包含公式可以独立一行**

| 行内公式                                 | markdown                                              |
| ---------------------------------------- | ----------------------------------------------------- |
| $\sum_{i=1}^{n}{(X_i - \overline{X})^2}$ | \sum_{i=1}^{n}{(X_i - \overline{X})^2}<br />两边添加$ |



**行间公式 - 使用两个$包含公式可以独立一行**

| 行间公式                                   | markdown                                               |
| ------------------------------------------ | ------------------------------------------------------ |
| $$\sum_{i=1}^{n}{(X_i - \overline{X})^2}$$ | \sum_{i=1}^{n}{(X_i - \overline{X})^2}<br />两边添加$$ |



**开根号**

| 算式             | markdown       |
| ---------------- | -------------- |
| $\sqrt{3x+6}$    | \sqrt{3x+6}    |
| $\sqrt[3]{7y+9}$ | \sqrt[3]{7y+9} |



**极限**

| 算式                            | markdown                      |
| ------------------------------- | ----------------------------- |
| $\infty$                        | \infty                        |
| $\lim$                          | \lim                          |
| $\lim_{n \to +\infty}n$         | \lim_{n \to +\infty}n         |
| $\lim\limits_{n \to +\infty} n$ | \lim\limits_{n \to +\infty} n |



**微积分**

| 算式                    | markdown              |
| ----------------------- | --------------------- |
| $\int$                  | \int                  |
| $\int^2_3 x^5 {\rm d}x$ | \int^2_3 x^5 {\rm d}x |
| $\prime$                | \prime                |
| $\sum$                  | \sum                  |



**累加，累乘**

| 算式                                      | markdown                                |
| ----------------------------------------- | --------------------------------------- |
| $\sum\limits_{n=0}^\infty \frac{1}{n^2}$  | \sum\limits_{n=0}^\infty \frac{1}{n^2}  |
| $\prod\limits_{n=0}^\infty \frac{1}{n^2}$ | \prod\limits_{n=0}^\infty \frac{1}{n^2} |



