return {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = function()
        return vim.fn.getcwd()
    end,
    single_file_support = true
}
