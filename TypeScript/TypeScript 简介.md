# TypeScript

优势：

优势 1：编译时静态类型检测：函数或方法传参或变量赋值不匹配时，会出现编译错误提示，规避了开发期间的大量低级错误，省时，省力。

优势 2：能自动提示：变量类型、变量属性，不用来回切换文件或不小心写错导致的编码隐患。

优势 3：引入了泛型：让大中项目，前端框架底层源码具备了高可扩展性这个巨大的优势，同时也有类型安全检查的优势。

优势 4：强大的 d.ts 声明文件：声明文件像一个书的目录一样，清晰直观展示了依赖库文件的接口，type 类型，类，函数，变量等声明。

优势 5：轻松编译成 JS 文件：即使 TS 文件有错误，绝大多数情况也能编译出 JS 文件。

优势 6：灵活性高：尽管 TS 是一门强类型检查语言，但也提供了 any 类型和 as any 断言，这提供了 TS 的灵活度。

## 类型注解

```ts
let price: number = 23; // ： 后面的就是类型注解
type StudentType = { name: string; age: number };
let stuobj: StudentType = { name: "wangwu", age: 23 };
```

## 类型推导

```ts
//类型推导
let count = 3; // 将 count 的类型推断为 number 类型
let custobj = { name: "wangwu", age: 23 };
// 将 custObj的类型推断为
/**
 * {
 * name： stirng,
 * age: number
 * }
 */
```

## any 和 unknown

## 函数和函数类型 ， rest 参数

```ts
type Func = (str: string, count: munber) => void;
let func: function;
interface Func1 {
	(num1: number, num2: numver): number;
}
```

## 函数类型升级

## string & String 或 object & Object

这两个都是前者是后者的一个类型表现他没有任何属性和方法。

```ts
// 例如
string. // 没有任何属性和方法展示
// 但是
let  str: string = 'abc'
str. // 这个就会展示属性和方法。
let str1: String = 'abc'
str1. // 这个也有许多属性和方法。
// object & Object 雷同。
```

## Bigint

Bigint 是 ES2020 之后出的, 因此 target 配置 和 lib 配置里都要写上 ES2020

```json
// tsconfig.json
{
	"target": "es2020",
	"lib": ["DOM", "ES2020"]
}
```

## 看似简单的取值为何报错

```ts
let obj = { username: "wangwu", age: 23 };
let username = "username";
// const username = "username"; // 正常
obj[username]; // 报错
/**原因
 *  obb[username] 会在编译期间想 username 这个变量的类型中获取 username
 * 这个属性， 但是 变量 username 的类型是string， string 根本没有这个属性，
 * 所以报错。
 */
let obj: object = { username: "wangwu", age: 23 };
const username = "username";
let result = obj[username]; // 报错
/**
 * 因为 username 常量的类型就是 'username' 这个字符串， 而 obj 的类型是
 * object, 从类型 object 中获取 没有的属性 username 肯定报错。道理同上。
 */
// let result = (obj as any)[username]; // 正确
```

## 什么场景 never 能被直接推导出来而不用定义？

```ts
type DataFlow = string | number;
function dataFlowAnalysisWithNever(dataFlow: DataFlow) {
	if (typeof dataFlow === "string") {
		console.log("字符串类型：", dataFlow.length);
	} else if (typeof dataFlow === "number") {
		console.log("数值类型：".dataFlow.toFixed(2));
	} else {
		// (parameter) dataFlow: never
		let data = dataFlow; // 这时  dataFlow 就是 never类型
	}
}
dataFlowAnalysisWithNever("免税店");
dataFlowAnalysisWithNever(3.199923);
```

## 为什么要用枚举？

在作订单流程的时候我们的商品会有很多状态例如 待发货， 运输中，待签收， 待付款 等等。 这么多状态我们为了代码变得容易维护和直观这时我们就要用 到枚举这种数据了。 我们不可能就用数字来表示这些状态吧。

