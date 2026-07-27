return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",

	config = function(_)
		require("nvim-treesitter").install({
			"lua",
			--
			-- "javascript",
			-- "typescript",
			-- "jsx",
			-- "tsx",
			--
			-- "css",
			-- "html",
			-- "json",
			-- "yaml",
			-- "prisma"
		})

		-- print(vim.inspect(require('nvim-treesitter').get_installed()))
		vim.treesitter.language.register("tsx", { "javascriptreact" })
		require("nvim-treesitter").setup({
			install_dir = vim.fn.stdpath("data") .. "/site",
		})

		vim.api.nvim_create_autocmd("FileType", {
			-- pattern = {
			-- 	"javascript",
			-- 	"javascriptreact",
			-- 	"typescript",
			-- 	"typescriptreact",
			-- 	"tsx",
			-- 	"prisma"
			-- },

			callback = function(args)
				pcall(vim.treesitter.start, args.buf)

				vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
