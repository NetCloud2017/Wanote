return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	event = "VeryLazy",
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = {
			'lua',
			'javascript',
			'typescript',
			'css',
			'html',
			'markdown',
			"json",
			"yaml",
		},
		highlight = {
			enable = true
		}
	}
}
