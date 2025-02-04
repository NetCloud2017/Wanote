## 基本数据类型

number, string, boolean, symbol, null, undefined

## 跟类型

Object, {} 这两个相等， 他们是除 nul1 / undefined 不能赋值之外的其他类型的父类。

## 对象类型

Array, object: 它只能是对象不可以像 string，number 可以赋值给 跟类型, function

## 枚举类型

enum

1. 字符串枚举

```ts
//字符串枚举, 有key-value双重映射，
enum WeekEnd {
	Monday = "Monday",
	Tuesday = "Tuesday",
	Wensday = "Wensday",
	ThirsDay = "ThirsDay",
	Friday = "Friday"
    Sarturday = "Sarturday",
	Sunday = "Sunday",
}
```

2. 数字枚举

```ts
//数字枚举 会根据给的数字逐渐递增, 没有key-value双重映射
enum Week {
	Monday = 1,
	Tuesday,
	Wensday,
	ThirsDay,
	Friday,
	Sarturday,
	Sunday,
}
```

## 其他特殊类型

any, unknown, never, void, 元组 (tuple), 可变元组。

// any ， unknown , undefined 可以接受 undefined 为值；
// any , unknown, null 可以接收 null 为值。

## 合成类型

联合类型，交叉类型

## 字面量数据类型

type num == 1 | 2 | 3

使用场景

```ts
type increaseFlag = 0 | 1
function isstartUp(increase: increaseFlag) {
    if (increase) {
        console.log("open")
    else {
        console.log("close")
    }
}
isstartUp(0)
```
