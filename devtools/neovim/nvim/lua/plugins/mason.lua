return {
	"williamboman/mason.nvim",

	event = "VeryLazy",
	opts = {},
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason-lspconfig",

	},
	config = function (_, opts)
		require("mason").setup(opts)
		local registry = require('mason-registry')

		local function setup(name, config)

			-- registry.get_package("lua-language-server")
			local success, package = pcall(registry.get_package, name)
			if success and not package:is_installed() then
				package:install()
			end
			local nvim_lsp_mapping_str = require("mason-lspconfig").get_mappings().package_to_lspconfig[name]

			-- 这里设置  capabilities 
			config.capabilities  = require("blink.cmp").get_lsp_capabilities();
			-- 告诉lsp服务不要提供格式化功能给 前端
			config.on_attach = function (client)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
			end

			vim.lsp.config(nvim_lsp_mapping_str, config)
		end

		local servers = {
				["lua-language-server"] = {

					settings = {

						Lua = {
							diagnostics = {
								globals = {"vim"}
							}
						}
					}
				},
				["html-lsp"] = {},
				["css-lsp"] = {},
				["typescript-language-server"] = {},
				["emmet-ls"] = {},
	 	}

		for server, config in pairs(servers) do
			setup(server, config)
		end

		vim.cmd("LspStart")
		vim.diagnostic.config({
			virtual_text = true,
			virtual_lines = true,
			update_in_insert = true,
		})
	end
}
