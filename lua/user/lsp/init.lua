local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end
vim.diagnostic.config(
    {
        virtual_text = false,
				float = {
            source = "always"
        },
        update_in_insert = false,
    }
)
require "user.lsp.mason"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
