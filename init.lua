-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("lspconfig")
require("cmake-tools")
require("mason").setup({})
require("config.options")

vim.schedule(function()
	vim.o.background = "dark"
end)
-- vim.cmd("colorscheme kanagawa")
-- require("kanagawa").load("dragon")
-- vim.cmd("colorscheme kanagawa-dragon")

-- set spelllang=en,ru
vim.opt.spelllang = { "en", "ru" }
