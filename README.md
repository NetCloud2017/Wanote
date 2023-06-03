# Wanote

this is my note in front end and set up in 2022.

# source Path:

[入门测试](https://applnzi6vl27059.h5.xiaoeknow.com/p/t/v1/exam/h5_evaluation/examination/review/ex_6246712456a6e_WALsc5lx/uexam_6347dd3457887_qbsNrY0BH3?content_app_id=)

[正式课课件地址](https://vgbixa7nr9.feishu.cn/drive/folder/fldcnBVdaLZMMFlsgBAlSOhVyKK)

[基础课课件地址](https://vgbixa7nr9.feishu.cn/drive/folder/fldcn2iD6t7xkDRiVH1TCcpENwb)

[旧课件地址](https://vgbixa7nr9.feishu.cn/sheets/shtcnkd1pZbpd9YguydlEh9jYBB)

阶段评测：
[阶段评测 1](https://applnzi6vl27059.h5.xiaoeknow.com/evaluation_wechat/examination/introduce/ex_63a50f8a98d1d_QDpatHV2)

# ALL Package

工程化相关的包：

webpack

webpack-dev-middleware
webpack-hot-middleware

memory-fs 将文件放到内存中

speed-measure-webpack-plugin 打包性能分析。

cross-env: 在 package.json 的 script 中修改环境变量。

```json
{
	"script": "cross-env mode=production webpack  --c ./config/webpack.config.json"
}
```

webpack-bundle-analyzer 打包分析

thread-loader

copy-webpack-plugin

webpack.DllPlugin: 对 vandor 第三方模块进行打包。

webpack.DllReferencePlugin：dll 检测哪些文件 被 dll 打包过。

add-asset-html-webpack-plugin: 将 dll 分包的模块插入到 html 文件里

semver: 对版本号进行比较。

chokidar 做文件监听。

child_process: 开启子进程

detect-port : node 中 检测端口是否被占用。

inquirer： 命令行交互。

commander：命令解析工具

chalk: 美化命令行文字样式

download-git-repo: git 模板下载库

fs-extra: 返回 promise 对象的， fs 拓展库， 用于代替 fs.

ora: 命令行里的 loading 图标。

glob: node 的 glob 模块允许你使用 \*等符号, 来写一个 glob 规则,像在 shell 里一样,获取匹配对应规则的文件.，这个 glob 工具基于 javascript.它使用了 minimatch 库来进行匹配
[glob ](https://www.jianshu.com/p/5274cb9d1fc6)
[node glob](https://juejin.cn/post/6844903906024095758)

fast-glob: 比 glob 更高效的 文件匹配库。

npmlog： 脚手架日志打印。

mini-css-extract-plugin: 压缩 CSS
purgecss-webpack-plugin: 删除没有的 CSS

webpack-chain: 让你创建一个额外的 webpack 配置。

[查看 node 兼容情况网站](https://node.green)

[ts-node](https://www.npmjs.com/package/ts-node) 可以直接运行 ts 文件

```json
    "script":{
        "start": "ts-node -w  ./index.ts"
    }
```

[body-parser](https://www.npmjs.com/package/body-parser) 请求体解析

[cookie-session](https://www.npmjs.com/package/cookie-session) 服务端 cookie

[concurrently](https://www.npmjs.com/package/concurrently) 同步执行 命令

```json
// 同步执行命令
"script": {
    "dev:start": "tsc -w",
    "dev:build": "nodemon node ./dist/index.js",
    "start": "concurrently npm run dev:build & npm run dev:start",
    // 简写
    "start": " concurrently npm:dev:* ", //带 dev: 的都会被运行
}
```

[superagent](https://www.npmjs.com/package/superagent) // 模仿网络请求， 做数据爬虫用。
[cheerio](https://www.npmjs.com/package/cheerio) 服务端用的 jQuery。

[clinic](https://www.npmjs.com/package/clinic)

## Vue

[vue]
[vue-router]
[@vue/compiler-sfc]() vue 语法向低版本兼容。
[vuex]
[@vue/cli-service]

vuex-router-sync 将 store 注入到 route 中。

## vite

@vitejs/plugin-vue : 处理 vue SFC 文件。

vite-plugin-compression： vite 项目打包开启 zip 压缩。

## babel

[babel 地址](https://babel.docschina.org/docs/en/plugins/)

专门处理 js 编译工作， 不做模块化处理的库群, 模块化还是要用 webpack 等打包工具处理， 所有的共功能都包含在 @babel/preset-xxx 这些专门处理的库里。

在配置文件里， plugin 是安装顺序执行的， 而 preset 是按颠倒顺序执行的。

core-js：是一个第三方的 js 兼容处理库 ， 对应的 pollify 库有 pollify, transform-runtime 配合 babel-transform-runtime
