## 这节讲了 Promise A+ 规范

## resolvePromise 规范

- Promise 是一个构造函数。
- Promise 接收一个函数作为参数，这个函数的参数，是两个函数。
- Promise 返回的对象，包含一个 then 函数， 这个 then 函数，接收两个参数，这两个参数，也都是函数。
  [rule--]
  Promise 的 status：

1. `pending`

- 初始的状态，可改变
- 一个 Promise 在 `resolve` / `reject` 前都处于这个状态
- 我们可以通过调用 `resolve` 方法或者 `reject` 方法， 让这个 Promise 变成 `fulfilled` / `rejected` 状态。

2. `fulfilled`

- 不可变状态
- 在 `resolve` 之后，变成这个状态，拥有一个 `value`

3. `rejected`

- 不可变状态
- 在 `reject` 之后，变成这个状态，拥有一个 `reason`

then 函数

1. 参数
   `onFulfilled` 、 `onRejected` 必须是函数类型，如果不是，应该被忽略；

2. onFulfilled 和 onRejected 的特性
   在 promise 变成 `fulfilled` / `rejected` 状态 的时候，应该调用 `onFulfilled` / `onRejected`；
   在 promise 变成 `fulfilled` / `rejected` 状态 之前，不应该被调用；
   只能调用一次
   [--rule]
