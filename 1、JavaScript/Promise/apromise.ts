type ResolveType = (resolve: any) => any;
type RejectType = (reject: any) => any;

type Executor = (resolve: ResolveType, reject: RejectType) => any;

export class aPromise<T = any> {
	public resolve!: ResolveType;
	public reject!: RejectType;
	public status!: string;
	public resolve_executor_value!: any; // resolve 传递的值
	public reject_executor_value!: any; // resolve 传递的值
	public resolve_then_callbacks: (() => void)[] = [];
	public reject_then_callbacks: (() => void)[] = [];

	constructor(executor: Executor) {
		this.status = "pending";

		this.reject = (value: any): any => {
			if (this.judgeStatus("pending")) {
				this.status = "fail";
				this.reject_executor_value = value;
			}
		};
		this.resolve = (value: any): any => {
			if (this.judgeStatus("pending")) {
				this.status = "success";
				this.resolve_executor_value = value;
				// 当调用 then 方法的时候这个 then 就是 上一次new 的promise 的实例.
				this.resolve_then_callbacks.forEach((callback) => callback());
			}
		};
		try {
			executor(this.resolve, this.reject);
		} catch (err) {
			this.status = "pending";
			this.reject(err.toString());
			throw new Error("程序终止...."); // 这里会终止掉当前的 js 线程'
		}
	}
	judgeStatus(status: string): boolean | string {
		if (status.length > 0) {
			if (status === "pending" || status === "success" || status === "fail") {
				return true;
			} else {
				return false;
			}
		} else {
			return this.status;
		}
	}
	then(resolveThen: ResolveType, rejectThen: RejectType) {
		// 实现 then 方法后面链式调用
		return new Promise((resolve, reject) => {
			let res;
			if (this.judgeStatus("success")) {
				res = resolveThen(this.resolve_executor_value);
				resolve(res);
			}
			if (this.judgeStatus("fail")) {
				res = rejectThen(this.reject_executor_value);
				reject(res);
			}
			if (this.judgeStatus("pending")) {
				this.resolve_then_callbacks.push(() => {
					res = resolveThen(this.resolve_executor_value);
					// 处理then 方法里返回的 promise
					if (isPromise(res)) {
						res.then(
							(resolveRes) => {
								resolve(resolveRes);
							},
							(rejectRes) => {
								reject(rejectRes);
							}
						);
						resolve(res.resolve_executor_value);
					} else {
						resolve(res);
					}
				});
				this.reject_then_callbacks.push(() => {
					res = rejectThen(this.reject_executor_value);
				});
			}
		});
	}
}

function isPromise(val: any): val is Promise<any> {
	return isObject(val) && isFunction(val.then);
}
function isObject(val): val is Record<any, any> {
	return val !== null && typeof val === "object";
}
function isFunction(val): val is Function {
	return typeof val === "function";
}
