# XSS

即 CSS （cross site scripts）通过在用户端嵌入脚本进行攻击的手段。常用的攻击行为主要有： 窃取 Cookie 信息， 监听用户行为， 修改 DOM ， 在页面生成 浮窗广告。

XSS 攻击类型：

1. 存储型 XSS 攻击： 即通过入侵 web 服务器， 在服务器放置攻击脚本。当用户浏览 web 时就会携带该脚本。这样就可以攻击用户了

2. 反射型 XSS 攻击: 用户点击例如 `http://localhost:3000/?xss=<script>alert('你被 xss 攻击了')</script> `的连接， 而服务器利用模板将 脚本内嵌到模板中， 然后以 HTML 的形式返回给用户。 当页面打开时， 浏览器就下载了这段攻击脚本， 进行攻击。

3. 基于 DOM 的 XSS 攻击：由于用户输入没有做好序列化和 CSP。导致的脚本入侵攻击。例如， 在一个 TODOList 里添加了 `<script src="攻击脚本资源地址"></script>` 接着这个脚本就下载到用户端进行攻击了。

## 对于 XSS 攻击的应对策略：

无论何总 XSS 攻击都是通过注入脚本进行攻击的， 所以防止 XSS 攻击就需要防止 脚本的注入和恶意脚本的消息发送。

策略如下：

- 对服务端关键内容进行转码： 例如：

```js
// 针对 存储型 XSS
<script>alert('你被xss攻击了')</script>
// 字符串实体转换
&lt;script&gt;alert(&#39;你被xss攻击了&#39;)&lt;/script&gt;
```

- 充分利用 CSP

  限制加载其他域下的资源文件，这样即使黑客插入了一个 JavaScript 文件，这个 JavaScript 文件也是无法被加载的；

  禁止向第三方域提交数据，这样用户数据也不会外泄；

  禁止执行内联脚本和未授权的脚本；

  还提供了上报机制，这样可以帮助我们尽快发现有哪些 XSS 攻击，以便尽快修复问题。

- 使用 HttpOnly

  ```
  set-cookie: expires=Sat, 18-Apr-2020 06:52:22 GMT; path=/; domain=.google.com; HttpOnly

  ```
