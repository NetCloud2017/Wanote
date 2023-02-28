```json
{
	"compilerOptions": {
		"target": "es2020", // 指定 TS 编译成 JS 后的js版本
		"module": "commonjs", // TS 编译成 JS 后采用的模块规范 commonjs amd cmd  es等
		"lib": [
			// lib  用于 添加额外的编译库。
			"DOM", // 对浏览器dom 操作的库, 当代码有document 之类的就用它。
			"ES2020" // 编译新语法的库
		] /*  指定 TS 编码期间可以使用的库文件版本 比如：ES5就不支持Set集合 */,
		"outDir": "./dist", //     指定 TS 文件编译成 JS 后的输出目录                 /* Redirect output structure to the directory. */
		"rootDir": "./src", // 指定 TS 文件源码目录
		"strict": true, // 启用严格检查模式
		"strictNullChecks": false, // null 和 undefined即是值，也是类型, null 和 undefined 值 只能赋值给 any ,unknown和它们各自的类型
		"noImplicitAny": true, // 一般是指表达式或函数参数上有隐含的 any类型时报错
		"experimentalDecorators": true /* 启用ES7装饰器实验开启选项 */,
		"emitDecoratorMetadata": true /* 启用装饰器元数据开启选项 */,
		"declaration": true, // 指定 TS 文件编译后生成相应的.d.ts文件
		"removeComments": false, // TS 文件编译后删除所有的注释

		"baseUrl": "src" /* 工作根目录  解析非相对模块的基地址*/,
		"paths": {
			"@/datatype/*": ["datatype/*"],
			"@/131/*": ["131/*"],
			"@/132/*": ["132/*"]
		},
		// 有些依赖库底层 为了兼容CommonJs规范、AMD规范这二者的规范中相互兼容，
		// 使用了 export =，将二者规范统一。
		// "esModuleInterop":true表示允许依赖库中出现export = 这种兼容规范导出的格式，
		//  TS 可以用import from导入
		"esModuleInterop": true
	},
	"include": [
		// ** 表示所有层级的文件夹
		// 需要编译的ts文件一个*表示文件匹配**表示忽略文件的深度问题
		"./src/**/*.ts", // 匹配src下所有的ts文件
		"src/datatype/typepsenumts"
	],
	"exclude": ["./src/**/test", "./src/**/premit"]
}
```
