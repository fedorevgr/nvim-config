return {
	"p00f/clangd_extensions.nvim",
	ft = { "c", "cpp", "h" },
	dependencies = {
		"VonHeikemen/lsp-zero.nvim",
		"neovim/nvim-lspconfig",
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<A-h>", "<CMD>ClangdSwitchSourceHeader<CR>", mode = { "n", "i", "v" } }, -- TODO header switch
	},
	config = function()
		local server_options = require("lsp-zero").build_options("clangd", {
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
			cmd = {
				"clangd",
			},
		})
		require("lspconfig").clangd.setup(server_options)
		require("clangd_extensions").setup()
	end,
	build_options = {
		"-std=c99",
	},
}
