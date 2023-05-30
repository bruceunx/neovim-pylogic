local status_ok, lsp_installer = pcall(require, "mason") if not status_ok then
  return
end

local servers = {
  "tsserver",
  "html",
  -- "cssls",
	"tailwindcss",
  "marksman",

  "pyright",
  "gopls",

  "clangd",
  "rust_analyzer",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})


local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  if server == "tsserver" then
    local tsserver_opts = require "user.lsp.settings.tsserver"
    opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
  end

  if server == "gopls" then
    local gopls_opts = require "user.lsp.settings.gopls"
    opts = vim.tbl_deep_extend("force", gopls_opts, opts)
  end

  if server == "marksman" then
    local markman_opts = require "user.lsp.settings.markman"
    opts = vim.tbl_deep_extend("force", markman_opts, opts)
  end

  if server == "pyright" then
    local pyright_opts = require "user.lsp.settings.pyright"
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  -- if server == "rust_analyzer" then
  --   local rust_opts = require "user.lsp.settings.rust"
  --   opts = vim.tbl_deep_extend("force", rust_opts, opts)
  -- end

  if server == "html" then
    local html_opts = require "user.lsp.settings.html"
    opts = vim.tbl_deep_extend("force", html_opts, opts)
  end
  lspconfig[server].setup(opts)
end
