1、body 参数为 any, 没有提前报错能力。

解决：

```ts
    // 类型继承
    interface RequestWithBody extends Request {
        body:{
            [key: strfng]: string | undefined;
        }；
    }

```

2、在中间件传递的数据中新增的属性，由于类型没有改变， 后面获取不到， 并报错。

```ts
// 模仿 express 声明文件作类型融合
// coustom.d.ts // 这个声明会和原有的express声明文件自动进行类型融合的， 之后后面的中间件就可以拿到这个属性了。
declare namespace Express {
	interface Request {
		teacherName: string;
	}
}
```
