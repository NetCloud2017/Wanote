```js
function _new(func, pramas) {
	let instance = {};
	func.call(instance, pramas);
	instance.__proto__ = func.prototype;
	return instance;
}

function Bar({ name, count }) {
	this.name = name;
	this.count = count;
}
_new(Bar, { name: "张三", count: "12" });
```

[关于更多 new 的细节](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Operators/new)
