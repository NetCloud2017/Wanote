## Extract

Extract 是 TS 内置的工具类型。

Extract 不同场景下的不同理解+和类型断言的异同

**从结果上详细对比的 Extract 泛型约束和类型断言【父子类】**

```ts
// 这里的 extends 不是继承，而是泛型约束
// extract 的原码就是这个。
type Extract<T, U> = T extends U ? T : never;

// 首先了解一下 Extract 的运行流程： T 若是 U 的子类型 则条件成立， 返回 T 类型， 否则返回 never;

type func1 = (one: number, two: string) => string;
type func2 = (one: number) => string;

//  参数少的函数类型 extends 参数多的函数类型 返回true
//  参数多的函数类型 extends 参数少的函数类型 返回false
type beginType1 = func1 extends func2 ? func1 : never; //never
type beginType2 = func2 extends func1 ? func2 : never; //func2

//这个Extract是TS内置方法
type tType1 = Extract<func1, func2>; //never
type tType2 = Extract<func2, func1>; //= (one: number) => string  和上面有区别
```

```ts
class People {
	public name!: string;
	public age!: number;
	public address!: string;
	eat() {}
}

class ChinesePeople extends People {
	private phone!: string;
}

let cp = new ChinesePeople();

// Extract 是TS提供的一个TS高级type类型【简称TS高级类型】
type Extract<T, U> = T extends U ? T : never;

// Extract 在 父类和子类中应用
// 定律：子类  extends 父类=>子类 extends 父类永远返回true=>返回T类型
type extractType = Extract<ChinesePeople, People>; // ChinesePeople

// 定律: 父类  extends 子类=>父类 extends 子类返回false 因为父类继承子类本身不成立，所以一般都为false
//  但如果希望人为制造一个true 获取到People
// 那只有子类实例属性或实例方法个数必须和父类一样多
type extractType2 = Extract<People, ChinesePeople>; // never

// 父类 extends 子类 如果 父类和子类的属性和方法一样多 那么就输出 People 返回 true
// 但如果子类比父类属性多，那么结果就返回 false 输出 never

// 类型断言 在父类和子类如何断言
let people: People = new People();
let ChinesePeople2 = people as ChinesePeople; // 父类对象变量断言成子类类型 成立

let americanPeople: ChinesePeople = new ChinesePeople();
let p: People = americanPeople as People; // 子类对象变量断言成父类类型 成立
```

类型断言在继承上是子类可以断言成父类， 父类也可以断言成子类。 Extract 是判读父子俩的约束关系是否成立。

从结果上详细对比 Extract 泛型约束和类型断言【联合类型】

```ts
type Extract<T, U> = T extends U ? T : never;
type unionExtractType = Extract<string, string | number>// string
type unionExtractType2 = Extract<string | number, string | number>// string| number
type unionExtractType3 = Extract<string | number, string | number | symbol>// string | number
type unionExtractType4 = Extract<string | number, string>// string

先将 string 和 string  比较， 再将 number  和 string  比较， 最后返回 string 类型;

type Extract<T, U> = T extends U ? T : boolean；

type unionExtractType4 = Extract<string | number, string>// string | boolean;

//分解判断：
//第一次string extends string?T：boolean//结果string
//第二次number extends string?T：boolean//结果boolean
//合起来的结果就是 string | boolean

```

**从结果上详细对比 Extract 泛型约束和类型断言【函数】**

```ts
type func1 = (one: number, two: string) => string;
type func2 = (one: number) => string;

// 函数的泛型约束
// 函数类型上的泛型约束 参数类型和返回值完全相同的情况下，
//  参数少的函数类型 extends 参数多的函数类型 返回true
//  参数多的函数类型 extends 参数少的函数类型 返回false
type beginType1 = func1 extends func2 ? func1 : never; // never
type beginType2 = func2 extends func1 ? func2 : never; // never

type extractType1 = Extract<func1, func2>; //never
type extractType2 = Extract<func2, func1>; //= (one: number) => string
```

**Extract 真实应用场景.ts**

```ts
// 前面的三个对象合并的优化。
type CrosTyp<T> = Extract<T, object>;
type Extract<T, U> = T extends U ? T : never;

function cross<T, U>(objOne: CrosTyp<T>, objTwo: CrosTyp<U>): T & U;
function cross<T, U, V>(
	objOne: CrosTyp<T>,
	objTwo: CrosTyp<U>,
	objThree: CrosTyp<V>
): T & U & V;
function cross<T, U, V>(
	objOne: CrosTyp<T>,
	objTwo: CrosTyp<U>,
	objThree?: CrosTyp<V>
) {
	let obj = {};
	let combine = obj as T & U;

	Object.keys(objOne).forEach((key) => {
		combine[key] = objOne[key];
	});
	Object.keys(objTwo).forEach((key) => {
		if (!combine.hasOwnProperty(key)) {
			combine[key] = objTwo[key];
		}
	});
	if (objThree) {
		//如果有第三个对象传递进来实现交叉
		//let obj = {}
		//let combine2 = obj as T & U & V
		//let combine2=combine as T & U & V
		let combine2 = combine as typeof combine & V;
		Object.keys(objThree).forEach((key) => {
			if (!combine2.hasOwnProperty(key)) {
				combine2[key] = objThree[key];
			}
		});
		return combine2; // 三个对象交叉结果
	}
	return combine; // 两个对象交叉结果
}
let combine = cross<Button, Link>(button, link);
```
