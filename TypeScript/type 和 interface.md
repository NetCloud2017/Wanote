### type 类型别名

可以命名基本类型和联合类型，等非对象类型

```js
type MyNumber = number;
type StringOrNumber = string | number;
type Text = string | string[];
type Point = [number, number];
type Callback = (data: string) => void;
```

在 TS 1.6 之后 开始支持类型别名支持 泛型。

```js
type Lazy<T> = T | (() => T);
```

常用用 type 定义的工具类有

```js
type Partial<T> = {
    [P in keyof T]?: T[P]
}

type Required<T> = {
    [P in  keyof T] -?: T[P]
}

type Pick<T, K extends keyof T> = {
    [P in K]: T[P]
}

type Record<K extends keyof any, T> = {
    [P in K]: T;
}

type Exclude<T, U> = T extends U? never : T
```

### interface 只能用于定义对象类型

如 Vue,
使用场景
(1) 一些第三方包或者框架底层源码中有大量的接口类型
(2)提供方法的对象类型的参数时使用
(3) 为多个同类别的类提供统一的方法和属性声明

```js
export interface App<HostElement = any> {
    version: string;
    config: AppConfig;
    use(plugin: Plugin, …options: any[]): this;
    mixin(mixin: ComponentOptions): this;
    component(name: string): Component | undefined;
    component(name: string, component: Component): this;
    directive(name: string): Directive | undefined;
    directive(name: string, directive: Directive): this;
}
```

### 相同点

- 类型别名和接口都可以用来描述对象或函数

```js
type Point ={
    x: number;
    y:number;
}；
type SetPoint = (x: number, y: number)=> void;

interface Point {
    x: number;
    y:number;
}
interface SetPoint {
    (x: number, y: number): void;
}
```

- 类型别名和 接口都支持扩展

```js
type Animal ={
    name: string;
}；

interface Bear extends Animal {
    //  通过 extends 来扩展类型别名定义的类型
    honey: boolean
}
------------------------
interface Animal {
    name: string;
}

type Bear = Animal & {
    //  通过  & 来扩展已定义的接口类型
    honey: boolean;
}；

// 接口函数
type TestTyp = (...args: any) => string
// 相当于如下：
interface Test {
    (...args: any):string
}


```

### 不同点

- 类型别名可以为基本类型、联合类型或元组类型定义别名，而接口不行。接口只支持定义对象类型。接口可合并声明定义两个相同名称的接口会合并声明，定义两个同名的 type 会出现编译错误。

```ts
type MyNumber = number;
type StringOrNumber = string | number;
type Point = [number, number];
```

- 同名接口会自动合并， 而类型别名不会。

```TS
interface User {
    name: string;
}
interface User {
    id: number;
}

let user: User = {
    id: 666,
    name: "666",
};
//  类型别名重复报错
```

```TS
//接口继承类
// 区别2:接口可以 extends 一个或者多个接口或类实现一个或者多个接口，也可以继承type，但 type类型没有继承功能,
// 但一般接口继承类和 type的应用场景很少见，同学们记住有这样的语法即可。

//1.接口可以继承类，当接口继承了类之后，会继承成员(类型)，但是不包括实现
//2.接口还会继承private和protected修饰的成员，但是这个接口只可被这个类或它的子类实现
class Person {
    private name: string；
}
interface I extends Person {}

//类与类，接口与接口之间使用extends
// 类与接口 implements;

class C extends Person implements I {
// private name: string; //  报错
// constructor(arg: string, public namel: string) {
    // this.name = 'arg'
// }
    getName() {
        return this.namel + 'new Class C'
    }
}
const instance = new C()

```

- 用 type 交叉类型&可让类型中的成员合并成一个新的 type 类型，但接口不能交叉合并

类型别名和接口的一些使用场景

使用类型别名的场景：

- 定义基本类型的别名时，使用 type
- 定义元组类型时，使用 type
- 定义函数类型时，使用 type
- 定义联合类型时，使用 type
- 定义映射类型时，使用 type

使用接口的场景：

- 需要利用接口自动合并特性的时候，使用 interface
- 定义对象类型且无需使用 type 的时候，使用 interface
