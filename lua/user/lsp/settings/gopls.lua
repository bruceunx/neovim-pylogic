return {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = function()
        return vim.fn.getcwd()
    end,
    single_file_support = true
    -- on_attach = function(client, bufnr)
    --   common_on_attach(client, bufnr)
    -- end
}
