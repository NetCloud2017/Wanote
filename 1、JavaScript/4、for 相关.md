# for 循环

```javascript
for (var i = 0; i < 100; i++) {
	console.log(i++);
}
```

## `for in `

1、遍历对象的 key

2、会 遍历到对象的原型对象上所有的属性和方法 需要 用 hasOwnProperty 方法判断，避免过度遍历

```javascript
let obj = {
	a: "a ",
};
obj.prototype.name = "zhang san";
obj.prototype.func = function () {};
for (let key in obj) {
	if (arr.hasOwnProperty(key)) {
		// code
	}
}
```

## `for of`

1、 通过 对象的 key 的值 去遍历

2、不会遍历到对象的原型对象上的方法和属性

3、for of 适用遍历数/数组对象/字符串/map/set 等拥有迭代器对象（iterator）的集合，但是不能遍历普通对象，因为没有迭代器对象。

```javascript
let obj = {
	a: "a",
};

// Uncaught TypeError: obj is not iterable at ....
for (var val of obj) {
	console.log(val);
}
```

[自定义可迭代对象](https://juejin.cn/post/6873457657018728456)
