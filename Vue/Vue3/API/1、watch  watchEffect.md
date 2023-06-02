```javascript
import { watch, watchEffect } from "vue";

watch(
	() => reactiveData,
	(newVal, oldVal) => {
		console.log(newVal, oldVal);
	}
);

watchEffect(() => {
	console.log(reactiveData);
});
```

watch 可以监听某个数据的变化，可以有新旧值。

watchEffect 可以自动的识别里面使用了那些响应式数据， 数据更新后这个回调就执行。但是不能拿到 oldVal
