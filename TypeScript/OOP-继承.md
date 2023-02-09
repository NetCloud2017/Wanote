**TS 继承的重要+长远意义**

- 练就更深厚的 JS 原型，原型链功底

  TS 编译后的 JS 中有经典的 JS 原型和原型链的源码实现，虽然稍显复杂，但源码并不长，这将是练就更深厚的 JS
  原型，原型链功底的绝佳场景。通过这几次课的认真磨练，大家将拥有更深厚的 JS 原型，原型链功底【当然你
  必须认真看完，多练方可】。这不仅让你日后面试大受益，而且也为你能阅读 Vue3,React 源码或其他流行框架
  源码铺路，因为不管是那种源码，JS 原型链继承一定会用到，再加上你的 TS 功底，那么这些都成让你日后前端
  之路走的更远，走的更高！

- 提升前端项目架构的根基技术

  如果要你现在用开发一个工具库，组件库，你打算怎么开发？可以写出 n 多个版本的代码，都可以实现，但版
  本和版本之间的价值却差别巨大，你可以用 JS 原型写出 1 年左右工作经验的前端水准的代码，当然，上乘之选
  肯定是用 TS 来开发，你也可以灵活运用 TS 继承，多态等多种技术写出高水准的代码。但如果你不具备后端思
  维能力，就算你工作了 5 年，你也不一定能有这样的思维，甚至随时有可能被一个拥有了后端思维的只有 1 到 2
  年工作经验水准的前端工程师超越。

- 突破前端技术瓶颈之一的技能，晋级中、高级前端工程师必会技能

如果你只掌握了单个类的使用，而不知道如何运用继承，那这也是技能缺失，将会限制你日后技术发展的高
度，限制你的技术视野，让你的前端变得过于前端化。
说深度掌握了 TS 继承就能突破所有的前端技术瓶颈，那很显然是夸大其词，但要想突破前端技术瓶颈，深度
掌握继承必然是其中一项技能，而且是根基技术之一，可见继承的重要性不言而喻。

比如一个简单的汽车租赁项目，让你来实现，你把前端功能实现了，展示在页面上了，但是打开你用 TS 写的
Vuex 代码，用 TS 写的 Nodejs 代码，过于前端化的思维让你编写的代码可能让人不堪入目。这里不单单是说
用到封装继承，多态，解耦这些技术，更多的是你过于前端化的思维编写的项目可扩展性将非常差，可读性也
将差，可重用性【复用性】也低，而这些是评判一个项目是否值钱的关键因素。

如果你希望未来职业生涯拥有更广阔的技术视野；更远的未来你甚至希望自己能胜任技术总监，那么你就一定
从一个更广阔的技术视野来提升自己的技术能力，不能让自己被框在过于前端化的路上。

虽然老师不能三言两语给同学们描述出什么才叫完全突破前端瓶颈，但有一点是可以肯定的，就是要有一定的
后端思维能力，这里当然不是要拥有 Java 后端能力，而是起码具备 Nodejs 后端的项目架构能力，Nodejs 可
以前端工程师提升晋级一定要掌握的技能。而深度掌握了 TS 继承已经为突破前端技术瓶颈开了一个好头。

- 继承

```js
function Mom() {}
Mon.prototype.money = function () {};
function Son() {}
Son.prototype = new Mon();
let son = new Son();
```

- 原型链继承的好处

  原型链继承实现的本质是改变 Son 构造函数的原型对象变量的指向【就是 Son.prototype 的指向】，
  Son.prototype=new Parent（）。那么 Son.prototype 可以访问 Parent 对象空间的属性和方法。
  所以顺着[proto]属性，Son 类也可以访问 Parent 类的原型对象空间中的所有属性和方法。

  原型链继承查找属性和方法的完整描述：

  子对象首先在自己的对象空间中查找要访问的属性或方法，如果找到，就输出，如果没有找到，就沿着子
  对象中的 proto 属性指向的原型对象空间中去查找有没有这个属性或方法，如果找到，就输出，如果没有
  找到，继续沿着原型对象空间中的 proto 查找上一级原型对象空间中的属性或方法，直到找到
  Object.prototype 原型对象属性指向的原型对象空间为止，如果再找不到，就输出 null

