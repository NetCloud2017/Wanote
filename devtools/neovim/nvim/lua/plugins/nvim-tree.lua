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
		sort = {
			natural = true,
			sorter = function(nodes)
				table.sort(nodes, function(a, b)
					local function pad(s)
						return s:gsub("%d+", function(n)
							return string.format("%05d", tonumber(n))
						end)
					end
					return pad(a.name) < pad(b.name)
				end)
			end,
		},
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
