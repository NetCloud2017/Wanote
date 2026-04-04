-- 状态栏
return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	event = "VeryLazy",
	opts = {
		options = {
			theme = "auto",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
		},
		extensions = { "nvim-tree" }, -- 让nvim-tree 插件打卡的buffer 不显示nvim-tree 的东西
		sections = {
			lualine_b = { "branch", "diff" },
			lualine_x = {
				"filesize",
				"encoding",
				"filetype",
			},
		},
	},
}
