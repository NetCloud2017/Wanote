loader 的执行循序是从下到上， 或从右到左。

自定义 loader；

//判断当前模块是否为主模块，如果为主模块，则运行以下代码
//用来对 Loader 进行单独测试
if (require.main === module){

即 node index.js ， 这个 index.js 就是一个主模块。

内联调用 loader

`import 'style-loader!css-loader!./index.css'`
