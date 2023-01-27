# vim

<img src="./vim-map.gif" />

## vim 模式简介

vim 的模式三种分别是 normal mode、insert mode、visual mode、 command mode， 在初始启动是 normal mode，在 normal mode 下,进入 insert mode 按 <b> i </b>, 进入 visual mode 可以按 <b> v </b> 键， 进入 command mode 可以按 <b> shift + : </b>; 退出可以按 <b> Esc </b> 键或者按 <b> j j </b> 键两下（vscode vim 的默认配置是 j j）。 推出后就是 normal mode。

## vim 操作

### 命令行退出

|         命令行         |                  解析                   |
| :--------------------: | :-------------------------------------: |
|  <b> : wq + enter</b>  | w 是 write，q 是 quit，先保存文件后退出 |
| <b> : q! + enter </b>  |           强制退出 vim 编辑器           |
| <b> : wqa + enter </b> |      a 是 all , 保存所有文件并退出      |

### 光标插入和移动

## 安装 NeoVim

    winget install Neovim.Neovim

## normal 模式下的光标移动
