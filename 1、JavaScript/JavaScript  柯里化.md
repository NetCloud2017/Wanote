# JavaScript 函数柯里化

参考文章：

函数式编程简析： https://juejin.cn/post/6844903936378273799

## 方法 1

利用重写 toString 方法 计算结果

```js
//指的是将一个接受多个参数的函数变为接受一个参数返回一个函数的固定形式，
//这样便于再次调用，例如f（1）（2）
function add() {
	//将传入的不定参数转为数组对象
	var _args = Array.prototype.slice.call(arguments);
	var _adder = function () {
		_args.push(...arguments);
		return _adder;
	};
	// tostring隐形转换的特性
	_adder.toString = function () {
		return _args.reduce(function (a, b) {
			return a + b;
		}, 0);
	};
	return _adder;
}
let a = add(1, 2, 3);
let b = add(1)(2)(3);
console.log(a);
console.log(b);
console.log(a == 6);
/* 
// 弊端 ： 变量的值不是 数字， 而是利用 == 符号来 
进行隐式调佣 toString方法来计算出值后判断
[Function: _adder] { toString: [Function (anonymous)] }
[Function: _adder] { toString: [Function (anonymous)] }
true
*/
```

## 方法 2

利用 收集的数据总量 和 需要计算的方法的 形参数量对比， 若等于形参数量就执行。

```js
// 支持多参数传递
// 弊端是需要依赖 fn 的length 属性 ， 不够灵活。
function progressCurrying(fn, args) {
	var _this = this;
	var len = fn.length; // length 是fn 的形参个数
	console.log(len, "len");
	var args = [].slice.call(arguments, 1);
	return function () {
		var _args = Array.prototype.slice.call(arguments);

		args.push(..._args);
		console.log(args, "22");
		// 如果参数个数小于最初的fn.length，则递归调用，继续收集参数
		if (args.length < len) {
			return progressCurrying.call(_this, fn, ..._args);
		}

		// 参数收集完毕，则执行fn
		return fn.apply(this, args);
	};
}

function multiply(a, b) {
	return a * b;
}

let aa = progressCurrying(multiply)(2, 3);

console.log(aa, "aa"); // 6
```
