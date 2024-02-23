-- local status_ok, _ = pcall(require, "lspconfig")
-- if not status_ok then
--   return
-- end
-- vim.diagnostic.config(
--     {
--         virtual_text = false,
-- 				float = {
--             source = "always"
--         },
--         update_in_insert = false,
--     }
-- )
require "config.lsp.mason"
require("config.lsp.handlers").setup()
-- require "config.lsp.null-ls"
