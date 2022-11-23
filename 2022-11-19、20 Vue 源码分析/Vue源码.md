## vue3.0

### 代码结构 - 单体仓库 => 多依赖的拆分

npm 跨包依赖 => 主体功能拆分成互相解耦的模块，汇集在一个 git 仓库中

### 整体结构

都在 package 文件夹里

1. compiler-xxx => 编译模板模块
   a. core - 模板解析核心 => 基础函数
   b. dom - 浏览器下，HTML + 指令（v-xxx）
   c. sfc - Vue 单文件解析系统
   d. ssr - 服务端渲染下的模板解析

2. runtime-xxx => 运行时
   a. core - 通用运行时核心方法
   b. dom - 浏览器下，运行时配套
   c. test - 自动化测试

3. 辅助系统
   reactivity - 响应式核心
   reactivity-transform - 响应式语法糖（$ref 等）
   shared - 共享工具
   size-check - 包大小工具的测试工具
   sfc-playground - 代码用例测试工具
   template-explorer - 模板用例测试工具
   server-renderer - 服务端渲染相关

4. 主入口
   vue - vue3 主入口
   vue-compat - vue2 兼容属性可配置

### 重点模块解读

#### 1. 入口

> Vue 3 入口文件
> vue/src/index.ts => compile => render()

主要做的事，利用 compileToFunction
将传入的模板编译成渲染函数

    compileToFunction 逻辑
    1. 判断模板
    2. 判断模板是否有被缓存， 有则被编译过。

```js
const cached = compileCache[key];
if (cached) {
	return cached;
}
```

    3. compile 函数传入模板和配置
    4. 通过 new  Function 的方式生成 render 函数
    5. 最后作编译缓存， 并返回 render

    总结:
    // 过程
    // 1. 默认把compileToFunction注册成为运行时编译器
    // 2. 运行时调用compileToFunction
    // 3. 利用compileToFunction运行compile返回结果code
    // 4. code传入到function直接运行
    // 5. 匿名函数的返回给到render()进行缓存

> Vue 2 入口文件

#### 2. compiler - 编译模块

compiler-core

1. baseParse() - 模板生成 AST
2. transform() - AST 进行整合
3. generate() - 完成 AST 转换后生成 code

<!-- new Function() -->
<!-- eval -->

#### 3. reactivity

vue2.x 1.数据劫持
Object.defineProperty

2.依赖收集
deps

```ts
computed: {
    computedObj() {
        return obj + 2 - 1 + 666;
    }
}
watcher

3. observer
```

vue3.x 1.数据劫持
proxy => esNext

2. 依赖收集
   deps
   effect(fn)依赖关系的响应

3. 调度器