（2）原型链继承实现容易被遗忘的重要一步

Son.prototype.constructor = Son

（3）原型链继承常见疑问

Son.prototype= Parent.prototype 这样作为原型链继承的模式和 Son.prototype=new Parent(.….)又有什么区别呢?

```js
Son.prototype = Parent.prototype 使用了同一个对象作为原型。
当
Son.prototype.constructor = Son  时， Parent的constructor 也是 Son 这是不合理的。

```

(4）原型链继承的不足

局限性：不能通过子类构造函数向父类构造函数传递参数

2-22 深度掌握 TS 继承准备：借用构造函数

（1）借用构造函数继承如何解决原型链继承的局限性

借用构造函数继承思想就是在子类【ChinesePeople 构造函数】的内部借助 apply（）和 call（）方法调用并传
递参数给父类【People 构造函数】。

**TS 继承准备：借用构造函数**

```js
function People(name,sex,phone){// People父构造函数【看成是一个父类】
    this.name=name；//实例属性
    this.sex=sex;
    this.phone=phone
}
People.prototype.doEat=function(){
    console.log(this.name +"吃饭...")
}
function ChinesePeople(name,sex,phone){//chinesepeople子构造函数【看成是一个子类】
    People.apply（this,[name,sex,phone])；//借用父构造函数继承
    this.national=national;//民族
}
let chinesePeople=new ChinesePeople("wangwu",'男',"1111");

```

（2）借用构造函数继承的不足
借用构造函数实现了子类构造函数向父类构造函数传递参数，但没有继承父类原型的属性和方法，无法访问父类原型上的属性和方法。

**TS 继承准备：借用构造函数+原型链继承组合模式**
（1）借用构造函数+原型链继承组合模式的优势

优势 1：具备借用构造函数的优点：子类【ChinesePeople 构造函数】的内部可以向父类【People 构造函
数】传递参数

优势 2：具备原型链继承的优点：ChinesePeople.prototype 和 new ChinesePeople()出来的实例对象变量和
实例都可以访问父类【People 构造函数】原型对象上的属性和方法。

```js
function People(name,sex,phone){//People父构造的数【看成是一个父类】
    this.name=name;//实例属性
    this.sex=sex:
    this.phone=phone
}
People.prototype.doEat=function(){
    console.log(this.name +"吃饭...")
}
function ChinesePeople(name, sex, phone, national) {
    People.apply(this, [name, sex, phone]) // 借用父类构造函数继承
    this.national = national ;// 民族
}
ChinesePeople.prototype  = new People("wnagwu", '男', '1235 ')
```

（2）借用构造函数+原型链继承组合模式的不足：

缺点：调用了两次父类构造函数【People 构造函数】new People 调用构造函数带来问题：

1.进入 People 构造函数为属性赋值，分配内存空间，浪费内存；

2.赋值导致效率下降一些，关键是 new People 赋的值无意义，出现代码冗余，new ChinesePeople 出来的对象和这些值毫不相干，是通过子类 ChinesePeople 构造函数中的 apply 来向父类 People 构造函数赋值。

**TS 继承准备：熟练掌握 3 种寄生组合继承实现方法 1【最佳继承模式】**
2-24 深度掌握 TS 继承准备：

多方法掌握寄生组合继承

寄生组合继承模式=借用构造函数继承+寄生继承。

寄生组合继承既沿袭了借用构造函数+原型链继承两个优势，而且解决了借用构造函数+原型链继承调用了两次父类构造函数的不足。寄生组合继承模式保留了借用构造函数继承，寄生组合继承模式使用寄生继承代替了原型链继承。

```js
// 寄生组合继承实现步骤
//第一步：创建一个寄生构造函数
function Middle() {
	this.count = 23;
	Middle.prototype = People.prototype;
}
//第二步：创建一个寄生新创建的构造函数的对象
let middle = new Middle();
//第三步：chinesePeople子类的原型对象空间指向第二步的新创建的构造函数的对象
ChinesePeople.prototype = middle;
```

**TS 继承准备：熟练掌握 3 种寄生组合继承实现方法 2【最佳继承模式】**

**TS 继承准备：熟练掌握 3 种寄生组合继承实现方法 3【最佳继承模式】**

**用全栈眼光更深入理解 TS 继承**
