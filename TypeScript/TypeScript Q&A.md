## object 为什么不能替代类上的泛型？

原因一：编译期间 object 无法进行类型安全检查，而泛型在编译期间可以进行类型安全检查

原因二:object 类型数据无法接受非 object 类型的变量，只能接受 object 类型的变量，泛型能轻松做到

原因三：object 类型数据获取属性和方法时无自动提示一种泛型类型被具体化成某种数据类型后，该数据类型的变量获取属性和方法时会有自动提示。

## Object object unknown any 之间的区别

Object 是所有对象的基础， 包括实例化的对象。 他可以被赋值给任何对象，和其他如数字类 Number 、 正则 RegExp 、字符串 String 等的实例。

```js
    let  obj：Object = 123 // 正确
    let  obj1 = Object = {} // 正确
```

object 就只能赋值给对象类型, 如 function 、 [] 和 {} 。

unknown 和 any 都是其他类的顶层类型， any 可以作为其他类型的子类型， unknown 不能，any 在编译期间不会报错， unknown 会； unknown 类型的值只能是 any 和其本身。

## any 为什么不能替代类上的泛型？

原因一：编译期间 any 无法进行类型安全检查，而泛型在编译期间可以进行类型安全检查,

原因二：any 扩大数据类型的属性后没有编译错误导致潜在错误风险，而泛型却有效的避免了此类问题发生;

原因三：any 类型数据获取属性和方法时无自动提示，泛型有自动提示;

## 什么时候用 unknown ， 什么时候用 any;

挡在函数内部不想获取摸个变量的静态属性和方法时就要 unknown， 剩余的情况都可以用 any

```ts
function trimSpace(str: unknown) {
  if (typeof str === "string") {
    //  str.replace  报错 因为 他不能作为其他类型的子类型， 所以报错。
  }
}
// 使用interface的语法，实现函数重载
interface JQuery {
  (readyFunc: () => void): void;

  (selector: string): JqueryInstance;
}
declare var $: JQuery;

// 既是函数又是对象

//函数重载
declare function $(readyFunc: () => void): void;
declare function $(selector: string): JqueryInstance;
//如何对对象进行类型定义，以及对类进行类型定义，以及命名空间的潜逃
declare namespace $ {
  namespace fn {
    class init {}
  }
}
```

## 快速排序

```ts
    //快速排序算法思路：
    //1.先从数列中取出一个数作为基准数。
    //2.分区过程，将比这个数大的数全放到它的右边，小于或等于它的数全放到它的左边。
    //3.再对左右区间重复第二步，直到各区间只有一个数。
function quickSort(arr: Array<any>):Array<any>{
    if (arr.length ‹ 2) { return arr }
    var left: Array<any> = [];
    var right: Array<any> = [];
    console.log("mid:", mid)
    var mid = arr.splice(Math.floor(arr.length / 2), 1)[e];
    for (var i = 0; i< arr.length; i++){
        if(arr[i]<mid){
            left.push(arr[i]);
        } else {
            right.push(arr[i])
        }
    }
    return quickSort(left).concat(mid, quickSort(right))
}
```
