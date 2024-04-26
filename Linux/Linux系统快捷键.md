ctrl + alt + t 开启终端

notepad

calc

ctrl + alt + 回车 虚拟机全屏

clear + 回车 、 ctrl+ l 终端清屏

ctrl + alt + 加号 放大屏幕

ctrl + 减号 缩小屏幕

ctrl + alt 鼠标退出虚拟机控制

**路径**

```shell

#查看 ascii 码
man ascii

# 进入linux 用户目录
cd ~

# 查看当前所在目录
pwd

# 上一次操作所在路径
cd -

# 新建一个文件
touch a.js

# 新建文件夹
mkdir dir

# 删除
-r 删除文件夹
-f 强制删除
rm [-r, -f] a.js
rm -rf dir # 删除dir 文件夹

# 拷贝操作
cp a.js ./dir/  # 拷贝 a.js 文件到当前目录的 dir 文件夹文件夹里。

cp a.js b.js # 创建文件副本

cp dir ./test/ -a # 复制文件夹到 test 文件夹里面


# 移动操作
mv a.js ./dir #移动a.js 到当前dir 文件夹里面

mv a.js aa.js # 文件a.js 文件名改为 aa.js

mv  dir ./newDir # 文件夹 dir 移动到 文件夹 newDir 里面

```
