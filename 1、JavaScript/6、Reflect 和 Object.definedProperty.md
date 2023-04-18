# Reflect & Object.definedProperty

## Object.definedProperty

```javascript
Object.definedProperty(target, "propName", {
	value: "John", // 初始值
	// 对于新属性，我们需要明确地列出哪些是 true
	writable: true, // 可写入的, 是否可以修改属性值。
	enumerable: true, // 是否可以枚举的， 即 在 for... in ... 中出现
	configurable: true, // 可配置的， 即 是否可以通过 delete  方式删除
});
```

**一次定义多个属性**

```javascript
Object.defineProperties(user, {
	name: { value: "John", writable: false },
	surname: { value: "Smith", writable: false },
	// ...
});
```

## Reflect

所有方法第一个参数不是对象都会报错

**Reflect 对象的设计目的有这样几个：**

1、将 Object 对象的一些明显属于语言内部的方法（比如 Object.defineProperty），放到 Reflect 对象上。

2、修改某些 Object 方法的返回结果，让其变得更合理。比如，Object.defineProperty(obj, name, desc)在无法定义属性时，会抛出一个错误，而 Reflect.defineProperty(obj, name, desc)则会返回 false

3、让 Object 操作都变成函数行为。某些 Object 操作是命令式，比如 name in obj 和 delete obj[name]，而 Reflect.has(obj, name)和 Reflect.deleteProperty(obj, name)让它们变成了函数行为。

4、Reflect 对象的方法与 Proxy 对象的方法一一对应，只要是 Proxy 对象的方法，就能在 Reflect 对象上找到对应的方法。

### Reflect.get(target, name, receiver)

Reflect.get 方法查找并返回 target 对象的 name 属性，如果没有该属性，则返回 undefined。如果第一个参数不是对象，Reflect.get 方法会报错。

```javascript
var myObject = {
	foo: 1,
	bar: 2,
	get baz() {
		return this.foo + this.bar;
	},
};

Reflect.get(myObject, "foo"); // 1
Reflect.get(myObject, "bar"); // 2
Reflect.get(myObject, "baz"); // 3
// 如果name属性部署了读取函数（getter），则读取函数的this绑定receiver。
var myReceiverObject = {
	foo: 4,
	bar: 4,
};

Reflect.get(myObject, "baz", myReceiverObject); // 8
```

## Reflect.set(target, name, value, receiver)

如果第一个参数不是对象，Reflect.set 会报错。

```javascript
var myObject = {
	foo: 1,
	set bar(value) {
		return (this.foo = value);
	},
};

myObject.foo; // 1

Reflect.set(myObject, "foo", 2);
myObject.foo; // 2

Reflect.set(myObject, "bar", 3);
myObject.foo; // 3
// 如果name属性设置了赋值函数，则赋值函数的this绑定receiver。
var myReceiverObject = {
	foo: 0,
};

Reflect.set(myObject, "bar", 1, myReceiverObject);
myObject.foo; // 4
myReceiverObject.foo; // 1
```

注意，如果 Proxy 对象和 Reflect 对象联合使用，前者拦截赋值操作，后者完成赋值的默认行为，而且传入了

receiver，那么 Reflect.set 会触发 Proxy.defineProperty 拦截。

```javascript
let p = {
	a: "a",
};

let handler = {
	set(target, key, value, receiver) {
		console.log("set");
		Reflect.set(target, key, value, receiver);
	},
	defineProperty(target, key, attribute) {
		console.log("defineProperty");
		Reflect.defineProperty(target, key, attribute);
	},
};

let obj = new Proxy(p, handler);
obj.a = "A";
// set
// defineProperty
```

原因：上面代码中，Proxy.set 拦截里面使用了 Reflect.set，而且传入了 receiver，导致触发 Proxy.defineProperty 拦截。这是因为 Proxy.set 的 receiver 参数总是指向当前的 Proxy 实例（即上例的 obj），而 Reflect.set 一旦传入 receiver，就会将属性赋值到 receiver 上面（即 obj），导致触发 defineProperty 拦截。如果 Reflect.set 没有传入 receiver，那么就不会触发 defineProperty 拦截。

### Reflect.construct(target, args)

Reflect.construct 方法等同于 new target(...args)，这提供了一种不使用 new，来调用构造函数的方法。

```javascript
function Greeting(name) {
	this.name = name;
}

// new 的写法
const instance = new Greeting("张三");

// Reflect.construct 的写法
const instance = Reflect.construct(Greeting, ["张三"]);
```

### `Reflect.has(obj, name) `

Reflect.has 方法对应 name in obj 里面的 in 运算符。

### `Reflect.deleteProperty(obj, name) `

Reflect.deleteProperty 方法等同于 delete obj[name]，用于删除对象的属性， 该方法返回一个布尔值。如果删除成功，或者被删除的属性不存在，返回 true；删除失败，被删除的属性依然存在，返回 false

### `Reflect.getPrototypeOf(obj)`

Reflect.getPrototypeOf 方法用于读取对象的**proto**属性，对应 Object.getPrototypeOf(obj)。

Reflect.getPrototypeOf 和 Object.getPrototypeOf 的一个区别是，如果参数不是对象，Object.getPrototypeOf 会将这个参数转为对象，然后再运行，而 Reflect.getPrototypeOf 会报错。

### `Reflect.setPrototypeOf(obj, newProto)`

Reflect.setPrototypeOf 方法用于设置目标对象的原型（prototype），对应 Object.setPrototypeOf(obj, newProto)方法。它返回一个布尔值，表示是否设置成功。如果第一个参数是 undefined 或 null，Object.setPrototypeOf 和 Reflect.setPrototypeOf 都会报错。

### Reflect.apply(func, thisArg, args)

Reflect.apply 方法等同于 Function.prototype.apply.call(func, thisArg, args)，用于绑定 this 对象后执行给定函数。

### Reflect.defineProperty(target, propertyKey, attributes)

Reflect.defineProperty 方法基本等同于 Object.defineProperty，用来为对象定义属性。未来，后者会被逐渐废除，请从现在开始就使用 Reflect.defineProperty 代替它。

### Reflect.getOwnPropertyDescriptor(target, propertyKey)

Reflect.getOwnPropertyDescriptor 基本等同于 Object.getOwnPropertyDescriptor，用于得到指定属性的描述对象，将来会替代掉后者。

### Reflect.isExtensible (target)

Reflect.isExtensible 方法对应 Object.isExtensible，返回一个布尔值，表示当前对象是否可扩展。

### Reflect.preventExtensions(target)

Reflect.preventExtensions 对应 Object.preventExtensions 方法，用于让一个对象变为不可扩展。它返回一个布尔值，表示是否操作成功。

### Reflect.ownKeys (target)

Reflect.ownKeys 方法用于返回对象的所有属性，基本等同于 Object.getOwnPropertyNames 与 Object.getOwnPropertySymbols 之和。

```javascript
var myObject = {
	foo: 1,
	bar: 2,
	[Symbol.for("baz")]: 3,
	[Symbol.for("bing")]: 4,
};

// 旧写法
Object.getOwnPropertyNames(myObject);
// ['foo', 'bar']

Object.getOwnPropertySymbols(myObject);
//[Symbol(baz), Symbol(bing)]

// 新写法
Reflect.ownKeys(myObject);
// ['foo', 'bar', Symbol(baz), Symbol(bing)]
```
