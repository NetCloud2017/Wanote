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
type Record<K extends keyof any, T> = {
	[P in K]: T;
};
type resultGoodsType = Record<number, Goods>;
let goodRecord: Record<number, Goods> = {};
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

5.深入 Record 完成异步数据扁平化【实现方式 1】

6.深入 Record 完成异步数据扁平化【实现方式 2】

7.object 和 Map 和 Record 区别
