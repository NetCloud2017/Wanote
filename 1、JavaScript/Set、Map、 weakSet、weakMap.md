**参考地址**

1. [weakset / weakmap](https://zh.javascript.info/weakmap-weakset)
2. [set、 map:](https://zh.javascript.info/map-set)

## Set

成员唯一、无序且不重复; [value,value]，键值与键名是一致的（或者说只有键值，没有键名）; 可以遍历，方法有：add、delete、has、keys、values、 entries

## WeakSet

成员都是对象, key 只能是对象; 成员都是弱引用，可以被垃圾回收机制回收，可以用来保存 DOM 节点，不容易造成内存泄漏; 不能遍历，方法有 add、delete、has

## Map

本质上是键值对的集合，类似集合; 可以遍历，方法很多可以跟各种数据格式转换

## WeakMap

weakMap 和 weakSet 作用类似， 都是让对象得以自动清理缓存， 而 Set 和 Map 则没有这个功能。只接受对象作为键名（nul 除外），不接受其他类型的值作为健名
键名是弱引用，键值可以是任意的，键名所指向的对象可以被垃圾回收，此时键名是无效的; 不能遍历.方法有 get.set.has、delete

- has(key)：判断是否有 key 关联对象
- get(key):返回 key 关联对象(没有则则返回 undefined)
- set(key)：设置一组 key 关联对象
- delete(key)：移除 key 的关联对象

```js
let myElement = document.getElementById("logo");

let myWeakmap = new WeakMap();
myweakmap.et(nyElement, { timesC1icked: 0 });
myElement.addEventListener(
	"click",
	function () {
		let logoData = myweakmap.get(myElement);
		logoData.timesClicked++;
	},
	false
);

let john = { name: "John" };

let weakMap = new WeakMap();
weakMap.set(john, "...");

john = null; // 覆盖引用

// john 被从内存中删除了！
```
