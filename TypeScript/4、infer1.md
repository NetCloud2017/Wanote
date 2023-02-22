# 学习 infer+TS 高级类型的价值和意义

TypeScript 提供了较多的高级类型，通过学习高级类型可以帮助提高 TS 代码的灵活运用能力，掌握好这些高级类型能进一步提升我们对泛型的理解和驾驭能力，让 TS 功底更深厚，把我们的 TS 水平推向一个更高的层次，无论以后在项目中运用 TS 还是对理解源码的复杂 TS 泛型语法都有不小的帮助，由于 TS 高级类型为我们提供了很多技巧性强的功能，当我们在项目中遇到使用这些功能的应用场景时，会给项目带来更简洁，更轻量级的实现效果，比如：如果我们项目中只需要查询 key value 数据，那么 Record 类型就是轻量级的 Map，再比如 Omit 快捷爬取 Todo 列表中的数据，保证编辑和预览时的不同效果。

# 【infer 】理解替换“神器”infer +infer 和泛型的区别【原理+使用案例】

infer 的定义：infer 表示在 extends 条件语句中以占位符出现的用来修饰数据类型的关键字，被修饰的数据类型等到使用时才能被推断出来。

infer 占位符式的关键字出现的位置：通常 infer 出现在以下三个位置上。

(1）infer 出现在 extends 条件语句后的函数类型的参数类型位置上

(2)infer 出现在 extends 条件语句后的函数类型的返回值类型上

(3）infer 会出现在类型的泛型具体化类型上。

```ts
type inferType<T> = T extends (param: infer P) => any ? P : T;
interface Customer {
	custname: string;
	buymoney: number;
}
type custFuncType = (cust: Customer) => void;
type inferType = inferType<custFuncType>; //结果为customer
const cust: inferType = { custname: "wangwdu", buymoney: 23 };

// infer举例2:
class subject {
	constructor(public subid: number, public subname: string) {}
}
let chinesesubject = new subject(100, "语文");
let mathsubject=new Subject(101,"数学")
let englishSubject=new Subject(101,"英语")

let setZhangSanSubject = new Set<Subject>([chinesesubject, mathSubject,englishSubject)

type ss = typeof setZhangSanSubject
type ElementOf0<T> = T extends Set<infer E> ? E : never;
let result: Subject
let result:Elementof0< typeof setZhangSanSubject>

```

面试题
5-3【infer】构建带参数的工厂实例方法+分清易混淆的概念【泛型+infer 的综合运用面试题】
课程安排 1.准备分清易混淆的概念 2.获取构造函数的参数 3.创建带参数的构造函数工厂实例方法

```ts
class TestClass {//准备类
    public name: string,
    public classno: number
    constructor(name: string, classno: number) {
        this.name = name;
        this.classno = classno
    }
}
type ConstructorParamType<T> = T extends new (...args: infer P) => any ? P : never
//let  params: ConstructorParamType<typeof TestClass>  获取到  TestClass 构造函数的参数类型, 且是一个 元组类型 [name: string, classno: number]， 因为 ...args 是剩余参数, 但是类型传错了 T 传错了也没有报错

// 修改一下, 约束一下传进的类型传进会报错
type ConstructorParamType<T extends new (...args: any[]) => any> = T extends new (...args: infer P) => any ? P : never
type Constructor<T> = new (...args:any[]) => T
function createInstance<T>(constructor: Constructor<T>, .…args: any[]) {
    return new TestClass( "wangwu",args[0], args[1])
}
// createInstance<TestClass>(TestClass,"wangwu", 105).eat();
createInstance(TestClass, "wangwu", 105).eat();
// 但是这样还是有问题 , createInstance 多传参数，或参数顺序混乱也没有报错。
// 解决:
// function createInstance<T>(constructor: Constructor<T>, ...args: [string, number ]) {
    // [string, number] 这种写法是不行的， 不通用。
// function createInstance<T>(constructor: Constructor<T>, ...args:  ConstructorParamType<typeof TestClass> ) {
    //  ConstructorParamType<typeof TestClass>  这种写法虽然合适 TestClass 这个类， 但是还是没有做到通用。
function createInstance<T, CP extends new (...args: any[]) => any>(constructor: Constructor<T>, ...args:  ConstructorParamType<CP> ) {
    // 这样就可以了
    return new TestClass( "wangwu",args[0], args[1]) // 但是这里的参数也要改下， 假如传4/5 个参数呢？
}
createInstance<TestClass, typeof TestClass>(TestClass, "wangwu", 105).eat();
//infer 获取构造器参数
type ConstructorParamType<T extends new (...args: any[]) => any >=
T extends new (..args: infer R) => any ? R :any;
//infer获取构造器返回值类型
type InstanceType<T extends new (...args: any[]) => any >= T extends new(...args: any:[]) => infer R ? R : any;

```

- 认清 类的 构造函数变量和类型

```ts
class ChinesePeople {//准备类
    public name:string
    public sex: string
    public phone: string
    public national: string
    constructor(name: string, sex: string, phone: string, national: string) {
        this.name =name;
        this.sex = sex
        this.phone = phone
        this.national = national
    }
}

let MyChinesepeople: new (name: string, sex: string, phone: string,
national: strng) => ChinesePeople = Chinesepeople//599
//new MyChinesePeople(……);//=new ChinesePeople(……);
//一个类的构造函数的类型表示2: typeof ChinesePeople
// typeof Chinesepeople //Chinesepeople是一个构造函数对象变量
let MyChinesepeople12: typeof ChinesePeople = ChinesePeople //  // 写法 等价于 MyChinesePeople；

//new MyChinesePeople12()//=new =new ChinesePeople(..…);
let cp =new Mychinesepeople12("wangwu","男","1111","汉族");
cp.eat();
let MyChinesePeople2: new (...args: any[]) => any = ChinesePeople
//new MyChinesePeople2(.…);//=new ChinesePeople(.……);
type Constructor<T> = new (.….args:any[]) => T
//Chinesepeople是为了具体化泛型T的一个类型
let MyChinesePeople3: Constructor<ChinesePeople> = ChinesePeople

```

# infer 在 Vue3 中的使用

```ts
function unref<T>(ref: T): T extends Ref<infer V> ? V : T {
	return isRef(ref) ? (ref.value as any) : ref;
}
let iRef = ref(23)// {value:23}
console.log('响应整数类型的ref'，iRef)
//let iValue = unref<Ref<number>>(iRef)
let iValue = unref(iRef)
console.log('iValue:', iValue)
type objType100={username:string}
let obj100:objType100={ username:'wangwu'};
let iValue2 = unref(obj100)
console.log('iValue2:', iValue2)

```
