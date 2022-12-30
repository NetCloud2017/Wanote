### Omit 工具类型

```js
type Omit<T, K extends keyof any> = Pick<T, Exclude<keyof T,K>>;

type Pick<T, K extends keyof T> = {
    [P in K]: T[P]
}
```

过滤对象类型不需要的属性

```js
type User ={
    id:string;//用户id
    name:string;//用户名
    password:string;//密码
    createdAt:Date;//创建时间
    updatedAt：Date;//更新时间
};
Omit<User,"id"|"createdAt"|"updatedAt">

// {
//     name:string;//用户名
//     password:string;//密码
// }

也可以用 接口的方式覆盖原有对象类型的已有属性的类型。

interface UserUI extends Omit<User, "createdAt" | "updatedAt"> {
    createAt: string;
    updatedAt: string;
}
```
