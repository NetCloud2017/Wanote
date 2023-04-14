# commander

处理脚手架命令的工具库。它支持的数据布尔值（Boolean）和 字符串（string） [commander 地址](https://www.npmjs.com/package/semver)

## 安装和导入

    npm i commander -D
    // or
    yarn add commander --dev

```javascript
const { program, Command } = require("commander");

// program 也是Command 的实例。
const programInstance = new Command();
```

```
// ccli 是主命令
// program.name("ccli").description("cli name").version("0.1.0");
```

## option

```js
program
	.option("--first") // 一般选项；值都是 字符串或者布尔值
	.option("-a, --age") // 简写和全写
	.option("-s, --separator <char>") // 必填产生 <char>
	.option("-n, --name [char]"); // 选填参数 [char]

program.parse();

// const options = program.opts();
// const limit = options.first ? 1 : undefined;
// ccli aaa/bbb/ccc --first -s '/' (错误) : 还是用 | 号 吧 这个 / 号在win 系统 会别解析到git安装的根目录；
//  ccli -s '|' --first "aaa|bbb|ccc" (正确)
// console.log(program.args[0].split(options.separator, limit), program.args); // splite 新用法。
// console.log(options, "command options");

// 创建子命令
// version 2
const { Command, Option } = require("commander");
const programInstance = new Command();

// commander 自动给每一个命令生成对应的文档，还有命令输入错误时的，模糊匹配提示。
programInstance.name("ccli").description("cli name").version("0.1.0");
programInstance
	.command("split") // 子命令
	.description("split  string to array")
	.argument("<string>", "string  to split") // 子命令的参数
	.option("--first") // 子命令的选项
	.option("-s, --separator <char>", "separator char", "|") // "|" 是 option 默认值
	.action((arg, options, cmd) => {
		console.log(arg, options, "uuus"); // arg 就是 <string>, options 就是对应的 optinos。

		// action 里获取全局对象
		// 1
		let a = programInstance.getOptionValue("a");
		console.log(a, "a");
		// 2
		let globalOptions = programInstance.commands[0].optsWithGlobals();
		console.log(globalOptions);
		// 3
		console.log(cmd.opts());
		console.log(cmd.optsWithGlobals());
	});

// options的四种用法
// 不能只获取全局options 需要带上一个子命令；//  ccli split 111 -a a
programInstance
	.option("-a <char>") // 全局 的option
	.option("-a<char>")
	.option("--age=<char>")
	.option("--age <char>");

// options 连写
//  ccli split 111 -a a -dg

// 注意带参数的option 的连写问题， 一般将带参数的option 放到最后， 否则他会把后面的当成自己的参数。
//  ccli split 111 -dag 把 g 当成自己的参数了。

// 全局 options
programInstance
	.option("-d --debug", "debugging")
	.option("-g --global", "global")
	.hook("preAction", function (thisCommand, actionCommand) {
		// 这个 preAction 的执行时间比 子命令的还要早
		console.log(4);
		// 这个 thisCommand 就是 programInstance, actonCommand 是执行当前某个子命令的 command 实例
		console.log(
			thisCommand === programInstance,
			actionCommand.opts(),
			"global action hook"
		);
	})
	.hook("postAction", function (thisCommand, actionCommand) {
		// 这个 postAction 的执行时间比 子命令的还要晚
		console.log(5);
	});

programInstance
	.command("create")
	.description("creata  project")
	.argument("<char>", "create arg")
	.requiredOption("-t, --ttt <char>", "template") // 必须的 options，注意，加了默认值就没效了。不能加默认值
	.option("-a, --add", "add number")

	.option("-l, --letters <char...>", "specify letters")
	// 注意与命令的 arguments 问题 用 -- 隔开参数例如:
	// ccli create  -d -t u77 -l a b c 777 报错 没有 arguments
	// ccli create  -d -t u77 -l a b c -- 777

	.action((arg, options) => {
		console.log(arg, options, "create command");
	});

programInstance
	.command("test")
	.addOption(new Option("-s, --select", "select, something").hideHelp()) // 隐藏 选项
	.addOption(
		new Option("-t, --timeout <delay>", "timeout seconds").default(
			60,
			"one minute"
		)
	) // 默认值 和默认值提示
	.addOption(
		new Option("-c --choice <choice>", "your choice").choices([
			"small",
			"medium",
			"large",
		])
	) // 选项功能
	.addOption(new Option("-p --port <number>", "port number").env("PORT")) // env 通过环境变量获取值当作 port 的值。
	//  PORT=80 ccli test -t 11 -s 环境变量需要写到前面。否则无效。
	.addOption(
		new Option("--donate [amount]", "donation in dollars")
			.preset("66") // 预设值
			.argParser(parseFloat) // 参数处理 成数字
	)
	.addOption(new Option("--disable-server", "disable server").conflicts("port")) // 注明和那个选项冲突，只能有其中一个。
	.addOption(
		new Option("-a, --add", "add  option").conflicts(["port", "choice"])
	) // 和多个选项冲突。
	.action((options, cmd) => {
		console.log(options, cmd.optsWithGlobals());
	});

// 自定义 option
const commander = require("commander");

function parseMyInt(value) {
	const intValue = parseInt(value, 10);
	if (isNaN(intValue)) {
		throw new commander.InvalidOptionArgumentError("not a  int Number");
	}
	return intValue;
}
function collect(value, previous) {
	return previous.concat([value]);
}
function list(value) {
	return value.split(" ");
}
programInstance
	.command("custom")
	.option("-i, integer <number>", "input number", parseMyInt)
	.option("-l, --list <item>", "list", list) // 参数收集 1  ccli custom -l 'a b c'
	.option("-c, --collect <value>", "collect", collect, []) // 参数收集 2  ccli custom -c a -c b -c c
	.action((arg, option) => {
		console.log(arg, "sss");
	});

programInstance
	//   .command("login <username> [password]", { hidden: false, isDefault: true }) // hidden 是否隐藏命令，isDefault 不写子命令时默认时这个命令。

	// argument 方式定义参数
	.command("login", { hidden: false, isDefault: true })
	//   .argument("<username>", "username to login")
	//   .argument("[password]", "password to login", "no password") // 参数默认值
	//   .argument("<dir...>", "rest arguments") // ccli  login name  a b c  分开时数组

	// arguments 方式添加参数
	.arguments("<username> [password]")

	// 通过构造函数添加参数。
	//   .addArgument(
	//     new commander.Argument("username", "username to login")
	//       .argRequired() // 必填参数 argRequired  就算是[] 也要 填。
	//       .choices(["sam", "niko"]) // 选项功能
	//   )
	//   .addArgument(
	//     new commander.Argument("password", "password to login")
	//       .argOptional()
	//       .default("12353", "default password") // 默认值
	//       .argParser(parseMyInt) // 参数处理
	//   )
	.option("-f, --force", "force login")
	//   .action((username, password, options) => {
	//   .action((username, password, dir, options) => {

	// 子命令参数， 不管写不写都会独占这两个参数位。
	// console.log(username, password, options);
	//   });

	.action(function (username, password, optinos) {
		// this 就是 zhege command 实例
		console.log(1, this.args[0], this.args[1], this.opts());
	})

	// hook

	// 在 action 执行前执行
	.hook("preAction", function (thisCommand, actionCommand) {
		console.log(2, thisCommand === actionCommand);
	})
	// 在 action 执行后执行
	.hook("postAction", function (thisCommand, actionCommand) {
		console.log(thisCommand === actionCommand, 3);
	});
programInstance.parse();

const globalOptions = programInstance.optsWithGlobals(); // 获取全局 option
console.log(globalOptions, "uuu");
```
