return {
	
	"folke/tokyonight.nvim", -- 主题
	opts = {
		style = 'moon'
	},
	config = function (_, opts) 
		require('tokyonight').setup(opts)
		vim.cmd("colorscheme tokyonight")
	end
}
