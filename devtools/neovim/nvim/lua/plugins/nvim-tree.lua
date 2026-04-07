-- 关闭vim 自带的netrw 文件浏览器

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		sort = {sorter = "name"},
		actions = {
			open_file = {
				quit_on_open = true,
			},
		},
	},
	config = function(_, opts)
		require("nvim-tree").setup(opts)
	end,
}
