**any: 我不在乎它的类型； unknown 我不知道它的类型**

any 类型和 unknown 类型 都是 top type （顶级类型）；

any 类型可以进行任何操作在编译阶段不进行检测和报错， 但是在运行时才会报错。 而 unknown 类型 则是为了解决 any 类型的这一问题而设计的。unknown 类型只能赋值给 unknown 类型和 any 类型。

unknown 只能作为其他类型的父类型， 而不能作为它类型的子类型。
unknown 类型只能由 any 和 unknown 赋值，其他类型不能赋值给 unknown。

```js
let value: unknown;

value.toString(); // error
```

```TS
symbol
type T40 = keyof any; // string | number | symbol
type T41 = keyof unknown;// never

type T50<T> = { [P in keyof T]: number };
type T51 = T50<any>; // { [x: string]: number }
type T52 = T50<unknown>; // {}
```

### 与 unknown 类型的交叉运算

```ts
type T00 = unknown & null; // null
type T01 = unknown & undefined; // undefined
type T02 = unknown & null & undefined; // never
type T03 = unknown & string; // string
type T04 = unknown & string[]; // string[]
type T05 = unknown & unknown; // unknown
type T06 = unknown & any; // any

type T10 = unknown | null; // unknown
type T11 = unknown | undefined; // unknown
type T12 = unknown | null | undefined; // unknown;
type T13 = unknown | string; // unknown
type T14 = unknown | string[]; // unknown
type T15 = unknown | unknown; // unknown
type T16 = unknown | any; // any
```
