# Proxy

Proxy 可以理解成，在目标对象之前架设一层“拦截”，外界对该对象的访问，都必须先通过这层拦截，因此提供了一种机制，可以对外界的访问进行过滤和改写。Proxy 这个词的原意是代理，用在这里表示由它来“代理”某些操作，可以译为“代理器”。

参考连接：

https://es6.ruanyifeng.com/#docs/proxy#%E5%AE%9E%E4%BE%8B%EF%BC%9AWeb-%E6%9C%8D%E5%8A%A1%E7%9A%84%E5%AE%A2%E6%88%B7%E7%AB%AF

```javascript
let obj = {}; // 目标对象
var proxy = new Proxy(obj, {
	get: function (target, propKey, receiver) {
		/*
        target: 是 obj
        propKey: 拦截的 键名 key
        receiver: 操作的对象, 就是 proxy 这个代理对象。 
    */
		return Reflect.get(target, propKey, receiver);
	},
	set: function (target, propKey, value, receiver) {
		return Reflect.set(target, propKey, value, receiver);
	},
});
```

**1、如果 handler 没有设置任何拦截，那就等同于直接通向原对象。**

```javascript
var target = {};
var handler = {};
var proxy = new Proxy(target, handler);
proxy.a = "b";
target.a; // "b"
// handler是一个空对象，没有任何拦截效果，访问proxy就等同于访问 target。
```

**常用拦截操作：**

`get(target, propKey, receiver)`：

拦截对象属性的读取，比如 proxy.foo 和 proxy['foo']。

```javascript
// get方法可以继承。
let proto = new Proxy(
	{},
	{
		get(target, propertyKey, receiver) {
			console.log("GET " + propertyKey);
			return target[propertyKey];
		},
	}
);

let obj = Object.create(proto);
obj.foo; // "GET foo"
```

如果一个属性不可配置（configurable）且不可写（writable），则 Proxy 不能修改该属性，否则通过 Proxy 对象访问该属性会报错。

```javascript
const target = Object.defineProperties(
	{},
	{
		foo: {
			value: 123,
			writable: false,
			configurable: false,
		},
	}
);
const handler = {
	get(target, propKey) {
		return "abc";
	},
};
const proxy = new Proxy(target, handler);

proxy.foo; // TypeError: Invariant check failed
```

**`set(target, propKey, value, receiver)`**

拦截对象属性的设置，比如 proxy.foo = v 或 proxy['foo'] = v，返回一个布尔值。`注意，如果目标对象自身的某个属性不可写，那么 set 方法将不起作用。`

```javascript
const obj = {};
Object.defineProperty(obj, "foo", {
	value: "bar",
	writable: false,
});
const handler = {
	set: function (obj, prop, value, receiver) {
		obj[prop] = "baz";
		return true;
	},
};
const proxy = new Proxy(obj, handler);
proxy.foo = "baz";
proxy.foo; // "bar"
```

```javascript
// set 方法的第四个参数 receiver，指的是原始的操作行为所在的那个对象，一般情况下是 proxy 实例本身，请看下面的例子。
const handler = {
	set: function (obj, prop, value, receiver) {
		obj[prop] = receiver;
		return true;
	},
};
const proxy = new Proxy({}, handler);
const myObj = {};
Object.setPrototypeOf(myObj, proxy); // myObj 的原型对象 proxy 是一个 Proxy 实例，设置它的 foo 属性会触发 set 方法。

myObj.foo = "bar";
myObj.foo === myObj; // true
```

注意，set 代理应当返回一个布尔值。严格模式下，set 代理如果没有返回 true，就会报错。

```javascript
"use strict";
const handler = {
	set: function (obj, prop, value, receiver) {
		obj[prop] = receiver;
		// 无论有没有下面这一行，都会报错
		return false;
	},
};
const proxy = new Proxy({}, handler);
proxy.foo = "bar";
// TypeError: 'set' on proxy: trap returned falsish for property 'foo'
// 严格模式下，set 代理返回 false 或者 undefined，都会报错
```

**`apply(target, object, args)`**

