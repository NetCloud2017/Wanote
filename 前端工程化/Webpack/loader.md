loader 的执行循序是从下到上， 或从右到左。

自定义 loader；

//判断当前模块是否为主模块，如果为主模块，则运行以下代码
//用来对 Loader 进行单独测试
if (require.main === module){

即 node index.js ， 这个 index.js 就是一个主模块。

内联调用 loader

`import 'style-loader!css-loader!./index.css'`

[vue loader 执行机制](https://github.com/xixizhangfe/vue-loader)

```javascript
// loader

exports.default = function (content) {
	console.log(content.replace(";", ""), this.data);
	let { resourcePath, resourceQuery } = this;

	return content;
};

// 在loader 执行之前会顺向执行 每个loader的 pitch 函数， pitch 函数的作用是用来做排除的。就是判断当前的loader 是否要执行。如果需要执行就返回 true,否则返回 false

// 用 pitch 函数必须用 exports.default 导出 loader.

exports.pitch = function (a, b, data) {
	// pitch 做数据透传
	data.value = "value";

	// data 只能在当前loader中透传。
};
```

vueloader 的循环解析 vueloader
