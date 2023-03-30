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

cross-env

webpack-bundle-analyzer 打包分析

thread-loader

copy-webpack-plugin

webpack.DllPlugin

webpack.DllReferencePlugin

add-asset-html-webpack-plugin

semver: 对版本号进行比较。

chokidar 做文件监听。

child_process: 开启子进程

detect-port : node 中 检测端口是否被占用。

glob 使用 shell 模式匹配文件
[glob ](https://www.jianshu.com/p/5274cb9d1fc6)
[node glob](https://juejin.cn/post/6844903906024095758)

mini-css-extract-plugin
purgecss-webpack-plugin

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
