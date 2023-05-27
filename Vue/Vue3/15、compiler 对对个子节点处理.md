# 多层级的模板处理

也就是在 codegen.ts 里的 genNode 里的 switch 对 node 节点为 element 的进行 递归处理。

```javascript
case NodeTypes.ELEMENT:
genNode(node.codegenNode, context)
break

```
