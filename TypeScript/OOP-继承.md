**TS 继承的重要+长远意义**
整张内容
2-21-1
【TS 继承】深度掌握 TS 继承准备：原型链继承+常见疑问
2-21-2
【TS 继承】深度掌握 TS 继承准备：原型链继承+容易被遗忘的重要一步
2-22【TS 继承】深度掌握 TS 继承准备：借用构造函数
2-23【TS 继承】深度掌握 TS 继承准备：借用构造函数+原型链继承组合模式
2-24-1【TS 继承】深度掌握 TS 继承准备多维授课助深度透彻掌握寄生组合继承【实现方法 1 最佳继承模
式】
2-24-2【TS 继承】深度掌握 TS 继承准备：多维授课助深度透彻掌握寄生组合继承【实现方法 1 优化最佳继
承模式】
2-24-3
【TS 继承】深度掌握 TS 继承准备：多维授课助深度透彻掌握寄生组合继承实现方法 2【最佳继承模

【TS 继承】用全栈眼光深度掌握 TS 继承+继承好处【企业真项目应用场景】
2-25-1
2-25-2
【TS 继承】用全栈眼光深度掌握 TS 继承+继承好处【企业真项目应用场景】
2-26-1
【TS 继承】 super+方法重写的真应用
【TS 继承】 super+方法重写的真应用
2-26-2
【TS 继承】逐行深度剖析+手写 TS 继承编译的 JS 源码【练就更深厚 JS 原型+原型继承功底的绝佳
2-27-1
场景]1
【TS 继承】逐行深度剖析+手写 TS 继承编译的 JS 源码【练就更深厚 JS 原型+原型继承功底的绝佳
2-27-1
场景]2
2-27-1
【TS 继承】逐行深度剖析+手写 TS 继承编译的 JS 源码【练就更深厚 JS 原型+原型继承功底的绝佳
场景]3

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

什么是寄生继承呢？就是 ChinesePeople.prototype 不再指向 new People()出来的对象空间，而用 People
类【父构造函数】的原型对象属性“克隆”了一个对象。再让 ChinesePeople.prototype 指向这个新对象，很好
的避免了借用构造函数+原型链继承调用了两次父类构造函数的不足.

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
ChinesePeople.prototype.constructor = ChinesePeople;
```

**TS 继承准备：熟练掌握 3 种寄生组合继承实现方法 2【最佳继承模式】**
优化

<div id="#setPrototypeOf"
```js
function createNewPrototypeObj(parent, son) {
	function Middle() {
		this.count = 23;
		this.constructor = son;
	}
	Middle.prototype = parent.prototype;
	let middle = new Middle();
	return middle;
}
ChinesePeople.prototype = createNewPrototypeObj(People, ChinesePeople);
// ChinesePeople.prototype.constructor = ChinesePeople
// ES 6 写法
function _extends(parent) {
	//继承
	let middle = Object.create(parent.prototype, {
		count: {
			writable: true,
			value: 23,
		},
	});
}

return middle;
const middle = \_extends(People);
ChinesePeople.prototype = middle;
ChinesePeople.prototype.constructor = ChinesePeople;
let chinesePeopleTwo = new ChinesePeople("王海", "男", "1111", "汉族");

````

**TS 继承准备：熟练掌握 3 种寄生组合继承实现方法 3【最佳继承模式】**

**用全栈眼光更深入理解 TS 继承** 1.理解子类
（1）什么是子类？

有两个类，比如 A 类和 B 类，如果满足 A 类 is a kind of B 类，那么 A 类就是 B 类的子类
比如：A 类是顾客类，B 类是人类，因为顾客类 akind of 人类成立【顾客类是人类的一种】，所以顾客类是人
类的子类。

（2）子类如何继承父类的属性和方法?

以顾客类为例子：顾客类继承了父类【人类】的非私有的属性和方法，也具备子类独有的属性和方法。

顾客类继承父类【人类】的全部非私有的属性和方法外，还有哪些独有的属性和方法呢？

顾客类独有属性：顾客等级，顾客编号

顾客类独有方法；购买

