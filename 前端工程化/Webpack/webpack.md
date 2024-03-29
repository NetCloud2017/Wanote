# webpack 5

**Question**

·Webpack Module 和 Chunk 有什么区别

·webpack 5 模块联邦的使用场景

·vite 为什么比 webpack 快

·webpack 性能调优手段

[Webpack 5 知识体系](https://gitmind.cn/app/docs/m1foeg1o)

[Webpack 5 核心原理](https://juejin.cn/post/6949040393165996040#heading-13)

[深入 Webpack Plugin](https://mp.weixin.qq.com/s/tXkGx6Ckt9ucT2o8tNM-8w)

[深入 Webapck loader](https://mp.weixin.qq.com/s/TPWcB4MfVrTgFtVxsShNFA)
初始化

编译

编译结果输出

当文件变化 从新编译再输出。

初始化 compiler(config)

plugin 贯穿以下整个流程
run

compile 入口 （entry）

依赖查询 dependencies

loader 处理

chunk

emit 输出

- Webpack 编译原理

- **Webpack Loader & Plugin**

* loader

* plugin

tapable 各个 hook

SyncHook 按顺序执行 回调

SyncBailHook 若是中途返回了 undefined， 则不继续执行

SyncWaterFallHook 传入上一个函数的计算结果

SyncLoopHook

AsyncParallelHook,
AsyncParallelBailHook,
AsyncSeriesHook,
AsyncSeriesBailHook,
AsyncSeriesWaterfallHook

- Webpack 性能调优
  代码分包 splitChunksPlugin
  tree shaking
  Dll 动态链接库将 module 的打包在一起
  多线程大打包， 提升打包速度。 ThreadPlugin
  CDN Gzip Hash 缓存 提升网络访问速度。

- 热更新原理
  模块联邦、 持久化缓存、
- Webpack5 新特性
- Webpack VS Vite

### 构建、 测试 、 部署

做一个公共库需要三证齐全

库对比网站： [Overview](https://bundlers.tooling.report/)
