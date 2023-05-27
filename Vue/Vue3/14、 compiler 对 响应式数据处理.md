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