(3）初步理解为什么要用继承？

举例：宠物管理项目中的狗狗类，兔子类，小猫类都是宠物，尽管每个宠物都有独有属性和方法，比如狗狗类
的品种，看家方法；兔子类的肤色属性等。但这些类都包含了 name,buymoney[购买价格]，healthstatus[健
康状况]，friendshipstar[和主人的友谊星级数]这些属性，如果每一个类都写这些属性，那么就非常臃肿，可
以把这些属性提取出来放到一个宠物类中，其他类都继承这个宠物类。当然继承还有更多好处，下面借助汽车
租赁功能的实现来更深度的掌握继承。

(4)汽车租赁管理功能【深度掌握继承】
需求 1：汽车租赁功能实现：有小轿车，大巴，卡车三种类型的车，顾客可以租任意一种或多种不同类型的车，按照租用
的天计算租金，同时为了响应国家对各类车安全的管理，对在租赁期内有过各种超载，超乘客数，酒家等违规
的车需额外支付一定的费用。
需求 2：计算退回费用：最终退回顾客的费用为押金扣除使用天数，如押金不足需额外支付不足部分。

方法重写：（override)

条件：一定发生在继承的子类中

位置：子类中重写父类的方法

应用场景：当父类中方法的实现不能满足子类功能需要或不能完全满足子类功能需要时，就需要在子类中进行方法重写

定义规则：

1.和父类方法同名

2.参数和父类相同，如果是引用类型的参数，需要依据具体类型来定义。

3.父类方法的访问范围【访问修饰符】必须小于子类中方法重写的访问范围【访问修饰符】同时父类方法不能是 private .

- super 的使用

  super 只能方法基类的公共方法和受保护的方法， 不能访问基类的属性。

```js
class Parent {
    constructor (a, b, c){
        console.log(a,b, c)
    }

    func() {
        console.log(this, 'parent')
    }
}
class  Sun（） {
    constructor (a, b, c) {
        // 传参给父类的 构造函数
        super(a, b, c) // 编译后 _super.call(this, a, b, c)
        //  super 被编译后就是 传入的类名。名字是 _super,
    }
    func (){

        // 调用和父类同名的方法
        super.func() // 这句被编译后就是 Parent.func.call(this)

    }
}
````

（1）相关技术：setPrototypeOf 使用+和 Object.create 的区别；
利用 setPrototypeOf 实现寄生继承

<a heft="#setPrototypeOf" > create 实现寄生继承的问题 </a>
creat 实现寄生继承的问题是， 替换了原有在原型的地址指向， 原有的属性和方法偶读会失效。而无法继承原有的属性和方法。而 setPrototypeOf 测可以解决这个问题。

```js
function _extends(parents) {
	let middle = {
		count: 112,
	};
	return Object.setPrototypeOf(middle, parents.prototype);
	//  相当于做了这个操作: middle.__proto__ = parents.prototype
}

ChinesePeople.prototype = _extends(People);
ChinesePeople.prototype.constructor = ChinesePeople;
```

（2）父类静态方法和属性在子类中的继承：setPrototypeOf 和 Object.create 分别实现；

1. 原始方法实现静态属性继承
   [for in 解析]('../JavaScript/jsLoop.md')

```js
for (let key in People) {
	// for in 可以获取原型上的静态属性。
	if (Object.hasOwnProperty.call(People, key)) {
		ChinesePeople[key] = People[key];
	}
}
```

2. 第二章实现方式。

```js
Object.keys(People).forEach((key) => {
	ChinesePeople[key] = People[key];
});
```

3. 第三种方式

```js
ChinesePeople.__proto__ = People;
```

4. 第四种方式

```js
Object.setPrototypeOf(ChinesePeople, People);
```

（2）深度掌握+手写+优化底层 extendsStatics 方法的实现；extendsStatics 方法的作用：完成父类静态方法和属性在子类中的继承

```js
// es6 编译后的静态属性继承源码
let extendsStatics = +functiont  () {
    let extends = Object.setPrototypeOf ||
    function objKeys(Son, Parent) {
        Object.keys(People).ForEach(key => {
            Son[key] = People[key]
        })
    }
     ||
    function _proto (Son, Parent) {
        Son.__proto__ = Parent
    }
    ||
   funtion forIn() {
        for(let key in People) {
            if(Object.hasOwnProperty.call(People, key)) {
                Son[key] = People[key]
            }
        }
    }
    return extends;
}();

extendsStatics(Son,Parent)
```

(3）深度掌握\_extends 方法

```js
let _extends = function (Son, Parent) {
	extendsStatics(Son, Parent);
	function Middle() {
		this.constructor = Son;
	}
	if (Parent) {
		Middle.prototype = Parent.prototype;
		Son.prototype = new Middle();
	} else {
		Son.prototype = Object.create(null);
	}
};
```

缺了 编译后的类
