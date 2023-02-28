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
