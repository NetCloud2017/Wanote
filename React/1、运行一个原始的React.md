# React 项目运行条件

## 1. 引入 React 和 React-dom

```html
<script
	scr="https://unpkg.com/react@18.1.0/umd/react.development.js"
	crossorigin
></script>
<script
	scr="https://unpkg.com/react@18.1.0/umd/react-dom.development.js"
	crossorigin
></script>
```

## 2. 创建 React 组件

```javascript

const  createElement = window.react.createElement;
function Container() {
    return createElement('div', {
        onClick: ()=> {
            console.log('hello');
        },
        'dom  content'
    })
}
```

## 3. 生成 vdom ；

```javascript
const rootDom = domcument.querySelector("#app");
const root = window.reactDOM.createRoot(rootDom);
const vnode = createElement(Container);
```

## 4. 渲染 vdom

```javascript
root.render(vnode);
```

为了让 React 支持 jsx 的写法引入 babal

```html
<script
	scr="https://unpkg.com/babel-standalone@6.26.0/babel.min.js"
	crossorigin
></script>

<script type="text/babel">
	function Container() {
		return (
			<div
				onClick={() => {
					console.log("hello");
				}}
			>
				text content
			</div>
		);
	}
</script>
```
