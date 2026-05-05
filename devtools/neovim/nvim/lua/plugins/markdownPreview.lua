return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && yarn install",
	init = function()
		vim.g.mkdp_port = "8010"
	end,
	ft = { "markdown" },
	keys = {
		{"<leader>mp", ":MarkdownPreview<CR>", silent = true},
		{"<leader>mt", ":MarkdownPreviewToggle<CR>", silent = true},
	},
}

