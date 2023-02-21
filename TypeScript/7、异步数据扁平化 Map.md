# 高级 type 类型 数据扁平化

1.复习+理解泛型 K extends keyof 泛型 T

2.理解 K extends keyof any

> keyof any 就是相当于 string | number| symbol 这个联合类型, 这是 TS 官方规定的。

```ts
type Worker = {
	custname: string;
};
type Customer = {
	custname: string;
	age: number;
};
// 自定义 条件类型
type oneType<K> = K extends keyof any ? K : never;
1;
//type oneAnyType = keyof any// = type oneAnyType=string | number | symbol

//type oneResultType = oneType<Worker>//never
let count: number = 3;
type twoResultType = oneType<number>; // number
let strName: string = "abc";
type threeResultType = oneType<typeof strName>; // string

type fourResultType = oneType<3>;
2; // 3被当成值类型 是一个类型 返回3也是一个值类型
let stuSymid: symbol = Symbol["stuid"];
type symType = typeof stuSymid; //symbol
type fiveResultType = oneType<symbol>;
3; //symbol
```

3.理解 K in T
Record<K, P> ： 将 K 这个联合类型的每个值作为 key ，每个 key 的值是 T

```ts
type Obj = {
	name: string;
	age: number;
};
type RecordValue = {
	id: string;
	disc: string;
};
type newType = Record<keyof Obj, RecordValue>;
// newType = {
//     name:  RecordValue,
//     age: RecordValue
// }
// 另一种写法是
type Record<K, T> = {
	[P in K]: T;
};
```

```ts
type Worker = {
	custname: string;
};
type Customer = {
	custname: string;
	age: number;
	phone: string;
};

type Record<K extends keyof any, T> = {
	[P in "username" | "age"]: T;
	// in 会遍历  "username" | "age" 这个联合类型的值作为 对象的 key , 并将 T 赋值给 对应的 key
};

// type resultRecord = {
//   username: Customer;
//   age: Customer;
// }

type resultRecord = Record<string, Customer>;
//let cust: Customer = { custname: "wangwu", age: 23, phone: "111" }

//  [P in string]可以代表任意一个字符串的可索引类型
type Record<K extends keyof any, T> = {
	[P in string]: T; // 生成 {[x:string]: T}
};
type resultRecord = Record<string, Customer>;
let obj: resultRecord = {
	// key 可以是任意字符串
	usernamed: { custname: "wangwu", age: 23, phone: "111" },
	agde: { custname: "lisi", age: 33, phone: "23" },
};

type resultRecord2 = Record<number, Customer>;
/**
 * resultRecord2 = {
 *  [x: number]: Customer
 * }
 */

// 使用 Record 实现数据扁平化

const goodSymid = Symbol("goodid");
interface Goods {
	[goodSymid]: number;
	name: string;
	price: number;
}
// 模拟后台取出来的商品数据列表
const goodsList: Goods[] = [
	{
		[goodSymid]: 101,
		name: "苹果",
		price: 9,
	},
	{
		[goodSymid]: 102,
		name: "香蕉",
		price: 3,
	},
	{
		[goodSymid]: 103,
		name: "橘子",
		price: 3,
	},
];
// 实现数据扁平化
// Record类型
// 方式 1
type Record<K extends keyof any, T> = {
	[P in K]: T;
};
type resultGoodsType = Record<number, Goods>;
let goodRecord: Record<number, Goods> = {};
// let goodRecord: Record<string, Goods> = {}; // key 可以是string 类型。
goodsList.forEach((goods) => {
	goodRecord[goods[goodSymid]] = goods;
});
// //goodRecord: {
//   '101': { name: '苹果', price: 9, [Symbol(goodid)]: 101 },
//   '102': { name: '香蕉', price: 3, [Symbol(goodid)]: 102 },
//   '103': { name: '橘子', price: 3, [Symbol(goodid)]: 103 }
// }
// 这样可以直接通过 id 获取对应的 good
```

4.理解 K in keyof T

```ts
// 方式2
type Record<T> = {
	[P in keyof any]: T;
};
// 会转变成这种类型 ，因为 number 作为对象的 key 时 会被转化成 string 类型。
/**
 * {
 *	 [x:string] : T
 * }
 */
```

方式 1 和方式 2 的区别是, 方式 1 key 只能是数字， 而方式而，可以是 字符串，也可以是数字 5.深入 Record 完成异步数据扁平化【实现方式 1】

6.深入 Record 完成异步数据扁平化【实现方式 2】

7.object 和 Map 和 Record 区别

> Record 和 object 区别

区别 1：Record 获取到是索引参数类型，所以可以赋初值为{} , 而 object 也可以，但是再次赋值，比如： goodRecord[103] = good2; 会出现错误，会查找 103 属性是否存在于 object 类型的对象变量中

区别 2： Record 是泛型，获取值可以有自动提示功能，而 object 无法实现自动提示。

> Map 和 Record 的区别

实际开发为什么我们在显示数据，数据扁平化时用 Record?

原因 1：是因为 Record 有多种实现方式，比如 S100 实现方式，Map 就需要改底层源码才能做到【一般是不会改的】

```ts
type Record<T> = {
	// 可以时一个参数， 也可以有 两个参数
	[P in keyof any]: T;
};
let goods = new Map<string, Goods>();
```

原因 2：Record 是属于一个轻量级的 type 类型,Map 相对 Record 是重量级, 而且 Map 需要 new 出来的，所以要更加占用内存空间如果读取数据和显示数据频繁，就应该采用 Record 如果增删改比较多，那还是使用 Map。
