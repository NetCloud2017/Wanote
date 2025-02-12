### keyof 操作符

用户获取对象类型中的所有键，以联合类型的形式返回。

```ts
let obj = { address: "", phone: "1111" };
type values = 1 | 2; // type可以拿值来做类型。
type ObjType = typeof obj;
// type mykeys = keyof obj; // 报错, 不能之间用变量来直接获取属性名 key, 所以应该为:
type ObjKeys = keyof ObjType; // "address" | "phone"
// 或
// type ObjKeys = keyof typeof obj;
```

<span style=" color: #0af">
keyof 不仅可以用于对象类型， 也可以用于 基本类型、类、 枚举类型 映射类型中。
</span>

```ts
type K1 = keyof boolean; // "value0f"
type K2 = keyof number;
// "toString" | "toFixed" |"toExponential" |"toPrecision" | "valueOf" | "toLocaleString"
type K3 = keyof any; // string | number | symbol

class Person {
    id: number = 666;
    name:string="阿宝哥"；
}
type P = keyof Person;
// "id" |"name"

enum HttpMethod {
    Get,
    Post,
}
type Method = keyof typeof HttpMethod;
//  "Post"|"Get"
```
