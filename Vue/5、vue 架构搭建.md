# Vue 框架搭建

1.创建 vue-next-mini 文件夹

2.通过 VSCode 打开

3.在终端中，通过

```

npm init-y
```

创建 package.json 模块

4.创建 packages 文件夹，作为：核心代码区城

5.创建 packages/vue 文件夹：打包、测试实例、项目整体入口模块

6.创建 packages/shared 文件夹：共享公共方法模块

7.创建 packages/compiler-core 文件夹：编辑器核心模块

8.创建 packages/compiler-dom 文件夹：浏览器部分编辑器模块

9.创建 packages/reactivity 文件夹：响应性模块

10.创建 packoges/runtime-core 文件夹：运行时核心模块

11.创建 packages/runtime-dom 文件夹：浏览器部分运行时模块

因为 Vue3 是使用 TS 进行构建的，所以在我们的项目中，也将通过 TS 进行构建整个项目，那么我们又应该如何在项目中使用 ts 呢？
