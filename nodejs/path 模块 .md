# path

使用这个模块之前可以有必要先认识下[绝对路径和相对路径](https://github.com/NetCloud2017/Wanote/blob/main/2%E3%80%81HTML%20%E3%80%81CSS/%E7%BB%9D%E5%AF%B9%E8%B7%AF%E5%BE%84%E5%92%8C%E7%9B%B8%E5%AF%B9%E8%B7%AF%E5%BE%84.md)

常与这个模块使用的环境变量有：

1. `__dirname`: 当前文件所在的目录位置，
2. `__filename`: 当前文件的在本地的绝对路径

## path.join(...<string>)

多个参数，每个参数都是 string , 将每个参数合并在一起

```js
path.join("/foo", "bar", "baz/asdf", "quux", ".."); // '..' 表示返回上一级
// 返回: '/foo/bar/baz/asdf'
```

## path.resolve(...<string>)

`path.resolve(...<string>)` 最终返回的是一个绝对路径；给定的路径序列`从右到左处理`，每个后续的 path 会被追加到前面，一旦生成绝对路径就返回。 当处理所有的目录都没有生成绝对路径则会将 `当前工作的目录` + `处理后的目录` 作为绝对路径返回。

传入 '.' , "./" ，或不传都会被解析成当前的项目根目录。像 'app'的 string 也会解析成 绝对路径 '/app';

```js
path.resolve("/foo/bar", "./baz");
// 接拼后  /foo/bar/baz 为绝对路径， 所以返回 '/foo/bar/baz'

path.resolve("/foo", "/bar", "baz");
// 接拼到 /bar 时生成绝对路径 '/bar/baz'， 因此返回了。

// 假设工作目录为 : D:/app
path.resolve("./foo", "./bar", "./baz");
// 接拼所有路径后 './foo/bar/baz'不是绝对路径， 所以要加工作目录后返回 'D:/app/foo/bar/baz'

path.resolve("abc", "../img/avator.png");
//由于 ../ 这里返回上一级因此不用和 abc 接拼，img/avator.png 不是绝对路径，所以加 工作目录后返回： 'D:/app/img/avator.png'
```
