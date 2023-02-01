// 手写 promise
class ClonePromise {
	constructor() {
		this.state = "pendding";
	}

	then(func) {}
	resolve() {}
	reject() {}
}

async function pipe(promiseArr, count = 6) {
	let requestMap = [],
		init = 0,
		res = [];
	for (var i = 0; i < promiseArr.length; i += count) {
		requestMap.push(promiseArr.slice(init, init + count));
		init += count;
	}
	res = await new Promise((resolve, reject) => {
		let _res = [];
		requestMap.forEach(async (item) => {
			let respond = await Promise.all(item);
			_res.concat(respond);
		});
		resolve(_res);
	});
	return res;
}
