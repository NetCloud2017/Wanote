-- none-ls 原本是 null-ls 但由于改作者不维护这个仓库了， 后面是网友 fork 这个包重命名一下，导出还是 null-ls 。
-- none 这个包的作用是将format 仓库包成一个lsp的形式
return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	event = "VeryLazy",
	keys = {
		{
			"<leader>lf",
			vim.lsp.buf.format,
			silent = true,
		},
	},
	config = function()
		local none_ls = require("null-ls")
		local registry = require("mason-registry")

		local function install(name)
			local success, package = pcall(registry.get_package, name)
			if success and not package:is_installed() then
				package:install()
			end
		end

		install("stylua")

		none_ls.setup({
			sources = {
				none_ls.builtins.formatting.stylua,
			},
		})
	end,
}
