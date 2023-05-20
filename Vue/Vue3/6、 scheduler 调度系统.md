# 深入 scheduler 调度系统的实现机制

经过了 computed 的代码和 watch 的代码之后，其实我们可以发现，在这两块代码中都包含了同样的一个概念那就是：调度器 scheduler。完整的来说，我们应该叫它：调度系统

整个调度系统其实包含两部分实现：

1.lazy：懒执行

懒执行相对比较简单，我们来看 packages/reactivity/src/effect.ts 中第 183-185 行的代码：

```javascript
if (!options || !options.lazy) {
	_effect.run();
}
```

这段代码比较简单，其实就是如果存在 options.lazy 则不立即执行。run 函数。

2.scheduler：调度器
