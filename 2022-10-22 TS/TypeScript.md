### 元组

### 非空判断

### 类型守卫

多态性
保证在语法规定的范围内， 额外进行确认。

in 属性场景下的类型确认。

typeof / instanceof 类型分类场景下的身份确认。

自定义类型。

### 装饰器

在 ts 中使用需要开启 "experimentalDecorators": true,

- 类修饰器

- 属性修饰器
- 方法修饰器

### Vue.use 的原码， 详解。

### injectionKey 的作用

### vuex-class 和 vue-class-component

# 函数式编程

## 函数式的概念

> 函数式编程，通过使用函数，来将值转换成抽象单元，接着用于构建软件系统。

《 JS 函数式编程 》

### 软件系统

- 展示数据 - 纸质化 - 信息化 - 展示数据。
  Table -- ORM -- class -- json -- http -- json -- state/data/reactive -- UI
  [123456/luyi/male/35]
  pipe compose function next --

### 函数式编程和传统编程思路上的区别是什么？

- 把一个数据，通过一些方法，或者一些方法的组合，一步一步变成另外一些数据。
- 函数式编程，更关心 -- 谓词 -- 。“我实现这个，需要哪些函数”

```js
arr = [1,2,4,6,7,2,0,2,5];

for(let i = 0; i < arr.length; i++) {
    if(i === 0)

}

const A1 = item => item !== 0;
const A2 = item => item * 2;
const A3 = (a, b) => a + b;


const res =
    arr.filter(A1)
    .map(A2)
    .reduce(A3, 0)


```

FP AOP OOP

AOP -- 面向切面的编程 -- Spring MVC （Java）

XHR 拦截的例子。

命令式编程 -- 声明式编程
状态机。

```js
function() {

    useEffect(() => {
        fetData().then(res => setDatalist(res.data))
    })

    return <div>
        {datalist.map(xxx)}
    </div>
}

fetData().then(res => {
    for(let i in childNodes) {
        childNodes[i].innerHtml = datalist[i];
    }
})

```

### 函数式编程 和 命令式编程 的区别？

- 命令式编程，往往是建立在直接操作和检查程序状态之上；
- 函数式，倾向于把程序拆分，并抽象成多个函数组装回去。
- filter, map, reduce.

### 我要做一道菜 - 回锅肉

#### 命令式 编程

从一头猪， 养大， 喂养， 宰杀， 切肉， 煮， 炒， 上桌。

#### OOP

我 -- 做 -- 回锅肉

#### 函数式

喂养的 function, 宰杀的 function， 制作的 function -- compose
func ( pig ) -> dish

## 函数式的特点

### 函数是一等公民

#### 高阶函数

- 函数可以作为返回值；
  - 就给了一些函数，组合，编排，缓存的能力。
- 函数可以作为参数传递；
  - 给了一些函数，包装的能力。

##### 优点

- 表达力更清晰
- 利于复用
- 利于维护

#### 纯函数

> 一个函数如果，输入参数确定，那么输出的结果，一定是唯一的。

- 无状态
- 无副作用
- 无关时序
- 幂等

```js
const minusCount = (num) => {
	// window.count--;
	//  todo...
	return window.count - num;
};

const minus2 = (num) => {
	return yyy.count - num;
};

//  单独封装一个函数，去处理和，window 相关的内容

const xxx = () => {
	return window;
};

const yyy = () => {
	return yyy;
};

// 我要保证，这个函数的意义。 原子。原子。原子。
// 函数式，倾向于把程序拆分，并抽象成多个函数组装回去。
const minusCount = (global, num) => {
	return global.count - num;
};
```

#### 多人协作的开发过程中，如何去考虑副作用？

##### 函数的编写

Trade off
公共组件。
<baidu-search 
barList="ht, sxt"
searchName="百度一下">
</baidu-search>

##### 组件的拆分

- API 层 和 UI 层
- 组合 -- 各个 UI 是可复用的。
- 副作用
  - css 隔离
  - 定位

##### 架构的设计

模块化，微前端，解决什么问题。
**熵增**

#### 科里化

> 在计算机科学中，柯里化（currying），又译为卡瑞化或加里化，是把接受多个参数的函数变换成接受一个单一参数（最初函数的第一个参数）的函数，并且返回接受余下的参数而且返回结果的新函数的技术。这个技术由克里斯托弗·斯特雷奇以逻辑学家哈斯凯尔·加里命名的。

```js
const minusCount = (global, num) => {
	return global.count - num;
};

const minusCount = (global) => {
	return function (num) {
		return global.count - num;
	};
};

minusCount(global, num);
minusCount(global)(num);
```

## 做题

60 分钟

## 如何学习

30 分钟
