# Vue3

vue 3 在代码结构上将许多功能进行分包处理， 尤其是在响应式这一块用 Proxy 进行了重构。Vue 3 代码打包大小减少 41%， 初次渲染快 55%， 更新快 133%， 内存使用减少 54%， 这得益于重写 虚拟 dom 模块和对 TreeShaking 的优化。

Vue2 这样写在一定程度上修改了 Vue 对象的全局状态。

第一，在单元测试中，全局配置非常容易污染全局环境，用户需要在每次 case 之间，保存和恢复配置。有一些 api （vue use vue mixin）甚至没有方法恢复配置，这就让一些插件的测试非常的困难。
第二，在不同的 APP 中，如果想共享一份有不同配置的 vue 对象，也变得非常困难。

```js
import Vue from "vue";
import App from "./App.vue";

Vue.config.ignoredElements = [/^app-/];
Vue.use(/* ... */);
Vue.mixin(/* ... */);
Vue.component(/* ... */);
Vue.directive(/* ... */);

Vue.prototype.customProperty = () => {};

new Vue({
	render: (h) => h(App),
}).$mount("#app");
```

Vue3

```js
import { createApp } from "vue";
import App from "./App.vue";

const app = createApp(App);
// 这个时候 app 就是一个 App 的实例，现在再设置任何的配置是在不同的 app 实例上面的，不会像vue2 一样发生任何的冲突。

app.config.isCustomElement = (tag) => tag.startsWith("app-");
app.use(/* ... */);
app.mixin(/* ... */);
app.component(/* ... */);
app.directive(/* ... */);

app.config.globalProperties.customProperty = () => {};

// 当配置结束以后，我们再把 App 使用 mount 方法挂载到固定的 DOM 的节点上。
app.mount(App, "#app");
```
