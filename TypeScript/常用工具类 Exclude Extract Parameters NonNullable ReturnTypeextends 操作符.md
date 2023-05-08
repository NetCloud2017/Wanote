```js
type Exclude<T, U> = T extends U ? never : T;
type Extract<T, U> = T extends U ? T : never;
type NonNullable<T> = T extends null | undefined ? never : T;

type Parameters<T extends (...args:any) => any> =
T extends (...args: infer P) => any ? P : never;

type ReturnType<T extends (...args: any) => any> =
T extends (...args: any) => infer R ? R : any;
```

### 条件类型

T extends U ? x : y  
当类型 T 可以赋值给 类型 U， 则返回 x， 否则返回 y。

```js
type IsString<T> = T extends string ? true : false;

type I0 = IsString<number>;// false
type I1 = IsString<"abc">;// true
type I2 = IsString<any>; // boolean
type I3 = IsString<never>; // never
```

使用条件链实现多个条件的判断

```js
type TypeName<T> =
T extends string ? "string" :
T extends number ? "number":
T extends boolean ? "boolean" :
T extends undefined ? "undefined":
T extends Function ? "function":
"object";


type T10 = TypeName<string | (() => void)>;
// "string" | "function"
type T11 = TypeName<string | string[] | undefined>;
// "string" | "object"|"undefined"
```

上面为啥返回的是联合类型呢？ 因为 TypeName 是分布式条件类型（没有别 数组 T[]， 元组([T])， Promise<T>包裹的都是)， 当传入的是联合类型时， 会被分解成多个分支。 所以最后返回的也是联合类型。

![](img/a.png)

```js
type Naked<T> = T extends boolean ?"Y":"N";
type T0 = Naked<number | boolean>; //"Y"|"N"

type WrappedTuple<T>= [T] extends [boolean] ?"Y":"N";
type WrappedArray<T>=T[] extends boolean [] ? "Y":"N";
type WrappedPromise<T> =
Promise<T> extends Promise<boolean> ? "Y" : "N";

type T1 = WrappedTuple<number | boolean>; // "N"
type T2 = WrappedArray<number | boolean>; // "N"
type T3 = WrappedPromise<number | boolean>; // "N"
```

利用条件类型提取对象属性

```js

type NonFunctionPropertyNames<T> = {
    [K in keyof T]: T[K] extends Function ? never : K;
}[keyof T];

type NonFunctionProperties<T> = Pick<T, NonFunctionPropertyNames<T>>;

interface User {
    id: number;
    name: string;
    age: number;
    updateName(newName: string): void;
}

type T7 = NonFunctionPropertyNames<User>;
//  "id" | "name" | "age"
type T8 = NonFunctionProperties<User>;
//  {id: number; name: string; age: number }
```

## Record

```ts
type Record<K extends keyof any, T> = {
	[P in K]: T;
};
```

```ts
type Ingredient = "chocolate" | "peanuts" | "cocoa" | "marshmallow" | "cherry";

export const ingredients: Record<Ingredient, string> = {
	chocolate: "Chocolate",
	cocoa: "Cocoa Powder",
	cherry: "Cherry",
	marshmallow: "Marshmallow",
	peanuts: "Peanut Butter",
};
```
