# Symbol

Symbol 用于创建唯一标识符的数据类型。即使创建了相同的 Symbol 值也是不想等的。

```ts
let symId = Symbol("id"); // 这个 id 只是一个描述符， 并不是 symbol真正的值。
let symId2 = Symbol("id");
console.log(symId === symId2); // false
```

Symbol 的值是无法被转换成 字符串的

```ts
let id = Symbol("id");
alert(id); // 类型错误：无法将 symbol 值转换为字符串。

// 但是我们可以通过调用toString 方法将其转换成字符串
id.toString(); // Symbol(id)

// 或是只获取描述符
id.description; // 'id'
```

## Symbol 的使用

**1. 隐藏属性**

```ts
let id = Symbol("id");

let user = {
	name: "John",
	[id]: 123, // 而不是 "id"：123
};
console.log(user[id]); // 访问不了

for (let key in user) alert(key); // name （没有 symbol）

Object.keys(user); // ['name'] 也没有

// 但是 Object.assign 会将 symbol 属性也复制到另一个对象上。
let clone = Object.assign({}, user);

alert(clone[id]); // 123
```

**全局 symbol**

```ts
let localId = Symbol("id"); // 非全局 symbol
// 从全局注册表中读取
let id = Symbol.for("id"); // 如果该 symbol 不存在，则创建它

// 再次读取（可能是在代码中的另一个位置）
let idAgain = Symbol.for("id");

// 相同的 symbol
alert(id === idAgain); // true

// 获取全局symbol的key

let idStr = Symbol.keyFor(localId); // undefined   Symbol.for 是无法获取 非全局的 symbol的。
alert(Symbol.keyFor(id)); // 'id'
```

**2. 改变系统内建行为**
JavaScript 使用了许多系统 symbol，这些 symbol 可以作为 Symbol.\* 访问。我们可以使用它们来改变一些内建行为。例如，在本教程的后面部分，我们将使用 Symbol.iterator 来进行 迭代 操作，使用 Symbol.toPrimitive 来设置 对象原始值的转换 等等。
