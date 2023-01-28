# vim

<img src="./vim-map.gif" />

## vim 模式简介

vim 的模式三种分别是 normal mode、insert mode、visual mode、 command mode， 在初始启动是 normal mode，在 normal mode 下,进入 insert mode 按 <b> i </b>, 进入 visual mode 可以按 <b> v </b> 键， 进入 command mode 可以按 <b> shift + : </b>; 退出可以按 <b> Esc </b> 键或者按 <b> j j </b> 键两下（vscode vim 的默认配置是 j j）。 推出后就是 normal mode。

> 后面写符号所对应的键，则便是按此键如 i 表示按小写字母 i 键，如此类推。

### visual mode 进阶

|          按键           | 模式              |
| :---------------------: | :---------------- |
|          **v**          | visual mode       |
|      **shift + v**      | visual line mode  |
| **Ctrl + v / Ctrl + q** | visual block mode |

**visual mode**
visual mode: 文本选择是以字符为单位的。

> vim 对文本的操作有 c(change）修改， d (delete) 删除或剪切， y (copy) 复制， p(paste）粘贴。

- visual mode 下的一些操作

|          操作          | 作用                                           |
| :--------------------: | :--------------------------------------------- |
| number + [hjkl] + 操作 | 进行左右文本选择 如： 6 l d                    |
|         c / C          | 文本被选中后， 按 c 删除选中的文本，C 删除整行 |
|           ~            | 让 选中的文本 进行大小写切换                   |
|     shift + < / >      | 让选中的文本进行: < 向左缩进 ， > 向右缩进；   |

**visual line mode**

文本选择是以行为单位的。可以按 数字键 + ( j k ） 方向键 进行上下文本选择, 操作同上 。

**visual block mode**
可以选择一个矩形内的文本。必须先按左右键( h l )， 再按上下 ( j k ) 键， 其他操作同 visual mode 一样；

|        操作         | 作用                                                  |
| :-----------------: | :---------------------------------------------------- |
|     J（ 大写 j)     | 将选中的代码合并成一行，用一空格隔开另一行。          |
|         gJ          | 合并没有空格                                          |
| I (大写 i) + string | 会在选中的文本每行开始的位置插入字符。 空行不会插入。 |
|     r + string      | 会将选中的文本替换为输入内容，空行不会插入。          |
|     A + string      | 会将选中的内容替换并插入每一行。空行也会插入。        |

## vim 操作

### 命令行退出

| 命令行                 | 解析                                    |
| :--------------------- | :-------------------------------------- |
| <b> : wq + enter</b>   | w 是 write，q 是 quit，先保存文件后退出 |
| <b> : q! + enter </b>  | 强制退出 vim 编辑器                     |
| <b> : wqa + enter </b> | a 是 all , 保存所有文件并退出           |

### 光标插入和移动

**光标插入**
| a | b|
| :--- |:---|
| i： 在光标前插入 | a：在光标后插入 |
| I: 在行的最前面插入 | A: 在行的最后面插入 |
| o: 在下一行插入 | O: 在上一行插入 |
<img src="./cursor.png" />

**光标移动**

> normal mode 下移动

1. 上下左右

```
h: 左移一个字符； j: 下移一行; k: 上移一行；l: 右移一个字符；
```

2. 字符间跳转

w: 跳到下一个单词开头

b: 跳到本单词或上一个单词开头

e: 跳到本单词或下一个单词结尾

ge: 跳到上一个单词结尾

<img src="./move.png" />

_1 和 2 的若进行次操作可以用 “数字 + 操作” , 如 2j: 向下两行， 2b, 2w， 2l 等等_

## 安装 NeoVim

    winget install Neovim.Neovim

## normal 模式下的光标移动
