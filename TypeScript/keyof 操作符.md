### keyof 操作符

用户获取类型中的所有键，返回来的类型是联合类型。

```js
type User = {
    id: number;
    name: string;
}
type UserKeys = keyof User
//  "id" | "name"


// 使用例子
function getProperty<T extends object, K extends keyof T>(obj: T, key: K) {
    return obj [key];
}；

const userId = getProperty(user,"id");
const userName = getProperty(user, "name");
const userAge = getProperty(user, "age"); // Error

```

<span style="background: rgba(243, 122, 233, 0.6); color: #00f">
keyof 不仅可以用于对象类型， 也可以用于 基本类型、类、 枚举类型 映射类型中。
</span>

```js
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
