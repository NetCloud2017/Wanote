## tmux

以session 划分

tmux new -s demo ， 以demo 命名打开一个session 窗口。

tmux 默认前缀键是 `ctrl + b`,

分屏

```bash
    水平分屏 %
    垂直分屏 “
```

切换屏幕

```bash
    ctrl + b 然后按 方向键（上下左右）
```

查看 tmux 文档` man tmux`

查看所有的key 用 `ctrl + b ` 然后 `：list-keys`

查看所有的options 用 `ctrl + b ` 然后 `：show-options -g`

- Copy Mode
  进入 copy mode `ctrl + b [`, 退出 `ctrl + c` 或 `shift + a`

给窗口改名： `ctrl + b` 然后 `,`;输入字符后回车。

创建新窗口带名字 `tmux new -s name`

关闭所有session `tmux kill-session`

查看有那些 session `tmux ls`
