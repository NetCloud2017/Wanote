function isObject(data) {
	return data && typeof data === "object";
}

let targetMap = new WeakMap();
let activeEffect;

function track(target, key) {
	let depsMap = targetMap.get(target);
	if (!depsMap) targetMap.set(target, (depsMap = new Map()));

	let dep = depsMap.get(key);
	if (!dep) depsMap.set(key, (dep = new Set()));
	trackEffect(dep);
}

function trackEffect(dep) {
	if (!dep.has(activeEffect)) dep.add(activeEffect);
}

function trigger(target, key) {
	const depsMap = targetMap.get(target);
	if (!depsMap) return;
	depsMap.get(key).forEach((effect) => effect && effect.run());
}
