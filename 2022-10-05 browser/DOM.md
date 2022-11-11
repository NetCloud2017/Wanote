### dom Events

[常用事件](#event)
[浏览器事件机制](#eventMechanism)

#### 事件级别

**dom 级别 0**
DOM 级别 0 不是 W3C 规范。⽽仅仅是对在 Netscape Navigator 3.0 和 Microsoft Internet
Explorer 3.0 中的等价功能性的⼀种定义。

```JS
document.querySelector('button').onclick = clickFn1
<div onclick="clickFn()">点击⼀下</div>
```

**dom 级别 1**
DOM 级别 1 专注于 HTML 和 XML ⽂档模型。它含有⽂档导航和处理功能。

**dom 级别 2**
DOM 级别 2 对 DOM 级别 1 添加了样式表对象模型，并定义了操作附于⽂档之上的样式信息的功能
性。 DOM 级别 2 同时还定义了⼀个事件模型（Events，规定了访问⽂档事件的 API），并提供了对
XML 命名空间的⽀持。

```JS
document.querySelector('button').addEventListener('click',clickBtn);
```

**dom 级别 3**
DOM Level 3 规定了内容模型 (DTD 和 Schemas) 和⽂档验证。同时规定了⽂档加载和保存、⽂档查看、⽂档格式化和关键事件。

<b id="event">常用事件</b>

**鼠标事件:**

- click：当⽤户点击某个对象时， 注意移动端上上有延迟。
- contextmenu：当⽤户点击⿏标右键打开上下⽂菜单时
- dbclick：当⽤户双击某个对象时
- mousedown：当⿏标按钮被按下
- mouseenter：当⿏标指针移动到元素上时
- mouseleave：当⿏标指针移出元素时
- mousemove：当⿏标被移动时
- mouseover：当⿏标移动到某元素上时
- mouseout：当⿏标从元素移开
- mouseup：当⿏标按键被松开

**键盘事件：**

- keydown：某个键盘按键被按下
- keypress：某个键盘按键被按下并松开
- keyup：某个键盘按键被松开

**框架/对象事件(全局事件)：**

- abort：图像的加载被中断
- beforeunload：在即将离开⻚⾯（刷新或关闭）时触发
- error：在加载⽂档或图像时发⽣错误
- hashchange：该事件在当前 URL 的锚部分发⽣修改时触发
- load：⼀张⻚⾯或⼀副图像加载完成
- pageshow：在⽤户访问⻚⾯时触发
- pagehide：在⽤户离开当前⽹⻚跳转到另外⼀个⻚⾯时触发
- resize：窗⼝或框架被重新调整⼤⼩
- scroll：当⽂档被滚动时
- unload：⽤户退出⻚⾯

**表单事件**

- blur：元素失去焦点
- change：表单元素的内容发⽣改变时
- focus：元素获取焦点时
- focusin：元素即将获取焦点时
- focusout：元素即将失去焦点时
- input：获取⽤户输⼊时
- reset：表单重置时
- search：⽤户向搜索域输⼊⽂本时
- select：⽤户选取⽂本时
- submit：表单提交时

**剪切板事件**

- copy：⽤户拷⻉元素内容时
- cut：在⽤户剪切元素内容时
- paste：在⽤户粘贴元素内容时

**打印事件**

- afterprint：在⻚⾯已经开始打印，或者打印窗⼝已经关闭时触发
- beforeprint：在⻚⾯即将开始打印时触发

**拖动事件**

- drag：元素正在拖动时触发
- dragend：⽤户完成元素的拖动时触发
- dragenter：拖动的元素进⼊放置⽬标时触发
- deragleave：在拖动元素离开放置⽬标时触发
- dragover：在拖动元素在放置⽬标上时触发
- dragstart：在⽤户开始拖动元素时触发
- drop：在拖动元素放置在⽬标区域时触发

<b id="eventMechanism">事件的捕获与冒泡(浏览器事件流机制)</b>

addEventListener 的第三个参数, 如果为 true，就是代表在捕获阶段执⾏。如果为 false，就是在冒泡阶段
进⾏, 默认值是 false。
