# JavaScript AST

我们知道从 AST 转化为 JavaScript AST 本质上是一个对象结构的变化，变化的本质是为了后面更方便的解析对象，生成 render 函数。

在转化的过程中，我们需要遵循如下策略：

    1.深度优先: 从最底层的节点开始从下向上解析。
    2.转化函数分离： 不同的节点用不同的方式处理。
    3.上下文对象: createTransformContext 生成 context 对象。

transform 方法是 transform.ts 文件里的。 他的核心是 traverseNode 方法 。

```TS
// 遍历转化对应的节点

export function traverseNode(
  node: RootNode | TemplateChildNode,
  context: TransformContext
) {
  context.currentNode = node
  // apply transform plugins
  const { nodeTransforms } = context
  const exitFns = []

//    将所有处理 节点的方法保存到 exitFns 里面
  for (let i = 0; i < nodeTransforms.length; i++) {
    const onExit = nodeTransforms[i](node, context)
    if (onExit) {
      if (isArray(onExit)) {
        exitFns.push(...onExit)
      } else {
        exitFns.push(onExit)
      }
    }
    if (!context.currentNode) {
      // node was removed
      return
    } else {
      // node may have been replaced
      node = context.currentNode
    }
  }


// 2.  接着处理所有的子节点。
  switch (node.type) {
    case NodeTypes.COMMENT:
      if (!context.ssr) {
        // inject import for the Comment symbol, which is needed for creating
        // comment nodes with `createVNode`
        context.helper(CREATE_COMMENT)
      }
      break
    case NodeTypes.INTERPOLATION:
      // no need to traverse, but we need to inject toString helper
      if (!context.ssr) {
        context.helper(TO_DISPLAY_STRING)
      }
      break

    // for container types, further traverse downwards
    case NodeTypes.IF:
      for (let i = 0; i < node.branches.length; i++) {
        traverseNode(node.branches[i], context)
      }
      break
    case NodeTypes.IF_BRANCH:
    case NodeTypes.FOR:
    case NodeTypes.ELEMENT:
    case NodeTypes.ROOT:
        // 循环处理 子节点
      traverseChildren(node, context)
      break
  }

  // exit transforms
  // 3。 最后执行保存在 exitFns 里的函数。
  context.currentNode = node
  let i = exitFns.length
  while (i--) {
    exitFns[i]()
  }
}


```

transformText 的作用是将相邻的 花括号表达式和普通文本合并成一个表达式 。
transformElement

遍历转化节点，转化的过程一定要是深度优先的（即：孙->子->父），因为当前节点的
状态往往需要根据子节点的情况来确定。

转化的过程分为两个阶段： 1.进入阶段：存储所有节点的转化函数到 exitFns 中 2.退出阶段：执行 exitFns 中缓存的转化函数，且一定是倒叙的。因为只有这样才能保证整个处理过程是深度优先的
