# watch

watch 的实现和 computed 有一些相似的地方，但是作用却与 computed 大有不同。watch 可以监听响应式数据的变化，从而触发指定的函数

总结

到目前为止，整个 watch 的逻辑就已经全部理完了。整体氛围了四大块：

    1.watch 函数本身
    2. reactive 的 setter
    3. flushJobs
    4. job

整个 watch 还是比较复杂的，主要是因为 vue 在内部进行了很多的兼容性处理，使代码的复杂度上升了好几个台阶，我们自己去实现的时候会简单很多的。
