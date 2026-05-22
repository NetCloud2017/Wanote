return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
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
