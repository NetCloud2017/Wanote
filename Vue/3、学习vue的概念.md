# Vue 三个概念

vue 中的 HTML 是 真的 HTML 吗？Vue 进行了什么处理。

## 运行时

vue 的运行时代码放在 runtime-core 里面。[link](https://github.com/vuejs/core/tree/main/packages)

```javascript
const VNode = {
	type: "div",
	props: {
		class: "test",
	},
	children: "hello render",
};
//创建 render渲染函数
function render(vnode) {
	// 根据 type 生成 element
	const ele = document.createElement(vnode.type);
	// 把 props 中的 class 赋值给 ele 的 className
	ele.className = vnode.props.class;
	// 把 children 赋值给 ele 的 innerText
	ele.innerText = vnode.children;
	// 把 ele 作为子节点插入 body 中
	document.body.appendChild(ele);
}
```

运行时可以利用 render 把 vnode 渲染成真实 dom 节点。也就是 Vue 代码被编译后的代码， 就是运行时代码。

## 编译时

```html
<body>
	<div id="app"></div>
</body>
<script>
	const { compile, createApp } = Vue
	//创建一个html结构
	const html = `<div class="test">hello compiler</div>`
	//利用compile 函数，生成render 函数
	const renderFn = compile(html)  // 编译器处理要编译的HTML 代码。
	//创建实例

	// 编译后的代码就是运行时的代码。
	const app = createApp({
	//利用render 函数进行渲染
	    render: renderFn
	}）

	//挂载
	app.mount（'#app')
</script>
```

对于编译器而言，它的主要作用就是：把 template 中的 html 编译成 render 函数。然后再利用运行时通过 render 挂载对应的 DOM。

总结：**编译时可以把`html`的节点，编译成`render`函数**

## 运行时 + 编译时

前面两小节我们已经分别了解了运行时和编译时，同时我们也知道了：vue 是一个运行时+编译时的框架！

> vue 通过 compiler 解析 html 模板,生成 render 函数,然后通过 runtime 解析 render，从而挂载真实 dom。

既然 compiler 可以直接解析 html 模板，那么为什么还要生成 render 函数，然后再去进行渲染呢?为什么不直接利用 compiler 进行渲染呢?

：为什么 vue 要设计成一个运行时+编译时的框架呢?

那么想要理清楚这个问题，我们就需要知道 dom 渲染是如何进行的。

对于 dom 渲染而言，可以被分为两部分：

1.初次渲染，我们可以把它叫做挂载

2.更新渲染，我们可以把它叫做打补丁

为什么 vue 要设计成一个运行时+编译时的框架呢?答：

1.针对于纯运行时而言：因为不存在编译器，所以我们只能够提供一个复杂的 JS 对象。

2.针对于纯编译时而言：因为缺少运行时，所以它只能把分析差异的操作，放到编译时进行，同样因为省略了运行时，所以速度可能会更快。但是这种方式这将损失灵活性（具体可查看第六章虚拟 DOM，或可点击这里查看官方示例）比如 svelte，它就是一个纯编译时的框架，但是它的实际运行速度可能达不到理论上的速度。

3.运行时+编译时：比如 vue 或 react 都是通过这种方式来进行构建的，使其可以在保持灵活性的基础上，尽量的进行性能的优化，从而达到一种平衡。
