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

## reactive 方法执行流程：

1.触发 reactive 方法 2.创建 reactive 对象：return createReactiveObject

3.进入 new Proxy

    1.第一个参数 target：为传入的对象

    2.第二个参数 handler:TargetType.COLLECTION=2,targetType=1,所以
    handler为 baseHandlers

    3.那这个 baseHandlers是什么呢?

4.在 reactive 方法中可知，baseHandlers 是触发 createReactiveObject 传递的第三个参数：mutableHandlers

5.而 mutableHandlers 则是 package/reactivity/src/baseHandlers.ts 中导出的对象

6.所以我们到 packages/reactivity/src/baseHandlers.ts 中,为它的 get (createGetter) 和 set(createSetter) 分别打入一个断点

7.我们知道 get 和 set 会在取值和赋值时触发，所以此时这两个断点不会执行

8.最后 reactive 方法内执行了 proxyMap.set(target,proxy)方法

9.最后返回了代理对象。

10.那么至此 reactive 方法执行完成。

由以上执行逻辑可知，对于 reactive 方法而言，其实做的事情非常简单：

    1.创建了 proxy

    2.把 proxy 加到了 proxyMap 里面

    3.最后返回了 proxy

## effect 方法执行流程：

1.在 packages/reactivity/src/effect.ts 第 170 行可以找到 effect 方法，在这里给一个断点

2.执行 new ReactiveEffect(fn)，其中的 fn 就是我们传入的匿名函数：

    1.这里涉及到了一个类ReactiveEffect

    2.查看该类可知，内部实现了两个方法：

        1. run
        2. stop

    3.我们分别为这两个方法增加断点

3.代码继续进行

4.可以发现执行了 run 方法，进入方法内部：

    1.执行 activeEffect=this，赋值完成之后，activeEffect 为传入的匿名函数 fn
    2.然后执行 return this.fn(）触发fn函数
    3.我们知道fn函数其实就是传入的匿名函数，所以document.querySelector('#app').innerText = obj.name

5.但是大家不要忘记，obj 是一个 proxy，obj.name 会触发 getter，所以接下来我们就会进入到 mutableHandlers 的 createGetter 中

    1.在该代码中，触发了该方法const res=Reflect.get(target,key,receiver)

    2.此时的res即为张三

    3. 注意：接下来触发了 track 函数， 该函数是一个重要的函数， track 在此为跟踪的意思， 我们来看它内部都做了什么：

        1.在4-1步中，为activeEffect 进行了赋值，我们知道 activeEffect代表的就是fn 函数

        2.执行代码可知，track内部主要做了两件事情：

            1.为 targetMap 进行赋值，targetMap 的组成比较复杂：

                1. key : target

                2. value : Map

                    1. key: key
                    2. value : Set

            2.最后执行了 trackEffects(dep,event Info)

                1.其中 eventInfo是一个对象，内部包含四个属性：其中 effect 即为 activeEffect 即 fn 函数

            3.在 trackEffects函数内部，核心也是做了两件事情：

                1.为 dep(targetMap[target][key]得到的Set 实例）添加了 activeEffect 函数

                2.为 activeEffect 函数的静态属性 deps，增加了一个值dep

                3.即：建立起了dep 和activeEffect 的联系

            4.那么至此，整个track的核心辑执行完成

            5.我们可以把整个track 的核心逻辑说成：收集了 activeEffect（即：fn)

        6.最后在 createGetter 函数中返回了 res（即：张三）

        7.至此，整个effect 执行完成

由以上逻辑可知，整个 effect 主要做了 3 件事情：

    1.生成ReactiveEffect实例

    2.触发fn 方法，从而激活getter

    3.建立了 targetMap和 activeEffect 之间的联系

        1.dep.add(activeEffect)

        2. activeEffect.deps.push(dep)

**总结**

那么到这里，我们就整个的跟踪了 packages/vue/examples/imooc/reactive.html 实例中：

    1.reactive 函数
    2.effect函数
    3.obj.name = xx表达式

这三块代码背后，vue 究竟都做了什么。虽然整个的过程比较复杂，但是如果我们简单来去看，其实内部的完成还是比较简单的：

    1.创建 proxy
    2.收集effect 的依赖
    3.触发收集的依赖

那么接下来我们自己的实现，将会围绕着这三个核心的理念进行。
