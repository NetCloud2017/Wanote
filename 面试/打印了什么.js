const value = 3;
// function foo() {
// 	console.log(this.value);
// 	console.log(value);
// }

const foo = () => {
	console.log(this.value);
	console.log(value);
};
const obj = {
	value: 2,
	foo,
};
function bar() {
	const value = 4;
	setTimeout(() => {
		console.log(this.value);
		console.log(value);
	});
	const c = foo.bind(obj);
	c();
	const b = obj.foo;
	b();
	obj.foo();
	foo();
}
bar();
// 2,3, udf, 3, 2,3, udf, 3
