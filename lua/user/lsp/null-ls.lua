local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
  debug = false,
  sources = {
    formatting.prettier.with {
      extra_filetypes = { "toml", "html", "htmldjango", "javascript", "typescript", "jsx", "tsx", "markdown", "css", "json" , "rs"},
      extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
    },
    -- formatting.black.with { extra_args = { "--fast" } },
		 --   diagnostics.flake8,
		formatting.ruff,
    formatting.yapf,
		diagnostics.ruff,
		diagnostics.mypy,
		diagnostics.eslint,
  },
}
