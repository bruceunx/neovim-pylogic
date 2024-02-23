return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	opts = {
		ensure_installed = {
			"tsserver",
			"tailwindcss",
			"marksman",
			"pyright",
			"clangd",
			"omnisharp",
			"rust_analyzer",
			"gopls",
		},
	},
	config = function()
		require("config.lsp.mason")
	end,
}
