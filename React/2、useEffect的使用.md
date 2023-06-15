# useEffect

## 使用方式 1

```jsx
import { useEffect, useState } from "react";

export function UseEffectTest(props) {
	useEffect(function () {
		// 之后组件状态更新会从新执行一次
		console.log("useEffect");
	});
	return <div>tag</div>;
}
```

react 17 在每次 render 之后都会异步执行一次， 但是 react 18 引入了一个问题， 在 `<react.strictMode> </react.strictMode>` 模式下使用会导致 useEffect 执行两次。

解决方法:

1、去掉 react.strictMode 模式。

2、 利用 useRef 使用 旗帜法。 利用一个变量先为 true ， 执行一次后为 false

## 使用方式 2

只在首次 render 后执行。更新不执行。

```jsx
import { useEffect, useState } from "react";

export function UseEffectTest(props) {
	useEffect(function () {
		// 之后组件状态更新不会从新执行
		console.log("useEffect");
	}, []);
	return <div>tag</div>;
}
```

## shi 使用方式 3

```jsx
import { useEffect, useState } from "react";

export function UseEffectTest(props) {
	let [count, setCount] = useState(0);
	let [count2, setCount2] = useState(1);

	useEffect(
		function () {
			//之后 [count, count2] 中任何一个数据更新都会重新执行一次。
			console.log("count useEffect");
		},
		[count, count2]
	);

	return <div>tag</div>;
}
```

## 使用方式 4

```jsx
import { useEffect, useState } from "react";

export function UseEffectTest(props) {
	let [count, setCount] = useState(0);
	let [count2, setCount2] = useState(1);

	useEffect(
		function () {
			console.log("count2  has  change begin setInterval ");
			// 情况同上。
			let timer = setInterval(() => {
				console.log("timer");
			}, 1000);
			return () => {
				//  在 strict mode 下render后自动执行一次， 在非 strict mode下 render 后不执行。 当该组件状态更新或是卸载后自动执行一次。
				console.log("clear timer");
				clearInterval(timer);
			};
		},
		[count2]
	);
	return (
		<div
			onClick={() => {
				console.log(123);
				setCount((pre) => {
					return ++pre;
				});
				setCount2(count2 + 1);
			}}
			style={{
				// width: "100px",
				display: "inline-block",
				padding: "5px",
				height: "30px",
				color: "black",
				border: "1px solid #000",
				margin: "10px",
			}}
		>{`useEffect ${count},  useEffect count2 ${count2}`}</div>
	);
}
```

**面试题**

```jsx
export function UseEffectTest(props) {
	let [count, setState] = useState(0);

	useEffect(function () {
		setState(1);
	});
	console.log("render"); // 打印多少次 答案 3

	return <div> 123 {count}</div>;
}
```
