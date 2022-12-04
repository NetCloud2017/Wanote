function Vue(options) {
	this._init(options);
}

Vue.prototype._init = function (options) {
	let { el, data, methods } = options;
	this.$el = el;
	this.$data = data;
	this.$methods = methods;

	proxy(this, this.$data);
	observer(this.$data);
	new Compiler(this);
};

function proxy(context, data) {
	Object.keys(data).forEach((key) => {
		Object.defineProperty(context, key, {
			enumerable: true,
			configurable: true,
			get(target, prop) {
				return target[prop];
			},
			set(target, value, prop) {
				if (!isEqual(target[prop], value)) {
					target[prop] = value;
				}
			},
		});
	});
}

function observer(data) {
	new Observer(data);
}
class Observer {
	constructor(data) {
		this.watch(data);
	}
	watch(data) {
		if (data && typeof data === "object") {
			Object.keys(data).forEach((key) => {
				this.defineReactive(data, key, data[key]);
			});
		}
	}
	defineReactive(obj, key, value) {
		let _this = this;
		this.watch(value);
		let dep = new Dep();
		Object.defineProperty(obj, key, {});
	}
}
class Compiler {}
