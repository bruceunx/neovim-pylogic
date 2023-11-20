return {
    root_dir = function()
        return vim.fn.getcwd()
    end,
    handlers = {
        ["textDocument/publishDiagnostics"] = function(...)
        end
    },

    settings = {
        python = {
            analysis = {
                typeCheckingMode = "true", --false
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "openFilesOnly",
                diagnosticSeverity = "warning" -- warning, information ,true, false
            }
        }
    }
}
