# 垂直水平居中

```html
<div class="main">
	<div class="content">hello world</div>
</div>
```

默认样式

```CSS
.main {
    border: 1px solid red;
    width: 300px;
    height: 300px;
}

.content {
    background: green;
    width: 100px;
    height: 100px;
}

```

1、绝对定位 + 位移

```CSS
/* 定位代码 */
.mian {
    position: relative;
}
.content {
    position: absolute;;
    top: 50%;
    left: 50%;
    margin-left: -50px;
    margin-top: -50px;
}
```

2、绝对定位 + margin auto;

```CSS
.main {
    position: relative;
}
.content {
    position: absolute;;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    margin: auto;
}

```

3、lineheight + margin auto

```CSS
.main {
    line-height: 300px;
    text-align: center;
    font-size: 0px;
}
.content {
    font-size: 16px;
    display: inline-block;
    vertical-align: middle;
    line-height: initial;
    text-align: left; /* 修正文字 */
}

```

4、 flex 布局

```CSS
.main {
    display: flex;
    justify-content: center;
    align-items: center;
}

```

5、grid 布局

```CSS
.wp {
    display: grid;
}
.box {
    align-self: center;
    justify-self: center;
}

```
