# child_process

启动子进程库

```js
// 获取进程id 和父进程 id
process.pid;

process.ppid; // 父进程
```

```js
const cp = require("child_process");
```

启动子进程方式 1

## `cp.execFile`

执行文件

```javascript
cp.execFile(
	"node", //用 node 去执行这个文件
	[path.resolve(__dirname, "./DevService.js")],
	{},
	(err, stdout) => {
		if (!err) {
			console.log(stdout); // 标准输出
		} else {
			console.log(err);
		}
	}
);
```

## `cp.exce`

直接命令执行, 有一定风险， 因为可以直接执行命令。如 `cp.exce( rm --rf a.js)`.

```javascript
cp.exce(
	`node ${path.resolve(__dirname, "./DevService.js")} --force`,
	(err, stdout) => {
		if (!err) {
			console.log(stdout); // 标准输出
		} else {
			console.log(err);
		}
	}
);
```

## `cp.exceSync`

同步执行， 返回值是 buffer, 内容是执行环境变量路径和执行文件路径和 命令的 options

```javascript
let buffer = cp.exceSync(
	`node ${path.resolve(__dirname, "./DevService.js")} --force`
);

console.log(buffer.toString());
```

## `cp.spawn`

它是最低值的方法， 前面的方法都是基于它实现的。 它没有回调。

```javascript
let child = cp.spawn(
	"node",
	[path.resolve(__dirname, "./DevService.js")],
	"--force"
);
child.stdout.on("data", function (data) {
	console.log("stdout: " + data);
});

child.stderr.on("data", function (data) {
	console.log("stderr: " + data);
});

child.on("close", function (code) {
	console.log("子进程已退出，退出码 " + code);
});
```

## `cp.fork`

fork 只能执行 js 文件。可用于 rpc 通信。

```javascript
// index.js
const scriptPath = path.resolve(__dirname, "./devService.js");
const child = cp.fork(scriptPath, ["--port 8080"]); // 进程传递参数
child.on("message", (data) => {
	console.log(data);
});
child.send("hello child process");
```

```javascript
// devService.js
// 获取进程参数
console.log(process.argv.slice(2));
process.on("message", (data) => {
	console.log(data);
});
process.send("hello mian process");
```
