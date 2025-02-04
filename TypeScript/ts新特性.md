## const 为何也能被修改？如何解决

```ts
//const arr=[10,30,40,"abc"]
//arr=[100,30,40,"abc"]
//arr[0]=100
const arr = [10, 30, 40, "abc"] as const; // 完全固定， 里面的值也不能修改。
//arr = [100, 30, 40, "abc"]
//arr[e]=100；//错误无法分配到“数组的索引为e位置的元素”，因为它是只读属性
应用;
function showArr(arr: readonly any[]) {
	//类型“readonly any[]”中的索引签名仅允许
	//arr[0] = 100;
	console.log(arr);
}
showArr(arr);
```

## 为什么要用可变元组+具体使用

```ts
//元组 POI

let [username, age]: [string, number] = ["wangwu", '海口海淀岛四东路3号'，'133123333'，'一路同行，一起飞']
// 报错 不能将  [string, number,string,string,string] 赋值给  [string, number]

// 可变元组
let [username, age, ...rest]: [string, number, ...any[]] =  ["wangwu", '海口海淀岛四东路3号'，'133123333'，'一路同行，一起飞']

console.log("username:", username)//wangwu
console.log("age:", age)//23
console.log（"rest："，rest）//[‘海口海淀岛四东路3号'，'133123333'，'一路同行，一起飞']

// 元组标签
// 作用就是让对应的数据语义化强些， 让开发者知道那个数据类型赋值给那个的。
let [username, age, ...rest]:[name_: string, age_: number, ...rest:any[]]=  ["wangwu", '海口海淀岛四东路3号'，'133123333'，'一路同行，一起飞']


```

## 深入可变元组

想确定一个中间变两边不变的数据

```ts
let [username, age, ...rest]:[name_: string, age_: number, ...rest:any[], _discro: string ]=  ["wangwu", '海口海淀岛四东路3号'，'133123333'，'一路同行，一起飞'];

// 确定 username age, 和最后一个值的数据类型
// 最后一个值 不能这样取 [username, age, ...rest, disc] 会报错， 所以取值难些。
// name_ , age_ 等等这些都是可变元组的标签，

//打通 数组类型和 可变元组
let  arr = [ 123, '123', 312 , 321]
let  [x, ...y]:[number, ...any[]] = arr; // 报错
// 因为 arr 这个数组 的类型 是 (number|string)[]， 所以不能赋值给 [number ,...any[]] 这个元组类型
// 解决
let [x, ...y]:[...any[]] = arr;

// 但是固定的元组可以这样写
let constnum3 = [10, 30, 40, 60, "abc"] as const
// 把元组退化成“数组”
let[×3,.…y3]：readonly [any,.…any[]]=constnum3

 // readeronly 和 as const 都是表示固定不变的， 包括数组和元组中每一个元素都是不变的。
```
