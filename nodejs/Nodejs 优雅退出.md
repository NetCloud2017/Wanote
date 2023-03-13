# 优雅退出

## 简单的优雅退出

```js
const http = require("http");
const server = http
	.createServer(function (req, res) {
		setTimeout(function () {
			res.writeHead(200, { "Content-Type": "text/plain" });
			res.end("Hello World \\n");
		}, 3000);
	})
	.listen(8000, function (err) {
		console.log("listening <http://localhost:8000/>");
		console.log("pid is" + process.pid);
	});

// 监听信号

const process = require("process");
process.on("SIGTERM", function () {
	server.close(function () {
		process.exit(0); // 关闭进行
	});
});
```

## 集群方式下的优雅退出

```js

```
