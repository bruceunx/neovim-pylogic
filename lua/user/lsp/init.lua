local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end
vim.diagnostic.config(
    {
        --
        -- 诊断的虚拟文本
        -- virtual_text = {
        --     -- 显示的前缀，可选项：'●', '▎', 'x'
        --     -- 默认是一个小方块，不是很好看，所以这里改了
        --     prefix = "●",
        --     -- 是否总是显示前缀？是的
        --     source = "always"
        -- },
        virtual_text = false,
        float = {
            -- 是否显示诊断来源？是的
            source = "always"
        },
        -- 在插入模式下是否显示诊断？不要
        update_in_insert = false
    }
)
require "user.lsp.lsp-installer"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
