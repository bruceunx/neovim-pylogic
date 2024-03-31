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

local opts = {
	spec = {
		{ "LazyVim/LazyVim" },
		-- { import = "lazyvim.plugins.extras.lsp.none-ls" },
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
require("config.options")
require("config.keymaps")

local function sign_define(args)
	vim.fn.sign_define(args.name, {
		texthl = args.name,
		text = args.text,
		numhl = "",
	})
end

sign_define({ name = "DiagnosticSignError", text = "✘" })
sign_define({ name = "DiagnosticSignWarn", text = "▲" })
sign_define({ name = "DiagnosticSignHint", text = "⚑" })
sign_define({ name = "DiagnosticSignInfo", text = "»" })

vim.diagnostic.config({
	virtual_text = {
		source = "always",
	},
})
