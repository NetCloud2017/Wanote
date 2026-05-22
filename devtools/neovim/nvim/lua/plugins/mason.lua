return {
	"mason-org/mason.nvim",

	event = "VeryLazy",
	opts = {},

	dependencies = {
		"neovim/nvim-lspconfig",
		"mason-org/mason-lspconfig.nvim",
	},

	config = function(_, opts)
		require("mason").setup(opts)
		local registry = require("mason-registry")

		local function setup(name, config)
			-- registry.get_package("lua-language-server")
			local success, package = pcall(registry.get_package, name)
			if success and not package:is_installed() then
				package:install()
			end
			local nvim_lsp_mapping_str = require("mason-lspconfig").get_mappings().package_to_lspconfig[name]

			-- 这里设置  capabilities
			config.capabilities = require("blink.cmp").get_lsp_capabilities()
			-- 告诉lsp服务不要提供格式化功能给 前端
			config.on_attach = function(client)
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
							globals = { "vim" },
						},
					},
				},
			},
			-- ["html-lsp"] = {},
			["eslint-lsp"] = {},
			-- ["css-lsp"] = {},
			["emmet-ls"] = {
				filetypes = {
					"css",
					"eruby",
					"html",
					"javascript",
					"javascriptreact",
					"less",
					"sass",
					"scss",
					"svelte",
					"pug",
					"typescriptreact",
					"vue",
				},
				init_options = {
					html = {
						options = {
							-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
							["bem.enabled"] = true,
						},
					},
				},
			},
			["vtsls"] = {
				settings = {
					typescript = {
						inlayHints = {
							parameterNames = { enabled = "literals" },
							parameterTypes = { enabled = true },
							variableTypes = { enabled = true },
							propertyDeclarationTypes = { enabled = true },
							functionLikeReturnTypes = { enabled = true },
							enumMemberValues = { enabled = true },
						},
						suggest = {
							completeFunctionCalls = true,
						},
						-- 启用 node_modules 类型检查
						implicitProjectConfiguration = {
							checkJs = true,
							allowJs = true,
						},
					},
				},
			},
		}

		for server, config in pairs(servers) do
			setup(server, config)
		end

		vim.diagnostic.config({
			virtual_text = true,
			virtual_lines = false,
			update_in_insert = false,
		})
	end,
}
