### BOM 和 DOM

> BOM
> [Navigator](#navigator) > [Location](#location) > [Screen](#screen) > [History](#history) > [Window](#window);

JavaScript 在浏览器环境下⼀般由三部分组成。
ECMAScript， DOM 和 BOM；（ie 加⼊了 ActiveXObject 类）

- ECMAScript 核⼼；描述了 JS 的语法和基本对象，我们常说的 ES6，就是属于这个部分的内容；
  - Promise A+ 规范
- DOM 是⽂档对象模型，处理⽹⻚的 API，来⾃于 W3C 的标准
  - https://www.w3.org/TR/
  - https://zh.wikipedia.org/wiki/W3C%E6%8E%A8%E8%8D%90%E6%A0%87%E5%87%86
- 主要的区域是标签⻚中代码展示的部分。
- BOM 是 Browser Object Model，浏览器对象模型。 BOM 顾名思义其实就是为了控制浏览器的⾏为⽽出现的接⼝。
  - 浏览器中，除了代码展示的部分。

**题外话：W3C、ECMAScript 以及 MDN 这些关系是什么？**

> w3c 是⼀个⾮标准化的组织，最重要的⼯作是发展 Web 规范

这些规范描述了 Web 的通信协议（⽐如 HTML 和 XHTML）和其他的构建模块。 平时我们接触到的标准，⽐如：超⽂本标记语⾔、HTML5 规范、事件规范，我们平时接触 DOM ⼀级、⼆级规范都是该组织制定的。

标准制定后，就需要各⽅⽀持实现。得到了浏览器⼚商的⽀持，所以会有⼀致的表现。

> ECMAScript

ECMAScript 也是⼀种标准，这个标准主要⽤于标准化 JavaScript 这种语⾔的，⽐如我们平时使⽤的 es6、es7 等都是该标准的产物。该标准由 ECMA International 进⾏，TC39 委员会进⾏监
督。

在浏览器中，以 V8、JSCore、SpiderMonkey 等引擎进⾏解析。

所以，node 为什么 是 V8 引擎。

- 语法（解析规则，关键词，流程控制，对象初始化，等等）
- 错误处理机制（[throw](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Statements/throw)、 [try...catch](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Statements/try...catch)，以及创建⽤户定义[错误](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Error)类型的能⼒）
- 类型（布尔值，数字，字符串，函数，对象，等等）
- 全局对象。在浏览器环境中，这个全局对象就是 [window](https://developer.mozilla.org/zh-CN/docs/Web/API/Window) 对象，但是 ECMAScript 只定义那些不
- 特定于浏览器的 API（例如，[parseInt](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/parseInt)、[parseFloat](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/parseFloat)、[decodeURI](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/decodeURI)、[encodeURI](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/encodeURI)，等等）
- 基于原型的继承机制
- 内置对象和函数（[JSON](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/JSON)、[Math](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Math)、[Array.prototype](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array) ⽅法、[对象](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Object)内省（⾃检、⾃我检查，introspection）⽅法，等等）

- [Strict mode](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Strict_mode)

**[MDN](https://developer.mozilla.org/zh-CN/docs/Learn)**

MDN 全称 Mozilla Developer Network, 它和前⾯的 w3c 和 ECMAscript 不太⼀样，这个组织不是为了标准化⽽诞⽣的。在 MDN 的官⽹上的左上⻆写着 MDN web docs， 很明显这是⼀个专为开发者服务的开发⽂档。

当然，w3c 和 ECMAScript 也有对应的⽂档，但是平时开发的过程中，⼤家都⽐较习惯⽤ MDN 去查询资料，主要是 MDN 做的也太好了，有各种⽐较容易理解的使⽤说明和兼容性说明等。

**[MSDN](https://msdn.itellyou.cn/)**
全称为 microsoft developer network， 开发在 IE 浏览器上运⾏的程序需要参考的⽂档。鉴于平时 IE ⽀持到 11 后，很多属性都已经标准化了，所以平时⽤的⽐较少。

<b id="navigator">Navigator</b>

- appCodeName 返回浏览器的代码名
- appName 返回浏览器的名称 -- Netscape
- appVersion 返回浏览器的平台和版本信息
- cookieEnabled 返回指明浏览器中是否启⽤ cookie 的布尔值
- platform 返回运⾏浏览器的操作系统平台
- userAgent 返回由客户机发送服务器的 user-agent 头部的值
- onLine 判断浏览器是否在线
- connection ⾃动检测⽹络状况切换清晰度

<b id="location">Location</b>

> location 的属性

| 属性     | 描述                               | 例子                               |
| -------- | ---------------------------------- | ---------------------------------- |
| hash     | 获取锚点，简单来说就是 url 的#后边 | #detail?a=1                        |
| host     | url 的端⼝ + 端⼝                  | www.baidu.com:8080                 |
| hostname | 主机路径                           | www.baidu.com                      |
| href     | 完整 url                           | www.baidu.com?a=1                  |
| pathname | 返回当前 URL 的路径部分            | /index.html                        |
| port     | 端⼝                               | 8080                               |
| protocol | 协议                               | http 或 htttps，包括：号           |
| search   | 协议                               | 获取参数，简单来说就是 url 的?后边 |
| origin   | 协议、主机名、端⼝                 | 只有它是只读的，其余均可写。       |

> location 方法

| 方法    | 描述                                             |
| ------- | ------------------------------------------------ |
| assign  | 加载新的⽂档                                     |
| reload  | 重新刷新⻚⾯相当于刷新按钮                       |
| replace | ⽤新的⽂档替换当前⽂档移动设备检测时的⽴刻跳转。 |

<b id="screen">Screen</b>
屏幕相关的属性

| 属性        | 说明                                     |
| ----------- | ---------------------------------------- |
| availHeight | 返回屏幕的⾼度（不包括 Windows 任务栏）  |
| availWidth  | 返回屏幕的宽度（不包括 Windows 任务栏）  |
| colorDepth  | 返回⽬标设备或缓冲器上的调⾊板的⽐特深度 |
| height      | 返回屏幕的总⾼度                         |
| pixelDepth  | 返回屏幕的颜⾊分辨率（每象素的位数）     |
| width       | 返回屏幕的总宽度                         |

> **浏览器的各种宽度、⾼度总结**
>
> **screen.width/height** >**screen.availWidth/availHeight** >**浏览器的视⼝宽⾼ -window.innerWidth/Height**
> window.innerWidth 和 window.innerHeight 是只读属性，⽆默认值。
> **浏览器的窗⼝宽⾼ - window.outerWidth/Height**
> 较于前者，⼀般情况下多了滚动条
> **Element.clientWidth、Element.clientHeight** > <span style="background:rgba(0,0,0,0.1) ">document.documentElement.clientWidth</span>
> width + padding
> **Element.offsetWidth、Element.offsetHeight**
> width + padding + border
> **Element.scrollWidth、ELement.scrollHeight**
> width + padding + 视⼝之外的宽度

<b id="history">History</b>
|属性|说明|
|---|---|
|back| 返回上⼀⻚|
|forward| 返回下⼀⻚|
|go| 加载 history 列表中的某个具体⻚⾯|
|push| ⻚⾯不刷新，不触发 onPopState 事件|
|replace| ⻚⾯不刷新，不触发 onPopState 事件|

<b id="window">Window</b>

| 方法               | 说明             |
| ------------------ | ---------------- |
| prompt             |
| alert              |
| confirm            |
| close              |
| open               |
| setTimeout         |
| setInterval        |
| encodeURI          |
| encodeURIComponent |
| decodeURI          |
| decodeURIComponent |
| devicePixelRatio   | 物理、逻辑像素⽐ |
