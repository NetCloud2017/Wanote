### 生命周期的实现思路是怎么实现的？

### $nextTick 的详解

### computed 和 watch

不同点： 1.入和出
computed：多入单出-多个值变化，组成一个值变化
watch：单入多出-单个值的变化，进而影响一系列的状态变更
2．性能
computed：会自动 diff 依赖，若依赖没有变化，会高聪缓存中读取当前计算值
watch：无论监听值变化与否，都会执行回调 3.写法上
computed:比如有 return
watch：不一定 4.时机上
computed：从首次生成赋值，就开始计算
watch:首次不会运行的,immediate:true

### v-if 和 v-show & v-for

面试：v-if 和 v-show
相同点： 1.都能控制节点展示与否
不同点：
v-if 无实际 dom=>性能优化
v-show 有 dom 只是不展示 ####循环
面试：v-for 和 v-if 优先级

<!--eslint禁止-->

vue2.x-在同一个元素上同时使用，v-for 会优先作用
vue3.x-v-if 总是优先与 v-for
面试：key 的作用 1.模板编译原理 — template =>s
M3

<!-- eslint禁止-->

vue2.x-在同一个元素上同时使用，v-for 会优先作用
vue3.x-v-if 总是优先与 v-for
面试：key 的作用 1.模板编译原理 — template
=>正则匹配语法-AST：静态+动态=>转换 AST 为可执行方法=>render(）=>dom 2. dom diff
123456
654721
T
层级：只考虑单层复用，多层级遍历实现
顺序：双向指针，首尾向中间移动
替换：移动、新增、删除；优先复用-key =>快速识别顺序
