# render 函数生成

函数本质上就是一段字符

函数本质上就是一段字符，所以我们可以把以上函数比较一个大的字符串。

那么想要生成这样的一个大字符串，本质上就是各个小的字符串的拼接。

我们把函数分成 4 个部分：

    1.函数的前置代码：const_Vue=Vue
    2.函数名：function render
    3.函数的参数：_ctx，_cache
    4.函数体：

    const { createElementVNode: _createElementVNode } = _Vue
    return _createElementVNode("div", [], [" hello world "])

我们只需要把以上的内容拼接到一起，那么就可以得到最终的目标结果。

那么为了完成对应的拼接，我们可以提供一个 push 函数：

```javascript
function push(code) {
	context.code += code;
}
```

以此来完成对应的拼接， 最后就是对函数进行格式化处理，换行，缩进， 空格。
