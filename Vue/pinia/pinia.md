# [Pinia](https://pinia.vuejs.org/zh/)

## 使用 pinia , 定义 store

`npm  i pinia`

```js
// app.vue
<script lang="ts">
import { defineComponent } from "vue";
import { useUserStore, useCounter } from "./store.ts";
import { storeToRefs } from "pinia";
// storeToRefs 可以使解构后的数据依然具有响应式
export default defineComponent({
	setup() {
		const { age, name, monAge } = storeToRefs(useUserStore());

		return {
			age,
			name,
			monAge,
		};
	},
});
</script>

<template>
	<div>
		<div>{{ "hello world" }}</div>
		<div>{{ name + "/" + age }}</div>
		<div>{{ "mon age" + monAge }}</div>
	</div>
</template>
```

**方式 1**

```ts
// store.ts
import { defineStore } from "pinia";

export const useUserStore = defineStore("user", {
	state: () => ({ age: 18, name: "张三" }), // 必须使用函数作用和 sfc 中的 data 一样, 都是为了防止数据污染。
	getters: {
		monAge(state) {
			console.log(13, state);
			return state.age + 25;
		},
	},
});
```

**方式 2**

```ts
// count.ts
import { ref, computed } from "vue";
export const useCounter = defineStore("count", () => {
	let count = ref(1);

	let dubCount = computed(() => {
		return count.value * 2;
	});
	function add() {
		count.value++;
	}
	return {
		dubCount,
		count,
		add,
	};
});
```

## state 操作

```js
// app.vue
<script lang="ts">
import { defineComponent } from "vue";
import { useUserStore, useCounter } from "./store.ts";
import { storeToRefs } from "pinia";
// storeToRefs 可以使解构后的数据依然具有响应式
export default defineComponent({
	setup() {
		const userStore = useUserStore();

		// 方式1 直接修改
		userStore.age++;

		// 方式2 批量修改
		userStore.$patch({
			age: 1,
			name: "阿三",
		});

		// 方式三
		userStore.$patch((state) => {
			state.age = 20;
			state.name = "张三爹";
		});

		// 方式4 就是在 store 中的 actions 里的方法去修改了

		return {
			age,
			name,
			monAge,
		};
	},
});
</script>

<template>
	<div>
		<div>{{ "hello world" }}</div>
		<div>{{ name + "/" + age }}</div>
		<div>{{ "mon age" + monAge }}</div>
	</div>
</template>
```

## getters 的使用

getters 使用时， 要注意不能使用箭头函数。

```js
//userStore.ts
export const useUserStore = defineStore("user", {
	state: () => ({ age: 18, name: "张三" }),
	getters: {
		// 方式 1
		// monAge(state) {
		// 	return state.age + 25;
		// },

		// 方式2
		monAge() {
			// this 指向的是 这个store
			return this.age + 25;
		},

		// 访问其他 getters
		anotherAge() {
			return this.monAge + 1;
		},

		// 给 getters 传递参数， 但是会失去数据缓存的作用
		pramasAge(state) {
			return (data) => {
				return this.age + data;
			};
		},

		// 使用 其他 store 的getters
		addCountAge(state) {
			const countStore = useCounter();
			return this.age + countStore.count;
		},
	},
});
```

```ts
<script setup lang="ts">
import { defineComponent } from 'vue'
import { useUserStore } from '../store/index'
const userStore =  useUserStore()

</script>

<template>
  <div>
    <div>{{userStore.monAge}}</div>
    <div>{{userStore.anotherAge}}</div>
    <div>{{userStore.pramasAge(10)}}</div>

  </div>
</template>

```

## actions 使用

actions 里面也是不能使用 箭头函数的， 因为里面也是需要使用 指向 store 的这个 this 。

actions 与 getters 不同的是它支持返回值类型推断和内部还支持 async/ await 异步操作。

```js
// store.ts
import { defineStore } from "pinia";

export const useUserStore = defineStore("user", {
	state: () => ({ age: 18, name: "张三" }),
	actions: {
		addAge(data) {
			this.age += 1;
		},
		// 异步操作
		async asyncActionAPI() {
			let res = await API("http:xxxxx");
		},
	},
});
```

```ts
<script setup lang="ts">
    import { useUserStore } from '../store/index'
    const {addAge} =  useUserStore()
</script>

<template>
  <div>
    <button @click="addAge">点击</button>
  </div>
</template>

```
