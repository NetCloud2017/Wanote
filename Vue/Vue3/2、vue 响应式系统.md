# 响应式系统

## 响应系统

我们通常把：会影响视图变化的数据称为响应数据，当响应式数据发生变化时，视图理应发生变化。

1.那么 Vue 中这样的响应性数据是如何进行实现的呢?

2.Vue2 和 vue3 之间响应性的设计有什么变化吗？为什么会产生这种变化呢？

**js 的程序性**
想要了解响应性，那么首先我们先了解什么叫做：JS 的程序性
我们来看下面这段代码：

```javascript
//定义一个商品对象，包含价格和数量
let product = {
	price: 10,
	quantity: 2,
};
//总价格
let total = product.price * product.quantity;
//第一次打印
console.log(`总价格：${total}`);
//修改了商品的数量
product.quantity = 5;
//第二次打印
console.Log(`总价格：${total}`);
```

但是 js 本身具备程序性，所谓程序性指的就是：一套固定的，不会发生变化的执行流程，在这样的一个程序性之下，我们是不可能拿到想要的 50 的。

vue 2 的 缺陷： 不能监听 对象和数组的变化。

在上面的例子中，我们呈现了 vue2 中响应性的限制：

1.当为对象新增一个没有在 data 中声明的属性时，新增的属性不是响应性的

2.当为数组通过下标的形式新增一个元素时，新增的元素不是响应性的

那么为什么会这样呢？

1.vue 2 是以 Object.defineProperty 作为核心 API 实现的响应性

2.Object.defineProperty 只可以监听指定对象的指定属性的 getter 和 setter

3.被监听了 getter 和 setter 的属性，就被叫做该属性具备了晌应性

那么这就意味着：我们必须要知道指定对象中存在该属性，才可以为该属性指定响应性。

但是由于 JavaScript 的限制，我们没有办法监听到指定对象新增了一个属性，所以新增的属性就没有办法通过 Object.defineProperty 来监听 getter 和 setter，所以新增的属性将失去响应性

在以上代码中，我们可以发现，Proxy 和 object.defineProperty 存在一个非常大的区别，那就是：

1.Proxy 将代理一个对象（被代理对象），得到一个新的对象（代理对象），同时拥有被代理对象中所有的属性。

2.当想要修改对象的指定属性时，我们应该使用代理对象进行修改

3.代理对象的任何一个属性都可以触发 handler 的 getter 和 setter

2. Object.defineProperty :

1.Object.defineProperty 为指定对象的指定属性设置属性描述符

2.当想要修改对象的指定属性时，可以使用原对象进行修改 3.通过属性描述符，只有被监听的指定属性，才可以触发 getter 和 setter 所以当 vue3 通过 Proxy 实现响应性核心 API 之后，vue 将不会再存在新增属性时失去响应性的问题。