枚举带来的好处：1.有默认值和可以自增值，节省编码时间; 2.语义更清晰，可读性增强，因为枚举是一种值类型的数据类型，方法参数可以明确参数类型为枚举类型

## 深入枚举，枚举分类，枚举底层，枚举好处【真实应用场景】

1.枚举的定义 2.枚举分类 3.枚举取值方式 4.枚举底层 5.枚举应用

## 元组

1.为什么用元组(tuple)

格式和顺序固定时就用 元组。

2.符合下面条件的数组就是一个元组

1. 定义时的元素的类型确定，但各个元素的类型不必相同
2. 为元素赋值时，该值必须是当前位置的类型

## 接口 interface

定义: 是为一系列同类对象或同类别的类提供属性定义和方法声明但没有任何赋值和实现的数据类型。

接口实现

```ts
interface Product {
	id: number;
	name?: string; // 可选属性
	price: number;
	count: number;
    [key:string]: any； // 索引属性， 即你可以加无限个属性， key 是任意组合的 string类型 value 是 any 类型；

    // 定义方法
    func: () => void
    [key: string]: (state: any) => void // 可索引非方法
}
function calToal(product: Product) {
	console.log("product总价：", product.price * product.count);
}
calToal({ id: 100, name: "电脑", price: 5000, count: 10 });


新的接口只是在原来接口继承之上增加了一些属性或方法，这时就用接口继承

// 例子1：
// 开始定义了一个接口
interface  Point{
    x:number;
    y:number;
}

// 需求发生了变化，但是是在原来 Point 接口的基础之上增加了一个新的 z:number 属性。
interface  Point3d extends Point{
    z:number;
}


// 例子2：Vue3源码中 稍复杂一点的接口继承
interface Error {
  name: string;
  message: string
}

interface CompilerError extends Error {
  code: number
}

const enum ErrorCodes {
  // parse errors
  ABRUPT_CLOSING_OF_EMPTY_COMMENT,
  CDATA_IN_HTML_CONTENT,
  DUPLICATE_ATTRIBUTE,
  END_TAG_WITH_ATTRIBUTES,
  END_TAG_WITH_TRAILING_SOLIDUS,
  EOF_BEFORE_TAG_NAME,
  EOF_IN_CDATA,
  EOF_IN_COMMENT,
  EOF_IN_SCRIPT_HTML_COMMENT_LIKE_TEXT,
  EOF_IN_TAG,
  INCORRECTLY_CLOSED_COMMENT
   ......
}

 interface CoreCompilerError extends CompilerError {
  code: ErrorCodes
}

//  其他应用比较少的场景:
//  1 接口也可以继承多个接口  2 接口可以继承类  3 类可以继承一个或多个接口
```

应用场景

1 提供方法的对象类型的参数时使用

2 为多个同类别的类提供统一的方法和属性声明【参见第 7 章泛型接囗】

## 联合 类型

```ts
// 基础数据的联合类型
type ID = number | string;
let id: ID = "";
// id. // 可以获取到数字和 string共有的方法。

//2.引用类型的联合类型
interface Car {
	brand: string; // 品牌
	No: number; //车牌号
	price: number;
	placeorigin: string; //产地
	load(): void;
}
interface Plane {
	category: string; //飞机类别
	price: number; //价格
	placeorigin: string; //产地
	airline: string; //所属航空公司
	load(): void;
}
function carry(vechile:Car | Plane) {
    vechile. // 可以获取到 Car 和 Plane 共有的方法和属性
}
```

## 使用 type 定义类型

type 和接口类似，都用来定义类型，但 type 和 interface 区别如下：

区别 1：定义类型范围不同

interface 只能定义对象类型或接口当名字的函数类型。

type 可以定义任何类型，包括基础类型、联合类型，交叉类型，元组。

