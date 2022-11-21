const reactive = (target) => {
	return new Proxy(target, {
		get(target, key, receiver) {
			// 收集依赖
			const res = Reflect.get(target, key, receiver);
			return res;
		},
		set(target, key, value, receiver) {
			// 触发依赖
			const res = Reflect.set(target, key, value, receiver);
			return res;
		},
	});
};

// 副作用區域
const effectStack = [];
const effect = (fn) => {
	const effectFn = () => {
		effectStack.push(effectFn);
		return fn;
	};
	effectFn();
	return effectFn;
};

// 依賴存儲
const targetMap = new Map();
const track = (target, key) => {
	let depsMap = targetMap.get(target);
	if (!depsMap) {
		depsMap = new Map();
		targetMap.set(target, depsMap);
	}
	let deps = depsMap.get(key);
	if (!deps) {
		deps = new Set();
		depsMap.set(key, deps);
	}
};
