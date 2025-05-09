return {
	{ "rebelot/kanagawa.nvim" },
	{
		"cdmill/neomodern.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("neomodern").setup({
				-- optional configuration here
			})
			require("neomodern").load()
		end,
	},

	{
		"LazyVim/LazyVim",
		opts = {
			"dragon",
		},
	}, -- Using lazy.nvim
}
