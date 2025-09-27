## tmux

[参考地址](https://github.com/bryant-video/tmux-tutorial/tree/main)
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


```bash
# .tmux.conf 

unbind %
bind | split-window -h -c "#{pane_current_path}"

unbind '"'
bind - split-window -v -c "#{pane_current_path}"

unbind r
bind r source-file ~/.tmux.conf

bind -r j resize-pane -D 5
bind -r k resize-pane -U 5
bind -r l resize-pane -R 5
bind -r h resize-pane -L 5
bind -r m resize-pane -Z

set -g @vim_navigator_mapping_left "C-Left C-h"  # use C-h and C-Left
set -g @vim_navigator_mapping_right "C-Right C-l"
set -g @vim_navigator_mapping_up "C-k"
set -g @vim_navigator_mapping_down "C-j"
set -g @vim_navigator_mapping_prev ""  # removes the C-\ binding

set -g @vim_navigator_prefix_mapping_clear_screen ""

set -g mouse on
set -g mode-keys vi
set -sg escape-time 10 # make delay shorter

### Copy Mode
bind-key -T copy-mode-vi 'v' send -X begin-selection # start selecting text with "v"
bind-key -T copy-mode-vi 'y' send -X copy-selection # copy text with "y"

 查看tmux 启动日志，看看问题， 为啥老是一启动就退出
### Plugins 
set -g @plugin 'tmux-plugins/tpm'

set -g @plugin 'tmux-plugins/tmux-resurrect' # persist tmux sessions after computer restart
set -g @plugin 'tmux-plugins/tmux-continuum' # automatically saves sessions for you every 15 minutes
set -g @plugin 'christoomey/vim-tmux-navigator'
set -g @plugin 'jimeh/tmux-themepack'

set -g @resurrect-capture-pane-contents 'on'
set -g @continuum-restore 'on'
run '~/.tmux/plugins/tpm/tpm' # Initialize TPM

```
> 
    `set -g @continuum-restore 'on'`

    这个配置可能导致 tmux 启动后立即退出，特别是当：

    没有可恢复的会话数据时

    插件未正确安装时

    会话数据损坏时

