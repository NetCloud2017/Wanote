# Array 数组

Array.prototype.slice.call() 方法能够将一个具有 length 属性的对象转换为数组。比如我自己定义一个具有 length 属性的对象：

```javascript
var a = { 0: "bob", 1: "12", 2: "male", length: 3 };

console.log(Array.prototype.slice.call(a)); // ["bob","12","male"]
```
