# Git

相对于集中是管理的 svn, git 是一个分布式的版本管理工具。git 的版本管理有三个仓， 分别是工作仓、暂存仓和版本仓。

## 初始化

```bash
git init
```

git 初始化, 生成一个 `.git` 文件， 对当前目录下的所有文件进行管理。

## 分支管理

**分支创建**

```bash
git branch dev

git branch -a
# 查看所有分支

git branch -r
# 查看远程分支

```

创建 dev 分支

**分支删除**

```bash
git branch -D feature-vulcan
```

强制删除分支， 还没有合并的分支是不能用小写 - d 来删除的 需要用大写 - D 来强制删除

**取消文件跟踪：**

参考文章

> [取消文件跟踪](https://cloud.tencent.com/developer/article/2220221#:~:text=1.%E5%8F%96%E6%B6%88%E6%96%87%E4%BB%B6%E8%BF%BD%E8%B8%AA%20%E5%AF%B9%E6%9F%90%E4%B8%AA%E6%96%87%E4%BB%B6%E5%8F%96%E6%B6%88%E8%BF%BD%E8%B8%AA%20git%20rm%20-r%20%E2%80%93cached%20a.txt%E3%80%80%2F%2F%E5%88%A0%E9%99%A4a.txt%E7%9A%84%E8%B7%9F%E8%B8%AA%EF%BC%8C%E5%B9%B6%E4%BF%9D%E7%95%99%E5%9C%A8%E6%9C%AC%E5%9C%B0%20git,%E3%80%80%2F%2F%E5%88%A0%E9%99%A4a.txt%E7%9A%84%E8%B7%9F%E8%B8%AA%EF%BC%8C%E5%B9%B6%E4%B8%94%E5%88%A0%E9%99%A4%E6%9C%AC%E5%9C%B0%E6%96%87%E4%BB%B6%20git%20rm%20-r%20-n%20%E2%80%93cached%20%E6%96%87%E4%BB%B6%2F%E7%9B%AE%E5%BD%95%E5%90%8D%20%2F%2F%E5%88%97%E5%87%BA%E9%9C%80%E8%A6%81%E5%8F%96%E6%B6%88%E8%B7%9F%E8%B8%AA%E7%9A%84%E6%96%87%E4%BB%B6%EF%BC%8C%E4%B8%8D%E4%BC%9A%E5%88%A0%E9%99%A4%E6%96%87%E4%BB%B6%EF%BC%9B-r%E8%A1%A8%E7%A4%BA%E9%80%92%E5%BD%92%EF%BC%8C-n%E8%A1%A8%E7%A4%BA%E5%88%97%E5%87%BA%E6%96%87%E4%BB%B6)

```bash

git rm -r –cached a.txt
# 删除 a.txt 的跟踪，并保留在本地

git rm -r –f a.txt 　
#删除 a.txt 的跟踪，并且删除本地文件

git rm -r -n –cached
# 文件/目录名 //列出需要取消跟踪的文件，不会删除文件；-r 表示递归，-n 表示列出文件

git rm -r –cached D:/WorkSpace/demo/out
## 取消对 out 文件夹下文件取消追踪
```

<b style="color:rgba(255,100,22,1)">\* 对所有文件取消追踪</b>

```bash
git rm -r –cached .
# 不删除本地文件

git rm -r –f .　
# 删除本地文件

# 示例：追踪后文件是绿色显示，未追踪文件标记为红色
git rm -r –cached .
# 取消对所有文件的追踪后，再次 git status 查看文件状态；
```

## 文件暂存 `git stash`

`git stash` 操作用于保存当前还没有完成的工作的分支去创建一个新分支解决当前的紧急任务。如突如其来的线上 bug;

修复后再 checkout 回来。用 `git stash list` 命令看看缓存的列表; 列表以 0 索引开始的， 若是想恢复第一个可以用 `git stash pop` 或 `git stash apply stash@{0}`;

**`git stash pop` 和 `git stash apply stash@{0}` 的区别**

前者应用后会将其从存储列表中删除，而后者则不会。

> git stash 命令总结

```bash
# 缓存
git stash

# 带备注信息缓存
git stash save 'msg'

# 查看缓存列表
git stash list

# 查看更改信息
git stash show 或者 git stash show stash@{1} -p

# 还原操作
git stash pop 或 git stash apply stash@{1}

# 清除缓存列表

# 清楚某个
git stash drop stash@{index}

# 清楚所以
git stash clear

```

## git 打标签

给某个版本打标签

```bash
git tag
# 查看所以标签

git tag v0.9 hash值
# 给某个commit 版本打标签

git show v0.9
# 查看标签v0.9的信息

# 如
git tag v0.9 23fsaae

# 带有备注的
git tag -a v0.1 -m "version 0.1 released" hash值

# 推送标签到远程
git push origin v1.0

# 推送所有标签到远程
git push orgin --tags

# 删除本地标签
git tag -d v0.9

# 删除远程仓库标签
git push origin :refs/tags/v0.9

```

## 文件暂存、提交、推送

```bash
# 暂存所有
git add * 或 git add .

# 暂存对应文件
git add file2.txt file3.txt

# 文件提交
git commit -m"commit modifile file "

# 文件推送

# 首次推送
git push -u origin branchName

# 非首次推送
git push origin branchName

# 文件更新加载
git push 或 git fetch

```

## 本地分支与远程分支建立关联

```bash
git branch --set-upstream-to=origin/remoteBranchName localBranchName
```

## git clone

当你从远程仓库克隆时，实际上 Git 自动把本地的 master 分支和远程的 master 分支对应起来了，并且，远程仓库的默认名称是 origin。

## 本地仓库和远程仓库建立关联

```bash
git remote add origin git@github.com:michaelliao/learngit.git

```

## 代码合并

```bash
git merge dev
# 将dev 分支合并到当前的分支

git merge origin/branchName
# 本地分支合并远程分支

```

`git merge origin/branchName` 和 `git merge origin branchName` 的区别:

```
git merge 是可以合并多个分支的，`git merge origin branchName` 这样操作就是就是合并多个分支，
```

> [`git merge` 和 `git rebase` 的区别](https://juejin.cn/post/7026724793047220254)

## 分支切换

```bash
git checkout -b dev
# 创建一个 dev 分支， 并切换到这个分支

git checkout dev
# 切换到本地的 dev 分支， 没有则报错；

```

## 文件删除

```bash
git rm filePath
```

## 文件恢复

```bash
git checkout -- readme.txt
```

`git checkout -- readme.txt` 意思就是，把 readme.txt 文件在工作区的修改全部撤销，这里有两种情况：

一种是 readme.txt 自修改后还没有被放到暂存区，现在，撤销修改就回到和版本库一模一样的状态；

一种是 readme.txt 已经添加到暂存区后，又作了修改，现在，撤销修改就回到添加到暂存区后的状态。

总之，就是让这个文件回到最近一次 git commit 或 git add 时的状态。

```bash
git reset HEAD readme.txt
```

`git reset HEAD readme.txt` 可以把暂存区的修改撤销掉（unstage），重新放回工作区;

## git 日志查看

```bash
git log

git log --pretty=oneline
# 可以用省略多余的信息

git log -1
# 显示最后一次提交信息 1 (是 一)

git reflog
# git reflog 用来记录你的每一次命令 (输出的结果里有 commit ID )
```

## git 版本回滚

```bash
git reset --hard HEAD^
# 直接退回上一个版本

git reset --hard HEAD^^
# 回滚到上上个版本

git reset --hard HEAD~10
# 回滚到第前 10 个版本

git reset commitID --hard
# 回滚到某次commit 的版本

git reset --soft HEAD~1 main.js
# 将 main.js 文件回滚到 上一个版本

```

## 常用命令

```bash
pwd
# 查看当前目录地址
```

**cd**

```bash
cd folder path
# 进入某个目录

# 例如
cd ../

cd ./src
```

**ls**

```bash
ls

ls --ah
# 查看当前目录隐藏的文件

ls -al
# 查看文件所有信息，包括权限

ls -a

ls -l

```

**cat 文件查看**

```bash
cat file path

# 例如
cat ./readme.md

```

## 查看远程地址

```bash
git remote -v

```

## 使用 ssh 协议 clone / pull / push 项目

进入 .ssh 文件看看有没有公钥和私钥

```bash
cd ~/.ssh

ls

# 有 id_dsa 为私钥 。id_dsa.pub 为公钥

```

没有测用以下命令生成公钥和私钥：

```bash
ssh-keygen -t rsa -C "you registor gitlab emaiil"

# 例如

ssh-keygen -t rsa -C "12345@gmail.com"
```

然后出现

```

Enter file in which to save the key (/home/you/.ssh/id_rsa):

Enter same passphrase again: [Type passphrase again]
```

这两个都直接回车可以了

最后出现

```
Your public key has been saved in /home/you/.ssh/id_rsa.pub.
```

查看生成的公钥:

```bash
cat ~/.ssh/id_rsa.pub
```

然后在 gitlab 或 github 的个人设置里 将公钥放到 ssh-key 里;

检测是否可以链接成功

`ssh -T git@github.com`

成功出现 ： Hi xxxx! You've successfully authenticated, but GitHub does not provide shell access.

## 去除 git 管理过的 文件 添加到 .gitignore 里

```bash
git rm -r --cached
```

去除本地的文件管理目录，然后重新 add 、 commit;

## git 移动文件

```bash
git mv 文件地址 目标地址
```

## 将远程某个分支拉取到本地

```bash
# 1
git checkout -b test origin/test

# 2
git fetch origin 远程分支名:本地分支名

# 如：
git fetch origin dev:localdev
```

## Git 命令简写配置

**查看 git 配置：**

    git config --system -l

    git config --global -l

    git config --local -l

**常用命令简写配置**

    git config --global alias.st status

    git config --global alias.pl pull

    git config --global alias.ps push

    git config --global alias.ci commit -m

    git config --global alias.lg log

    git config --global alias.co checkout

    git config --global alias.br branch

    git config --global alias.mg merge
