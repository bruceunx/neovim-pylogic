local servers = {
	"tsserver",
	"tailwindcss",
	"marksman",
	"pyright",
	"clangd",
	"omnisharp",
	"rust_analyzer",
	-- "gopls",
}

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	local keymap = vim.api.nvim_buf_set_keymap
	keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	keymap(bufnr, "n", "g[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	keymap(bufnr, "n", "g]", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
	keymap(bufnr, "n", "gh", "<cmd>Lspsaga hover_doc<CR>", opts)
	keymap(bufnr, "n", "gv", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
	keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
end

local on_attach = function(client, bufnr)
	if client.name == "tsserver" then
		client.server_capabilities.document_formatting = false
	end
	if client.name == "gopls" then
		client.server_capabilities.document_formatting = false
	end

	if client.name == "sumneko_lua" then
		client.server_capabilities.document_formatting = false
	end

	if client.name == "html" or client.name == "htmldjango" then
		client.server_capabilities.document_formatting = false
	end
	lsp_keymaps(bufnr)
	require("illuminate").on_attach(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

for _, server in pairs(servers) do
	opts = {
		on_attach = on_attach,
		capabilities = capabilities,
	}

	if server == "tsserver" then
		local tsserver_opts = require("config.lsp.settings.tsserver")
		opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
	end

	if server == "gopls" then
		local gopls_opts = require("config.lsp.settings.gopls")
		opts = vim.tbl_deep_extend("force", gopls_opts, opts)
	end

	if server == "marksman" then
		local markman_opts = require("config.lsp.settings.markman")
		opts = vim.tbl_deep_extend("force", markman_opts, opts)
	end

	if server == "pyright" then
		local pyright_opts = require("config.lsp.settings.pyright")
		opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	end

	if server == "html" then
		local html_opts = require("config.lsp.settings.html")
		opts = vim.tbl_deep_extend("force", html_opts, opts)
	end

	if server == "omnisharp" then
		local cs_opts = require("config.lsp.settings.omnisharp")
		opts = vim.tbl_deep_extend("force", cs_opts, opts)
	end
	lspconfig[server].setup(opts)
end
