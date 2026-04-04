return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	event = "VeryLazy",
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = {
			'lua',
		},
		highlight = {
			enable = true
		}
	}
}
