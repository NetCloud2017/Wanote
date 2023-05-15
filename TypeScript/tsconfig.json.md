# TS configuration

[config options](https://www.typescriptlang.org/zh/tsconfig)

```json
{
	"compilerOptions": {
		"incremental": true /* Enable incremental compilation 增量编译， 没改动过的文件就不会重新编译*/,

		"target": "es2020", // 指定 TS 编译成 JS 后的js版本
		"module": "commonjs", // TS 编译成 JS 后采用的模块规范 commonjs amd cmd  es等
		"lib": [
			// lib  用于 添加额外的编译库。
			"DOM", // 对浏览器dom 操作的库, 当代码有document 之类的就用它。
			"ES2020" // 编译新语法的库
		] /*  指定 TS 编码期间可以使用的库文件版本 比如：ES5就不支持Set集合 */,
		"allowJs": true, // 允许 js 在 TS  文件中被编译。 ts 中 使用 js文件。
		"outDir": "./dist", //     指定 TS 文件编译成 JS 后的输出目录                 /* Redirect output structure to the directory. */
		"rootDir": "./src", // 指定 TS 文件源码目录

		//指定类型脚本如何从给定的模块说明符查找文件。
		"moduleResolution": "node",
		// https://www.typescriptlang.org/tsconfig#esModuleInterop
		"esModuleInterop": true,

		"strict": true, // 启用严格检查模式
		"strictNullChecks": false, // null 和 undefined即是值，也是类型, null 和 undefined 值 只能赋值给 any ,unknown和它们各自的类型
		"noImplicitAny": true, // 一般是指表达式或函数参数上有隐含的 any类型时报错

		//允许未读取局部变量
		"noUnusedLocals": false,
		//允许未读取的参数
		"noUnusedParameters": false,
		//允许解析 json
		"resolveJsonModule": true,
		//支持语法迭代：https://www.typescriptlang.org/tsconfig#downlevelIteration
		"downlevelIteration": true,

		"experimentalDecorators": true /* 启用ES7装饰器实验开启选项 */,
		"emitDecoratorMetadata": true /* 启用装饰器元数据开启选项 */,
		"declaration": true, // 指定 TS 文件编译后生成相应的.d.ts文件
		"removeComments": false, // TS 文件编译后删除所有的注释

		"baseUrl": "src" /* 工作根目录  解析非相对模块的基地址 ， "." 表示根目录 */,
		"paths": {
			// 路径映射
			"@/datatype/*": ["datatype/*"], // 代表 datatype文件夹下面的所有目录
			// 引入时用 from '@/datatype/module' 这样就会引入 module 目录下的 index 文件了g
			"@/131/*": ["131/*"],
			"@/132/*": ["132/*"]
		},
		// 有些依赖库底层 为了兼容CommonJs规范、AMD规范这二者的规范中相互兼     容，
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

直接运行 tsc 会参考项目中的 tsconfig 配置文件， 如果运行`tsc index.ts` 他就不会参考配置文件
