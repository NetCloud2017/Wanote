# Nuxtjs

## 应用场景

从头搭建一个服务端渲染的应用是相当复杂的，基于 Vue 技术栈的 Nuxt.js 框架让这一切变得非常简单，Nuxt.js 中大量的配置项可以开启自动引入，比如组件、视图、路由、一些内置 APl 等等，依葫芦画瓢就行，但是如果你需要更直接地控制应用程序的结构，Nuxt.js 并不适合这种使用场景，这也正是我们后面需要学习的另一种 SSR 方案。

> npx nuxi@latest init my-app

> `Error: Failed to download template from registry: fetch failed` 出现这个错误可以更改电脑的 DNS 服务地址。

添加 pages 目录， 创建 home.vue 文件, 这个文件的名字就是路由的名字, 路由在运行 `npm  run dev` 的时候就会被自动创建。

将 app.vue 文件的 NuxtWecome 内置组件更改为 NuxtPage 组件， 这个组件相当于 link-view 组件。 作为顶层的展示窗口。