拦截 Proxy 实例作为函数调用的操作，比如 proxy(...args)、proxy.call(object, ...args)、proxy.apply(..

```javascript
// apply 方法可以接受三个参数，分别是目标对象、目标对象的上下文对象（this）和目标对象的参数数组。
var twice = {
	apply(target, ctx, args) {
		return Reflect.apply(...arguments) * 2;
	},
};
function sum(left, right) {
	return left + right;
}
var proxy = new Proxy(sum, twice);
proxy(1, 2); // 6
proxy.call(null, 5, 6); // 22
proxy.apply(null, [7, 8]); // 30

// 另外，直接调用 Reflect.apply 方法，也会被拦截。
Reflect.apply(proxy, null, [9, 10]); // 38
```

has(target, propKey)：拦截 propKey in proxy 的操作，返回一个布尔值。

值得注意的是，has()方法拦截的是 HasProperty 操作，而不是 HasOwnProperty 操作，即 has()方法不判断一个属性是对象自身的属性，还是继承的属性。另外，虽然 for...in 循环也用到了 in 运算符，但是 has()拦截对 for...in 循环不生效。

```javascript
var handler = {
	has(target, key) {
		if (key[0] === "_") {
			return false;
		}
		return key in target;
	},
};
var target = { _prop: "foo", prop: "foo" };
var proxy = new Proxy(target, handler);
"_prop" in proxy; // false
```

上面代码中，如果原对象的属性名的第一个字符是下划线，proxy.has()就会返回 false，从而不会被 in 运算符发现。

如果原对象不可配置或者禁止扩展，这时 has()拦截会报错。

```javascript
var obj = { a: 10 };
Object.preventExtensions(obj);
var p = new Proxy(obj, {
	has: function (target, prop) {
		return false;
	},
});
"a" in p; // TypeError is thrown
```

construct(target, args)：拦截 Proxy 实例作为构造函数调用的操作，比如 new proxy(...args)。

target：目标对象。args：构造函数的参数数组。newTarget：创造实例对象时，new 命令作用的构造函数

```javascript
// construct()方法返回的必须是一个对象，否则会报错。
const p = new Proxy(function () {}, {
	construct: function (target, argumentsList) {
		return 1;
	},
});

new p(); // 报错
// 另外，由于 construct()拦截的是构造函数，所以它的目标对象必须是函数，否则就会报错。
const p = new Proxy(
	{},
	{
		construct: function (target, argumentsList) {
			// 注意，construct()方法中的 this 指向的是 handler，而不是实例对象。
			return {};
		},
	}
);
new p(); // 报错
// Uncaught TypeError: p is not a constructor
```

deleteProperty(target, propKey)：拦截 delete proxy[propKey]的操作，返回一个布尔值。

ownKeys(target)：拦截 Object.getOwnPropertyNames(proxy)、Object.getOwnPropertySymbols(proxy)、Object.keys(proxy)、for...in 循环，返回一个数组。该方法返回目标对象所有自身的属性的属性名，而 Object.keys()的返回结果仅包括目标对象自身的可遍历属性。

getOwnPropertyDescriptor(target, propKey)：拦截 Object.
getOwnPropertyDescriptor(proxy, propKey)，返回属性的描述对象。

defineProperty(target, propKey, propDesc)：拦截 Object.defineProperty(proxy, propKey, propDesc)、Object.defineProperties(proxy, propDescs)，返回一个布尔值。

preventExtensions(target)：拦截 Object.preventExtensions(proxy)，返回一个布尔值。

getPrototypeOf(target)：拦截 Object.getPrototypeOf(proxy)，返回一个对象。

isExtensible(target)：拦截 Object.isExtensible(proxy)，返回一个布尔值。

setPrototypeOf(target, proto)：拦截 Object.setPrototypeOf(proxy, proto)，返回一个布尔值。如果目标对象是函数，那么还有两种额外操作可以拦截。

## Proxy 代理过程中， 目标对象的 this 问题

虽然 Proxy 可以代理针对目标对象的访问，但它不是目标对象的透明代理，即不做任何拦截的情况下，也无法保证与目标对象的行为一致。主要原因就是在 Proxy 代理的情况下，目标对象内部的 this 关键字会指向 Proxy 代理。

```javascript
const target = {
	m: function () {
		console.log(this === proxy);
	},
};
const handler = {};

const proxy = new Proxy(target, handler);

target.m(); // false
proxy.m(); // true
```

下面是一个例子，由于 this 指向的变化，导致 Proxy 无法代理目标对象。

```javascript
const _name = new WeakMap();
class Person {
	constructor(name) {
		_name.set(this, name);
	}
	get name() {
		return _name.get(this);
	}
}
const jane = new Person("Jane");
jane.name; // 'Jane'
const proxy = new Proxy(jane, {});
proxy.name; // undefined
```

有些原生对象的内部属性，只有通过正确的 this 才能拿到，所以 Proxy 也无法代理这些原生对象的属性。

```javascript
const target = new Date();
const handler = {};
const proxy = new Proxy(target, handler);
proxy.getDate();
// TypeError: this is not a Date object.

// 解决方法
const target = new Date("2015-01-01");
const handler = {
	get(target, prop) {
		if (prop === "getDate") {
			return target.getDate.bind(target);
		}
		return Reflect.get(target, prop);
	},
};
const proxy = new Proxy(target, handler);
proxy.getDate(); // 1
```

另外，Proxy 拦截函数内部的 this，指向的是 handler 对象。

```javascript
const handler = {
	get: function (target, key, receiver) {
		console.log(this === handler);
		return "Hello, " + key;
	},
	set: function (target, key, value) {
		console.log(this === handler);
		target[key] = value;
		return true;
	},
};
const proxy = new Proxy({}, handler);

proxy.foo;
// true
// Hello, foo
proxy.foo = 1;
// true
```

this 问题 总结：

1、 目标对象方法里的 this 指向 proxy 实例
2、Proxy 无法代理原生对象（Date .. 等）实例的属性
3、handle 对象的 this 指向 handle;
