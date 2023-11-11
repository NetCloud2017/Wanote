# Git

相对于集中是管理的 svn, git 是一个分布式的版本管理工具。

## 初始化

```bash
git init
```

git 初始化, 生成一个 `.git` 文件， 对当前目录下的所有文件进行管理。

## 分支管理

**分支创建**

```bash
git branch dev
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

工作现场还在，Git 把 stash 内容存在某个地方了，但是需要恢复一下，有两个办法：
一是用 git stash apply 恢复，但是恢复后，stash 内容并不删除，你需要用 git stash drop 来删除；
另一种方式是用 git stash pop，恢复的同时把 stash 内容也删了：

**给摸个版本打标签：**

```bash
git tag -a v0.1 -m "version 0.1 released" 1094adb (这个是指定版本的 hash)

还可以创建带有说明的标签，用-a 指定标签名，-m 指定说明文字：

git tag v0.9 ff43531 对某个 commit 打 tag
```

**添加修改到暂存区**

git add \* 或 .

全部提交

git add file2.txt file3.txt

只提交对应的文件

**git commit -m"commit modifile file "**

**git push origin 分支**

同时 push 到同一个分支也会冲突

```
解决 先 git pull 若 git pull 也失败了，原因是没有指定本地 dev 分支与远程 origin/dev 分支的链接，根据提示，设置 dev 和 origin/dev 的链接 git branch --set-upstream-to=origin/dev dev

再 git pull

```

(如果 git pull 提示 no tracking information，则说明本地分支和远程分支的链接关系没有创建，用命令 git branch --set-upstream-to=origin/<branch-name> 本地分支名；

因为创建的标签都只存储在本地，不会自动推送到远程。所以，打错的标签可以在本地安全删除。
如果要推送某个标签到远程，使用命令**git push origin v1.0**

一次性推送所有没有推送到远程的 tag
**git push orgin --tags **

**git clone "https......"**
当你从远程仓库克隆时，实际上 Git 自动把本地的 master 分支和远程的 master 分支对应起来了，并且，远程仓库的默认名称是 origin。

```bash
git remote add origin git@github.com:michaelliao/learngit.git

```

把本地库的内容推送到远程，用 git push 命令，实际上是把当前分支 master 推送到远程。

由于远程库是空的，我们第一次推送 master 分支时，加上了-u 参数，Git 不但会把本地的 master 分支内容推送的远程新的 master 分支，还会把本地的 master 分支和远程的 master 分支关联起来，在以后的推送或者拉取时就可以简化命令。不过就是省略了-u

**合并**
**git merge dev **
通常，合并分支时，如果可能，Git 会用 Fast forward 模式，但这种模式下，删除分支后，会丢掉分支信息。
如果要强制禁用 Fast forward 模式，Git 就会在 merge 时生成一个新的 commit，这样，从分支历史上就可以看出分支信息。

```
写法 git merge --no-ff -m "merge with no-ff" dev 合并 dev 分支并提交；
```

**切换 **

**git checkout -b master**

**git checkout -dev**

**删除**

```
rm 文件名（这样直接删除文件会报警， 接着再 git rm test.txt 再 git commit -m "remove test.txt"就不会了

若是删错了，因为版本库里还有呢，所以可以很轻松地把误删的文件恢复到最新版本：

$ git checkout -- test.txt
git checkout 其实是用版本库里的版本替换工作区的版本，无论工作区是修改还是删除，都可以“一键还原”。)

```

**git tag -d v1.0** 本地删除标签

删除远程的标签
要先从本地删除 `git tag -d v0.9` 再从远程删除 `git push origin :refs/tags/v0.9`

**还原**

命令 git checkout -- readme.txt(丢弃工作区)意思就是，把 readme.txt 文件在工作区的修改全部撤销，这里有两种情况：
一种是 readme.txt 自修改后还没有被放到暂存区，现在，撤销修改就回到和版本库一模一样的状态；
一种是 readme.txt 已经添加到暂存区后，又作了修改，现在，撤销修改就回到添加到暂存区后的状态。
总之，就是让这个文件回到最近一次 git commit 或 git add 时的状态。
现在，看看 readme.txt 的文件内容

用命令 git reset HEAD readme.txt （丢弃暂存区） 可以把暂存区的修改撤销掉（unstage），重新放回工作区
git reset 命令既可以回退版本，也可以把暂存区的修改回退到工作区。当我们用 HEAD 时，表示最新的版本。
git log 查看 commit 的版本信息以及 提交日记， 可以利用 提交 版本 ID 回退到某个版本

可以用 git log --pretty=oneline 省略多余的信息

直接退回上一个版本 git reset -- hard HEAD^ 上上个版本 git reset --hard HEAD^^

前 10 个版本 git reset -- hard HEAD~10

注意 ： 如果要找回最新的版本就不要关闭当前的命令窗口，往上找 git log 输出的东西

git reset comitID --hard

Git 提供了一个命令 git reflog 用来记录你的每一次命令 (输出的结果里有 commit ID )

用标签来拉回某个版本

**git tag v1.3**

**显示/查看**

**pwd 显示当前目录**
**cd 文件路径 进入某个目录**
**ls --ah** 查看当前目录隐藏的文件

```bash
ls -al # 查看文件所有信息，包括权限

