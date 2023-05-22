# 运行时

1、 html 树， dom 树。
2、 虚拟 dom 树。

那么明确好了什么叫做节点树之后，什么是虚拟 DOM 树呢？

可能有很多同学听说过虚拟 DOM 的概念，虚拟 DOM 树和虚拟 DOM 是息息相关的。

**\# 来自 vue 官方文档**

> 虚拟 DOM（Virtual DOM，简称 VDOM）是一种编程概念，意为将目标所需的 UI 通过数据结构“虚拟”地表示出来，保存在内存中，然后将真实的 DOM 与之保持同步。这个概念是由 Beact 率先开拓，随后在许多不同的框架中都有不同的实现，当然也包括 Vue。

虚拟 DOM 是一种理念，比如，我期望通过一个 JavaScript 对象来描述一个 div 节点它的子节点是一个文本节点 text，则可以这么写：

```javascript
// <div»text</div>
//通过 虚拟 dom表示
const vnode = {
	type: "div",
	children: "text",
};
```

**运行时核心设计原则**

需要大家在本小节中了解的设计原则分为两个：

    1.runtime-core与 runtime-dom的关系，为什么要这么设计
    2.渲染时，挂载和更新的逻辑处理

runtime-core 与 runtime-dom 的关系，为什么要这么设计

在 vue 源码中，关于运行时的包主要有两个：

    1. packages/runtime-core：运行时的核心代码
    2.packages/runtime-dom：运行时关于浏览器渲染的代码

其中第一个 runtime-core 的概念比较好理解，但是 runtime-dom 它是干什么的呢？为什么要单独分出来这样的一个包呢?

因为 vue 有许多渲染场景例如 web 段， 服务端 ssr, 还有 app 端。 所以要分开。
