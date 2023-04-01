// 手写 promise

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

//
class Bromise {
	constructor(initFunc) {
		this.state = "pendding";
		this.value = null;
		try {
			initFunc(this.resolve, this.reject);
		} catch (err) {
			this.reject(err);
		}
	}
	changeState(state) {
		if (this.state === "pendding") {
			this.state = state;
		}
	}
	resolve(value) {
		this.value = value;
		this.changeState("fullfilled");
	}
	reject(error) {
		this.changeState("reject");
	}
	then(onResolve, onReject) {
		let { state } = this;
		if (state === "fullfilled") {
			onResolve();
		}
		if (state === "reject") {
			onReject();
		}
		return new Promise();
	}
	catch(func) {}
}
