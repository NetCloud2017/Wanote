-- 查看 blink 当前编辑器支持那些功能命令 ：= vim.lsp.protocol.make_client_capabilities()
-- 可以设置这个capabilities (在lsp 启动时设置 blink.lua 文件)来去除冗余的lsp 返回或某些 lsp 服务的报错.
-- 就是用来告诉lsp 服务器，提供什么服务给client 端的。 
return {
	"saghen/blink.cmp",
	version = "*",
	event = "VeryLazy",
	dependencies = {
		"rafamadriz/friendly-snippets",

	},
	opts = {
		completion = {
			documentation = {
				auto_show = true,
			}
		},
		keymap = {
			preset = "super-tab"
		},
		sources = {
			default = { "path", "snippets", "lsp", "buffer"}
		},
		cmdline = {
			sources = function ()
				local cmd_type = vim.fn.getcmdtype();
				if cmd_type == "/" then
					return {"buffer"}
				end
				if cmd_type == ":" then
					-- 这个 cmdline 类型由 blink 提供
					return {"cmdline"}
				end
				return {}
			end,

			keymap = {
				preset = "super-tab"
			},
			-- 需要配置这个命令提示才生效。
			completion = {
				menu = {
					auto_show = true
				}
			}
		}

	}


}
