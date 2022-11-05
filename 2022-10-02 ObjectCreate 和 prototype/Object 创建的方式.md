### 类与继承

### 课程目标

- 搞清楚原型链
- 知道组合寄生继承，知道 class 继承
- 知道怎么创建类 function / class

### 面向过程 和 面向对象

面向过程： 即代码指明每一步做什么。
面向对象：即将事物对象化， 抽象化。

#### 举个例子

把大象放进冰箱

#### JS 对象的创建

### 设计模式

工厂模式 、 发布订阅模式、 单例模式

### 创建一个对象有哪几种方法？

1. Object.create({})

```JS
let  a = Object.create({})

// 相当于 a.__proto__ = {};

// a.__proto__.__proto__ === Object.prototype;

```

2. var obj = {}
   实质是 abj = new Object();

```JS
const obj= {}
// -> 意味着，bar 的原型链，指向了 Object 的原型
// bar.__proto__ === Object.prototype;

相当于

Object.create(Object.prototype)

```

3. new Object();

### new 关键字

### new 关键字到底干了写什么？

1. new 创建了一个对象，这个对象，指向了构造函数的原型。
2. 该对象，实现了 这个构造函数的方法。
3. 根据一些特定情况，返回对象
   1. 如果 这个构造函数，没有返回值，或者返回一个基本类型，那么，最后返回，我创建的这个对象；
   2. 如果 有返回值，且是个对象，则返回这个对象

```js
function newFunc(Father) {
	var obj = Object.create(Father.prototype);
	// obj.Father("菜鸡");
	const result = Father.apply(obj, Array.prototype.slice.call(arguments, 1));
	return result && typeof result === "object" ? result : obj;
}

const p = newFunc(Person, "菜鸡");
```

### 继承

#### 原型继承

#### 构造函数的继承

#### 组合继承

#### 组合寄生式继承

#### 组合寄生继承 和 class 继承有什么区别？
