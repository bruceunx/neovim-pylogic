return {
    cmd = {"typescript-language-server", "--stdio"},
    init_options = {
        hostInfo = "neovim",
        -- preferences = {
        --     baseIndentSize = 2,
        --     indentSize = 2,
        -- }
    },
    root_dir = function()
        return vim.fn.getcwd()
    end
    -- on_attach = function(client, bufnr)
    --   common_on_attach(client, bufnr)
    -- end
}
