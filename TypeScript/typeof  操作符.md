### typeof 操作符

**1、用于动态定义对象类型**

```js
const lolo ={
name: "lolo",
age: 7,
    address: {
        province:"福建",
        city："厦门"，
    }，
}；

type Person = typeof lolo;
type Address = typeof lolo["address"];

// 获取枚举类型的索引属性

enum HttpMethod {
    Get,
    Post,
}

const method: typeof HttpMethod = {
    Get: 0,
    Post: 1,
}

type Method = keyof typeof HttpMethod;
```

### typeof 获取函数类型

```TS
function add(a: number, b: number) {
 return a + b;
}

type AddType = typeof add; // (a: number,b: number)=> number
// type AddReturnType = ReturnType<AddType>; //利用 ReturnType 获取函数返回类型 number
type AddParamsType = Parameters<AddType>; // 获取函数参数类型 [a: number, b: number]
```

### typeof 对类的处理

```js
class Point {
x: number;
y: number;
constructor(x: number, y: number) {
    this.x=x;
    this.y=y;
}
// Constructor =  new (x:number,y:number)=> Point
function createPoint( Constructor: typeof Point, x: number,  y:number){
    return new Constructor(x, y);
}

```

### 利用 const 断言获取更精确的类型

```js
let requestMethod = "Get";
let requestMethod2 = "Get" as const;
type R0 = typeof requestMethod; // string
type R1 = typeof requestMethod2; // "Get"
```
