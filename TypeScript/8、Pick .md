# 高级类型 Pick

1 首先实现 Pick 快速抓取属性, Pick 主要用于提取某种数据类型的属性，但实际工作中，主要用来提取接口或 type 定义的对象类型中的属性

```ts
/**
 * 理解 Pick,  而 keyof用来获取接口的属性名【key】组成的联合类型,
 * K如果属于keyof T联合类型或者它的子类型,  那么K extends keyof T就成立
 */
type Pick<T, K extends keyof T> = {
	//in是类型映射，=for...in 循环选代所有的K的类型
	[P in K]: T[P];
	/**
	 * 将由 T 的 key 组成的联合类型，遍历赋值给 P ，也给其赋上对应类型的值 T[P]
	 */
};
```

```ts
// 例子
// 1. 实现 Pick 快速抓取属性
type Pick<T, K extends keyof T> = {
	[P in K]: T[P];
};

interface Book {
	ISBN: string;
	book_name: string;
	book_price: number; //
	book_store_count: string; //库存数量
	book_publish: string; // 出版社
}
//type tp = Book["ISBN"]//string
// 只想要 这几个 key 值的对象类型，"ISBN" "book_name"  "book_price"
type Picktype = Pick<Book, "ISBN" | "book_name" | "book_price">;
let pickobj: Picktype = {
	ISBN: "101-101",
	book_name: "解放大西南",
	book_price: 23.4,
};
type Picktype2 = Pick<Book, "ISBN" | "book_name">;
let pickobj2: Picktype2 = {
	ISBN: "101-101",
	book_name: "解放大西南",
};
```

2 Pick+ Record 结合应用【真实应用场景】
