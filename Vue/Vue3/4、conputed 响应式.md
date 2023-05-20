# computed

计算属性 computed 会基于其响应式依赖被缓存，并且在依赖的响应式数据发生变化时重新计算

1.整个事件有 obj.name 开始

2.触发 proxy 实例的 setter

3.执行 trigger，第一次触发依赖

4.注意，此时 effect 包含调度器属性，所以会触发调度器

5.调度器指向 ComputedRefImpl 的构造函数中传入的匿名函数

6.在匿名函数中会：再次触发依赖

7.即：两次触发依赖

8.最后执行：

```javascript
() => {
	return "胜名:" + obj.name;
};
```

得到值作为 computedobj 的值

**总结**

那么到这里我们基本上了解了 computed 的执行逻辑，里面涉及到了一些我们之前没有了解过的概念，比如调度器 scheduler，并且整体的 computed 的流程也相当复杂。

所以接下来我们去实现 computed 的时候，会分步骤一步一步执行。

06：总结：computed 计算属性

那么到这里我们已经完成了 computed 计算属性的构建。

接下来我们来总结一下计算属性实现的重点：

1.计算属性的实例，本质上是一个 ComputedRefImpl 的实例

2.ComputedRefImpl 中通过 dirty 变量来控制 run 的执行和'triggerRefValue'的触发

3.想要访问计算属性的值，必须通过.value，因为它内部和 ref 一样是通过 get value 来进行实现的

4.每次.value 时都会触发 trackRefValue 即：收集依赖

5.在依赖触发时，需要谨记，先触发 computed 的 effect，再触发非 computed 的 effect
