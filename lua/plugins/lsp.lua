return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")

			mason_lspconfig.setup({
				ensure_installed = { "neocmake", "clangd", "cmake", "pylsp", "ast_grep", "asm_lsp" },
			})

			-- Default handler for all LSP servers
			mason_lspconfig.setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({})
				end,

				-- Custom handler for clangd
				["clangd"] = function()
					lspconfig.clangd.setup({
						cmd = { "clangd" },
						settings = {
							clangd = {
								InlayHints = {
									Designators = true,
									Enabled = true,
									ParameterNames = true,
									DeducedTypes = true,
								},
							},
							fallbackFlags = { "-std=c23" },
						},
					})
				end,

				-- Assembly LSP config
				["asm_lsp"] = function()
					lspconfig.asm_lsp.setup({})
				end,
			})
		end,
	},

	-- Clangd Extensions (for C/C++ specific features)
	{
		"p00f/clangd_extensions.nvim",
		ft = { "c", "cpp", "h" },
		dependencies = { "neovim/nvim-lspconfig" },
		keys = {
			{
				"<A-h>",
				"<CMD>ClangdSwitchSourceHeader<CR>",
				mode = { "n", "i", "v" },
				desc = "Switch C/C++ Header/Source",
			},
		},
		opts = {},
	},
}