ls -a

ls -l

```

**cat 文件名 . 后缀名** 查看文件

**git log --graph** 命令可以看到分支合并图

**git rebase**

rebase 操作可以把本地未 push 的分叉提交历史整理成直线；
rebase 的目的是使得我们在查看历史提交的变化时更容易，因为分叉的提交需要三方对比。

git branch -a 可以查看到本地和远程到所有分支 （remotes 开头到都是远程分支）

当本地之前的分支删除的情况下也可以用 checkout 回来 git checkout -b 本地创建的分支名 origin / 远程的分支名
例如 ：git checkout -b dev，

查看远程库的信息 ：**git remote** 详细的 用 ： git remote -v

**git tag** 查看所有的标签

**git show v0.9** 查看标签信息

标签总是和某个 commit 挂钩。如果这个 commit 既出现在 master 分支，又出现在 dev 分支，那么在这两个分支上都可以看到这个标签。

配置一个 git last，让其**显示最后一次提交信息：**

```bash
git config --global alias.last 'log -1'
```

**对比**
git diff

git diff 文件名 将当前工作区文件和版本区的作比较；
用 git diff HEAD -- readme.txt 命令可以查看工作区和版本库里面最新版本的（readme.txt 文件）区别

**配置**

```
git 配置颜色 git config --global color.ui true

```

强制添加别忽略的文件
git add -f 忽略的文件名

```bash

git 配置别名 git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.br branch

```

获取 git 配置

```
option： --global | --local | --system

git config [option] --list

```

https 协议 克隆 输入的 账号密码长期保存

```bash

git config –global credential.helper store

```

这样就设置一个小时之后失效

git config credential.helper ‘cache –timeout=3600’

使用 ssh 协议 clone / pull / push 项目

进入 .ssh 文件看看有没有公钥和私钥

cd ~/.ssh ----> ls

有 id_dsa 为私钥 。id_dsa.pub 为公钥

没有测用以下命令生成
ssh-keygen -t rsa -C "you registor gitlab emaiil"

然后出现

Enter file in which to save the key (/home/you/.ssh/id_rsa):

Enter same passphrase again: [Type passphrase again]
这两个都直接回车可以了

最后出现
Your public key has been saved in /home/you/.ssh/id_rsa.pub.

查看生成的公钥
cat ~/.ssh/id_rsa.pub

然后在 gitlab 或 github 的个人设置里 将公钥放到 ssh-key 里

然后检测是否成功
ssh -T git@github.com

成功出现 ： Hi NetCloud2017! You've successfully authenticated, but GitHub does not provide shell access.

> 去除 git 管理过的 文件 添加到 .gitignore 里

git rm -r --cached ： 去除 本地的文件管理目录， 然后重新 add 、 commit ;

git 移动文件

git mv 文件地址 目标地址

在本地和远程都创建了相同的仓库之后， 关联到远程仓库用：

```
 git branch --set-upstream-to-origin/master master
```

## 切换到远程分支

- 方法 1：

  > 查看远程分支列表

  ```shell
  git branch -r
  ```

  拉取远程分支到本地

  ```shell
  git fetch origin 远程分支名:本地分支名
  如： git fetch origin dev:origin/dev
  ```

  切换到本地分支

  ```shell
  git checkout 本地分支名
  ```

  推送到远程分支

  ```shell
  git push origin 本地分支名:远程分支名
  如： git push origin dev:origin/dev
  ```

- 方法 2：

  将远程 test 分支拉取到本地， 并在本地创建 test 分支；

  ```shell
  git checkout -b test origin/test
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

## 合并

本地分支合并远程某个分支

```bash
# 合并本地分支

git merge branchName

# 合并远程分支

git merge origin/branchName
```

- git merge origin/branchName 和 git merge origin branchName 的区别

  git merge 是可以合并多个分支的，`git merge origin branchName` 这样操作就是就是合并多个分支，
