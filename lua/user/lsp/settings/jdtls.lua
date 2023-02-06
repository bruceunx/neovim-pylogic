return {
    cmd = {'/usr/bin/jdtls'},

    root_dir = function()
        return vim.fn.getcwd()
    end,
}
