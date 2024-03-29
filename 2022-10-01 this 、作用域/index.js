// 手写bind 函数
Function.prototype.abind = function (context, ...rest) {
	const fn = this;
	console.log(this);
	return function (...agrs) {
		return fn.apply(context, [...rest, ...agrs]);
	};
};

// test

let a = {
	name: "joker",
};

function logName() {
	console.log(this.name);
}
logName.abind(a)();

// 手写 apply 或 call

Function.prototype.called = called;
function called(context, ...rest) {
	context.fn = this;
	if (context) {
		let result = context.fn(...rest);
		return result;
	}
}

Function.prototype.called = function (ctx, ...args) {
	const fn = tihs;
	if (typeof ctx !== "object") {
		return fn(...args);
	}
	ctx.fn = fn;
	let outcome = ctx.fn(...args);
	delete ctx.fn;

	return outcome;
};
