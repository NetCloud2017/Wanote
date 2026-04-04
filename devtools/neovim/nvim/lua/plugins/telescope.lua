return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- optional but recommended
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	-- dependencies = {
	--     "nvim-lua/plenary.nvim",
	--     {
	--         "nvim-telescope/telescope-fzf-native.nvim",
	--         build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && "
	--             .. "cmake --build build --config Release && "
	--             .. "cmake --install build --prefix build",
	--     },
	-- },
	cmd = "Telescope",
	keys = {
		{ "<leader>ff", "<CMD>Telescope find_files<CR>", desc = "find files" },
		{ "<leader>fs", "<cmd>Telescope live_grep<cr>" },
		{ "<leader>fc", "<cmd>Telescope grep_string<cr>" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "list available help tags" },
		{
			"<leader>lds",
			"<cmd>Telescope lsp_document_symbols<cr>",
			desc = "list all functions/structs/classes/modules in the current buffer",
		},
		{
			"<leader>gc",
			"<cmd>Telescope git_commits<cr>",
			desc = "list all git commits (use <cr> to checkout) ['gc' for git commits]",
		},

		{
			"<leader>gfc",
			"<cmd>Telescope git_bcommits<cr>",
			desc = " list git commits for current file/buffer (use <cr> to checkout) ['gfc' for git file commits]",
		},
		{
			"<leader>gb",
			"<cmd>Telescope git_branches<cr>",
			desc = "list git branches (use <cr> to checkout) ['gb' for git branch]",
		},
		{
			"<leader>gs",
			"<cmd>Telescope git_status<cr>",
			desc = "list current changes per file with diff preview ['gs' for git status]",
		},
	},
	opts = {
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		},
	},
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		telescope.load_extension("fzf")
	end,
}
