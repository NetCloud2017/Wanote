### Pick 工具类型

```js
function Pick(obj, keys) {
	// 用于获取对象 中对应的属性 组成一个新的对象。
	const ret = {};
	for (const key of keys) {
		ret[key] = obj[key];
	}
	return ret;
}
```

MyPick

```js
//  Pick  的工作原理也是这个。
type MyPick<T,K extends keyof T> ={
    [P in K]:T[P];
}；
type User = {
    id: number;
    name: string;
    address: string;
}
type PickedUser = MyPick<User,"id"|"name">;

```