```ts
//type定义基础类型
type num = number;
// type定义联合类型例子1：
type baseType = string | number | symbol;
// type 定义联合类型例子2：
interface Car {
	brandNo: string;
}
interface Plane {
	No: string;
	brandNo: string;
}
type TypVechile = Car | Plane;
// 元组
interface Car {
	brandNo: string;
}
interface Plane {
	No: string;
	brandNo: string;
}
type TypVechile = [Car, Plane];
```

区别 2：接口可以 extends 一个或者多个接口或类，也可以继承 type，但 type 类型没有继承功能，但一般接口继承类和 type 的应用场景很少见，同学们记住有这样的语法即可。

区别 3：用 type 交叉类型&可让类型中的成员合并

```ts
type Group = { groupName: string, memberNum: number }
type GroupInfoLog = { info: string, happen: string }
type GroupMemeber=Group & GroupInfoLog//type 交叉类型合并
let data: GroupMemeber = {
    groupName: "001",
    memberNum: 10,
    info："集体爬山",
    happen："中途有组员差点滑落，有惊无险",
}
```

## 一种用接口定义的特殊写法的类型

```ts
interface Func {
    (state： any, commit: any): void
}
let func: Func = (state, commit: any): void {

}
```

## 一个联合类型技巧性使用的场景

```ts
type IncreaseBoolean = Boolean | 1 | 0;
function mounted(isStartUp: IncreaseBoolean) {
	if (isstartUp) {
		console.log("yes");
	} else {
		console.log("no");
	}
}
mounted(1);
```

## 为什么要用声明文件？

如果文件使用 TS 编写，在编译时可以自动生成声明文件，并在发布的时候将.d.ts 文件一起发布，我们无需编写声明文件。

当我们在 TS 文件中引入使用第三方库的类型或使用集成库时，有可能需要编写声明文件, 比如：@types/jquery 库，ES6 库的 Map 类型，这些库用 JS 开发，不能获取 TS 一样的类型提示，需要一个声明文件来帮助库的使用者来获取库的类型提示。

注意：声明文件中只对类型定义，不能进行赋值和实现。

## 声明文件实现

1js 文件如何感知声明文件的作用

在方法上按 Ctrl + 点击的时候， 会跳到对应的 d.ts 文件。没有才会跳到对应的原码
2 学会定义和使用声明文件

声明文件只有声明， 没有实现。
文件在有导出的情况想才会有声明文件。

```ts
//关键字declare表示声明的意思，我们可以用它来做出各种声明：
declare let/const //声明全局变量
declare function //声明全局方法
declare class //声明全局类
declare enum //声明全局枚举类型
declare namespace //声明（含有子属性的）全局对象
interface/type //声明全局类型 这两种类型不需要加 declare 关键字。 因为它在编译成js 之后是没有的。他们只是作类型检查的。 因此凡是可以编译出内容的 都用 declare 声明。

```

声明文件的作用范围就是 rootDir 的范围。 declare 可以重复声明相同的 变量。

## 正确理解 declare

用于声明 全局类型

## 命名空间在声明文件中的使用

namespace 用于防止声明重名的， 把他当作一个对象看就可以了。底层就是一个对象。

```ts
// 对外暴露的 就时 JQuery
// 使用时 用 JQuery.$
declare namespace JQuery {
	type cssSelector = {
		css: (key: string, value: string) => cssSelector;
	};
	// declare function·$(ready:()=>·void):void // 里面不能再用 declare
	export function $(ready: () => void): void;
	export function $(selector: any): cssSelector;
	// 嵌套的命名空间
	// 使用时 JQuery.$.ajax()
	export namespace $ {
		function ajax(url: string, settings?: any): void;
		function get(url: string, settings?: any): void;
		function post(url: string, settings?: any): void;
	}
}
```

但是 命名空间还有一个小小的问题， 就是 使用时都需要提前获取命名空间 如 JQuery。 有没有不需要提前获取的, 直接就用 用上 $ 吗？ 用模块声明。

## 模块声明

## 如何在 TS 中引入 js 文件
