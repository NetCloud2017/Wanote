# npm link

这个命令相当于 `npm  install -g  pkg` ， 这个命令常在创建自己的 npm 包时使用， 尤其是在创建自己的脚手架工具时。当自己创建的 npm 包时，包的 `package.json` 配置为：

```json

{
    "name": "my-cli",
    "main": "./index.js",
    "bin": "./bin/index.js" // 这样配置时， 当安装好的命令就是 name. 若是想自定义则用对象的形式。
    "bin": {
        "ccli": "./bin/index.js"
    }
}
```

那么我们运行 npm link 它是怎么将这个命令放在当前环境里的呢？ 原因是在运行这个命令的时候， node 会将这个包全局安装到 当前自己安装 node 的目录的 node_modules 文件夹里面。 例如我的：` 'D:\appProgram\nodejs\node_modules\my-cli\bin\index.js'`。
当我们执行 ccli 命令行的时候。node 就会找到全局安装的 `bin/index.js` 文件运行。

但是我们运行 `npm unlink my-cli` 的时候， 我们再在终端里运行 ccli 发现， 还是会可以运行。这是因为它只会删除本地的软链接，而不会删除全局安装的二进制文件。 需要运行 `npm uninstall -g  my-cli` 才会完全删掉。
