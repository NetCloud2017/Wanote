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

如 Vue

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
```

### 不同点

- 类型别名可以为基本类型、联合类型或元组类型定义别名，而接口不行。

```js
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
