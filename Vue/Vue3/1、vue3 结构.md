# Vue 3 整体结构

Vue3 是一个 monorepo 项目,

整体分为两个部分。 一个时运行时 一个时编译时。
<img src='./img/vue-map.png'/>

@vue/compiler-sfc:

把 SFC 转换成一个浏览器可以执行的 js 文件。

@vue/compiler-dom & @vue/compiler-core :

他们之间配合使用将 template 转换成一个 render 函数。
