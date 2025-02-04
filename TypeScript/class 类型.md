- ES 6 的类和 TS 的类有什么不同？

  1. 属性赋值方式不同， TS 的类无需使用 this 赋值。
  2. ES6 类没有访问修饰符，TS 类自带访问修饰符(private, public, protected)
  3. TS 类是静态类型语言的类，而 ES6 类按照 JavaScript 的一个语法标准设计而成

- new 一个 TS 的方法可以吗?能在 TS 类外部使用 prototype 为 TS 类增加方法或属性吗？

虽然在 JS 中可以 new 一个函数，但 TS 已经屏蔽了去 new 一个函数【JS 可以，会当成一个构造函数】，TS 类可以访问 prototype 原型对象属性，但无法在 prototype 原型对象属性增加新的方法或属性，这么做，就是让我们只能在类的内部定义方法，防止回到 ES5 从前非面向类和对象的而写法。【但是可以覆盖类上已经存在的方法】

## 单例模式

```ts
// 立即创建方式: 一开始就创建了， 不用时, 浪费内存。
class Util {
  static _this: new Util();
  private constructor(parameters) {
    console.log('create instance');
  }
  log () {
    console.log(this);
  }
}

```

```ts
class Util {
	static _this: Util;
	isRun!: Boolean; // 这里的叹号作用是忽略初始值；
	static getInstance() {
		if (!this._this) {
			// 用到时才创建
			this._this = new Util();
		}
		return this._this;
	}
	private constructor(parameters) {
		console.log("create instance");
	}
	log() {
		console.log(this);
	}
}
```

## 方法拦截器

```ts
class People {
	name: string;
	age: number;
	addr: string;
	static count: number = 10;
	constructor(_name: string, age: number, _addr: string) {
		this.name = _name;
		this.age = age;
		this.addr = _addr;
	}

	doEat(who: string, where: string) {
		// 如何在这里做操作呢 start？
		console.log(`who: ${who}; where:${where}`);
		// 如何在这里做操作呢 end？
	}
	doStep() {}
}

class StringUtil {
	static trimSpace(str: string) {
		return str.replace(/s+/g, "");
	}
}
//注意： getOwnPropertyDescriptor 这个方法每次调用都会给 'doEat' 这个方法属性开辟新的属性空间

const dataProp = Object.getOwnPropertyDescriptor(People.prototype, "doEat");
const targetMethod = dataProp!.value;
dataProp!.value = function (...args: any[]) {
	args = args.map((arg) => {
		if (typeof arg === "string") {
			return StringUtil.trimSpace(arg);
		}
		return arg;
	});
	console.log("前置拦截...");
	targetMethod.apply(this, args);
	console.log("后置拦截...");
};
//dataProp1?.value("王明"，"王府井") // 我们一般不会这样直接调用

// 这样用 , 根据某一个类的对象来调用 如下:
Object.defineProperty(People.prototype, "doEat", dataProp!);
let p = new People("peter", 23, "公主坟");
p.doEat("张三", "王家路");
```
