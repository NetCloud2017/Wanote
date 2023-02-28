let promise = new Promise((resolve, reject) => {
	console.log(this, "this");
	resolve("eror");
});
let promise1 = promise.then((res) => {
	console.log(this, res, "then this");
	return 1;
});
console.log(promise);
setTimeout(function () {
	console.log(promise, promise1);
}, 1000);

import { aPromise } from "./apromise";

let p1 = new aPromise((resovle, reject) => {
	setTimeout(() => {
		resovle("123");
	}, 1000);
});
