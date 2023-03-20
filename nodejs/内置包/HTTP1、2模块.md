## http2 模块

http 2.0 版本, 默认支持 https。

安装本地证书

> openssl reg -nevkey rsa:2048 -nodes -keyout rsa_private.key -x509 -days 365 -out cert.crt

```js
const http2 = require('http2');
const fs = require('fs');
const server = http2.createSecureServer({
key: fs.readFileSync('rsa_private.key'),
cert: fs.readFileSync('cert.crt')
}):
server.on('error', (err) => console.error(err));
server.on('strean', (stream, headers) ▪> {
// strean is a Duplex
strean.respond((
'content-type': 'text/htnl',
':status': 200
}):
stream.end('<hl>Hello World</hl>');
);
server.listen(8443);
```

http1.0 和 2.0 的区别
