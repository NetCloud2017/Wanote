# JSONP

JSONP (json with padding) 是常用的客户端跨越通讯方式之一， 使用十分简单，它的兼容性也非常好。是的实现方式是使用 `<script> ,  <img /> ` 等标签的 src 属性进行跨域请求， 向服务端获取数据，但是它只支持 get 请求。以 `<script> ` 标签为例:

```html
<script type="text/javascript" src="http://localhost:8080/jsonp.do"></script>
```

但是， 直接这样使用的话， 仍然是有问题的。 因为 script 将内容加载完毕后就会用 JavaScript 引擎直接执行里面的内容， 里面的内容不符合， JavaScript 语法规则就会报错。

解决方法是将返回的内容用作当前环境存在的处理该数据的函数的参数， 这样就可以了。
例如请求返回内容为

```js
callback({ result: "success" });
```
