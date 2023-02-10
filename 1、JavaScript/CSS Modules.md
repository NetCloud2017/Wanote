- 参考资料：

https://github.com/postcss/postcss/blob/main/docs/README-cn.md

## 设计目的

学过网页开发就会知道，CSS 不能算编程语言，只是网页样式的一种描述方法。为了让 CSS 也能适用软件工程方法，程序员想了各种办法，让它变得像一门编程语言。从最早的 Less、SASS，到后来的 PostCSS，再到最近的 CSS in JS，都是为了解决这个问题。

## 全局写法：

```css
局部样式 :local(.title) {
	color: red;
}
全局样式 :global(.title) {
	color: green;
}
```

## 指定 hash 类名

css-loader 默认的哈希算法是 [hash:base64]，这会将 .title 编译成 .\_3zyde4l1yATCOkgn-DBWEL 这样的字符串。

```css
module: {
  loaders: [
    // ...
    {
      test: /\.css$/,
      // ! ? 这写是 webpack语法 用于激活和选择 loader;
      loader: "style-loader!css-loader?modules&localIdentName=[path][name]---[local]---[hash:base64:5]"
    },
  ]
}
```

## 样式继承

```js
.className {
  background-color: blue;
}
.title {
  composes: className;
  color: red;
}
相应地， 标签的class也会编译成 如： <h1 class="_2DHwuiHWMnKTOYG45T0x34 _10B-buq6_BEOTOl9urIjf8">。

继承其他文件样式：

.title {
  composes: className from './another.css';
  color: red;

}
```

## 输入变量：

CSS Modules 支持使用变量，不过需要安装 PostCSS 和 [postcss-modules-values](https://github.com/css-modules/postcss-modules-values) 。

```css
module: {
    loaders: [
        {
            test: /\.css$/,
            loader: "style-loader!css-loader?modules!postcss-loader"
        },
    ]
}

接着，在colors.css里面定义变量。

@value blue: #0c77f8;
@value red: #ff0000;
@value green: #aaf200;


App.css可以引用这些变量。
@value colors: "./colors.css";
@value blue, red, green from colors;

.title {
  color: red;
  background-color: blue;
}


```
