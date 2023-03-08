local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

local servers = {
  --[[ "sumneko_lua", ]]
  --[[ "kotlin_language_server", ]]
  "cssls",
  "html",
  "tsserver",
  "pyright",
  "clangd",
  "gopls",
  "jdtls",
  "marksman",
  "csharp_ls",
}

lsp_installer.setup()

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

  --[[ if server == "sumneko_lua" then ]]
  --[[   local sumneko_opts = require "user.lsp.settings.sumneko_lua" ]]
  --[[   opts = vim.tbl_deep_extend("force", sumneko_opts, opts) ]]
  --[[ end ]]

  if server == "tsserver" then
    local tsserver_opts = require "user.lsp.settings.tsserver"
    opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
  end

  if server == "gopls" then
    local gopls_opts = require "user.lsp.settings.gopls"
    opts = vim.tbl_deep_extend("force", gopls_opts, opts)
  end

  if server == "pyright" then
    local pyright_opts = require "user.lsp.settings.pyright"
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  if server == "csharp-ls" then
    local cs_opts = require "user.lsp.settings.csharp"
    opts = vim.tbl_deep_extend("force", cs_opts, opts)
  end


  --[[ if server == "jdtls" then ]]
  --[[   local jdtls_opts = require "user.lsp.settings.jdtls" ]]
  --[[   opts = vim.tbl_deep_extend("force", jdtls_opts, opts) ]]
  --[[ end ]]

  if server == "html" then
    local html_opts = require "user.lsp.settings.html"
    opts = vim.tbl_deep_extend("force", html_opts, opts)
  end
  lspconfig[server].setup(opts)
end
