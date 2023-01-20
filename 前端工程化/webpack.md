### webpack 原理

·Webpack Module 和 Chunk 有什么区别
·webpack 5 模块联邦的使用场景
·vite 为什么比 webpack 快
·webpack 性能调优手段

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
- Webpack5 新特性
- Webpack VS Vite
