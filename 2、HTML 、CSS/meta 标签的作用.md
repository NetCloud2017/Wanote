### 常⽤的 meta 标签有哪些

meta 标签由 name 和 content 属性定义，用来描述网页文档的属性，比如网页的作者，网页描述，关键词等，除了 HTTP 标准固定了一些 name 作为大家使用的共识，开发者还可以自定义 name。
常用的 meta 标签：

（1）charset，用来描述 HTML 文档的编码类型：

```js
<meta charset="UTF-8" >
```

（2） keywords，页面关键词：

```js
<meta name="keywords" content="关键词" />
```

（3）description，页面描述：

```js
<meta name="description" content="页面描述内容" />
```

（4）refresh，页面重定向和刷新：

```js
<meta http-equiv="refresh" content="0;url=" />
```

（5）viewport，适配移动端，可以控制视口的大小和比例：

```js
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
```

其中，content 参数有以下几种：

width viewport ：宽度(数值/device-width)
height viewport ：高度(数值/device-height)
initial-scale ：初始缩放比例
maximum-scale ：最大缩放比例
minimum-scale ：最小缩放比例
user-scalable ：是否允许用户缩放(yes/no）

（6）搜索引擎索引方式：

```js
<meta name="robots" content="index,follow" />
```

其中，content 参数有以下几种：

- all：文件将被检索，且页面上的链接可以被查询；
- none：文件将不被检索，且页面上的链接不可以被查询；
- index：文件将被检索；
- follow：页面上的链接可以被查询；
- noindex：文件将不被检索；
- nofollow：页面上的链接不可以被查询。

(7)、 用来限制加载哪些域名下的资源。

开启 资源安全策略 （CSP)

```js
<meta http-equiv="Content-Security-Policy" content="default-src 'self'; img-src https://*; child-src 'none';">
```
