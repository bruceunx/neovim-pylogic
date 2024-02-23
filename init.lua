local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local plugins = "plugins"

local opts = {
	spec = {
		{ "LazyVim/LazyVim" },
		{ import = "lazyvim.plugins.extras.lsp.none-ls" },
		{ import = "plugins" },
	},
	defaults = {
		lazy = false,
	},
	rtp = {
		disabled_plugins = {
			"gzip",
			"matchit",
			"matchparen",
			"netrw",
			"netrwPlugin",
			"tarPlugin",
			"tohtml",
			"tutor",
			"zipPlugin",
		},
	},
}

require("lazy").setup(opts)

if vim.g.vscode then
	require("config.options")
	require("config.keymaps")
else
	require("config.options")
	require("config.lsp")
	require("config.dap")
	require("config.keymaps")
end
