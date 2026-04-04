-- grugfar 插件需要配置 localleader 快捷键 `vim.g.maplocalleader = 'g'`
return {
	"MagicDuck/grug-far.nvim",
	cmd = "GrugFar",
	opts = {},
	config = function()
		vim.g.maplocalleader = ','
		require("grug-far").setup({})
	end,
}
