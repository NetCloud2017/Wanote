# 响应式数据处理

当我们增加了复合表达式之后，AST、JavaScript AST 和 render 函数中多出了如下内容：

```javascript
{
     // AST  多了这个表达式节点
    "type": 5, // NodeTypes.INTERPOLATION
    "content": {
    "type": 4, // NodeTypes.SIMPLE_EXPRESSION
    "isStatic": false,
    "constType": 0,
    "content": "msg",
    "loc":{}
}
```

javascript AST 多了 + 号 和表达式的内容

```javascript
// JavaScript AST
{

    "type": 8,
    "loc"：{}，
    "children": [
        {
            "type":2,
            "content": " hello ",
            "loc": {}
        }，
        "+",
        {
            "type": 5, // NodeTypes.INTERPOLATION
            "content": {
                "type": 4, // NodeTypes.SIMPLE_EXPRESSION
                "isStatic": false,
                "constType": 0,
                "content":"msg",
                "loc": {}
            },
            "loc"：{},
        }
    ]
}


```

就是在 transform 函数里面添加对 toDisplayString 的处理 , 处理逻辑在 switch 循环里添加对 插值节点（INTERPOLATION） 的处理。

render 函数
多了 toDisplayString 这些内容。

```javascript
// render
const _Vue = Vue;

return function render(_ctx, _cache) {
	with (_ctx) {
		const {
			toDisplayString: _toDisplayString,
			openBlock: _openBlock,
			createElementBlock: _createElementBlock,
		} = _Vue;

		return (
			_openBlock(),
			_createElementBlock(
				"div",
				null,
				"hello " + _toDisplayString(msg),
				1 /* TEXT */
			)
		);
	}
};
```

处理响应式数据，只要从 AST， JavaScript AST 和 render 的差异入手，我们只需要填充对应的数据差异，就可以完成最终 render 的生成。

处理表达式函数式在 parseInterpolation 这个函数里进行的。

    1.toDisplayString 方法：该方法的作用非常简单，接收一个变量，返回对应的响应性数据。比如在以上代码和测试场景中，\_toDisplayString(msg)方法的调用代表着接收 msg 变量作为参数，返回 world 字符串

    2.with (\_ctx)：由刚才的代码我们可知，在使用\_toDisplayString 时，我们用到了一个 msg 变量。但是在整个的 render 代码中却没有 msg 变量的存在。那么为什么没有抛出对应的错误呢？这是因为 With 的作用，它会改变语句的作用域链，从而找到 msg 变量。

所以根据以上两点，我们在去处理时，就需要关注以下内容：

1.在 generate 方法中，增加 with 的 push 和 toDisplayString 方法的调用

2.完成 toDisplayString 方法

3.因为 with 改变作用域，所以我们在 runtime 时，需要注意新的作用域会不会引发其他的错误。
