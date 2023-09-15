Editorconfig 文件

[vscode editorConfig ](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)

[editorconfig 使用](https://blog.csdn.net/Gabriel_wei/article/details/90286668)

[代码格式化](https://zhuanlan.zhihu.com/p/366141969)

```json
{
	"editor.wordWrapColumn": 80,
	"workbench.colorTheme": "Solarized Dark",
	"[html]": {
		"editor.defaultFormatter": "esbenp.prettier-vscode"
	},
	"[dart]": {
		"editor.formatOnSave": false,
		"editor.formatOnType": true,
		"editor.rulers": [80],
		"editor.selectionHighlight": false,
		"editor.suggest.snippetsPreventQuickSuggestions": false,
		"editor.suggestSelection": "first",
		"editor.tabCompletion": "onlySnippets",
		"editor.wordBasedSuggestions": false
	},

	"terminal.integrated.profiles.windows": {
		"bash": {
			"path": "D:\\appProgram\\git\\Git\\bin\\bash.exe"
		}
	},
	"terminal.integrated.defaultProfile.windows": "bash",
	"editor.fontSize": 17,
	"vim.easymotion": true,
	"vim.incsearch": true,
	"vim.useSystemClipboard": true,
	"vim.useCtrlKeys": true,
	"vim.hlsearch": true,
	"vim.insertModeKeyBindings": [
		{
			"before": ["j", "j"],
			"after": ["<Esc>"]
		}
	],
	"vim.normalModeKeyBindingsNonRecursive": [
		{
			"before": ["<leader>", "d"],
			"after": ["d", "d"]
		},
		{
			"before": ["<C-n>"],
			"commands": [":nohl"]
		}
	],
	"vim.leader": "<space>",
	"vim.handleKeys": {
		"<C-a>": false,
		"<C-f>": false
	},
	"[javascript]": {
		"editor.defaultFormatter": "esbenp.prettier-vscode"
	},
	"[json]": {
		"editor.defaultFormatter": "esbenp.prettier-vscode"
	},
	"[vue]": {
		"editor.defaultFormatter": "esbenp.prettier-vscode"
	},
	"[css]": {
		"editor.defaultFormatter": "esbenp.prettier-vscode"
	},
	"editor.codeActionsOnSave": {
		"source.fixAll": true
	},
	"tabnine.experimentalAutoImports": true,
	"javascript.updateImportsOnFileMove.enabled": "always",
	"[typescript]": {
		"editor.defaultFormatter": "esbenp.prettier-vscode"
	},
	"git.confirmSync": false,
	"[javascriptreact]": {
		"editor.defaultFormatter": "esbenp.prettier-vscode"
	},
	"[markdown]": {
		"editor.defaultFormatter": "esbenp.prettier-vscode",
		"editor.quickSuggestions": {
			"other": "on",
			"comments": "off",
			"strings": "off"
		}
	},
	"workbench.sideBar.location": "right",
	"[jsonc]": {
		"editor.defaultFormatter": "esbenp.prettier-vscode"
	},
	"eslint.format.enable": true,
	"editor.defaultFormatter": "esbenp.prettier-vscode",
	"editor.formatOnSave": true,
	"workbench.iconTheme": "vscode-icons",
	"editor.suggest.snippetsPreventQuickSuggestions": false,
	"[python]": {
		"editor.formatOnType": true
	},
	"vsicons.dontShowNewVersionMessage": true
}
```
