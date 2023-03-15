12-3 【store 切割】公司切割 store 的设计方案有哪些不好？【加量扩展】
12-4 【getter 自动推导】Vuex 为什么不能推导 getter 方法，又如何解决呢？【加量扩展】
因为它的属性是一个 索引类型， 所以不能提示， 要提示的话可以写一个子类型。
解决：为复合路径增加可以推导的类型

# Vuex

vuex 中最重要的属性有 Store

## Store 的属性有

### 属性

#### \_moduleCollection -一模块集合对象

它的类是 ModuleCollection：封装和管理所有模块的类，类成员：
ModuleCollection 拥有的属性：
**属性**

- root: 根模块属性
- register-一注册根模块和子模块的方法【注册就是添加】
- getNameSpace——循环递归获取命名空间方法
- getChild—一获取子模块方法

ModuleWrapper：封装和管理某一个模块的类，主要成员有：

- \_modulesNamespaceMap——模块和命名空间映射
  用于防止模块重名， 需要用他来做凭证。

- dispatch -—访问 actions 异步方法的函数类型的属性
- commit -一访问 mutations 方法的函数类型的属性
- state 一一一个提供所有组件的渲染数据【指响应式数据】的对象或函数【一般为对象】
- \_state--state 响应式数据的备份

## 方法

- commit\_ --一个可以访问 mutations 对象中方法的方法
- dispatch\_-—一个可以访问 actions 对象中方法的方法
- reactiveState-—把根模块中的 state 变成响应式 state 的方法
- install——app.use(store)【store 中间件挂载到 app 上】时需要调用的方法。

useStore 函数: 一个可以把挂载到 app 的 store 对象 inject 出来【inject 就是注入，从别的地方拿到对象的意思】

createStore 函数
一个创建 store 类对象的函数
