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

3.理解 K in keyof T

4.理解 K in T

5.深入 Record 完成异步数据扁平化【实现方式 1】

6.深入 Record 完成异步数据扁平化【实现方式 2】

7.object 和 Map 和 Record 区别
