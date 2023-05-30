local status_ok, treesitter = pcall(require, "nvim-treesitter")
if not status_ok then
  return
end

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
        ensure_installed = {"c", "cpp", "javascript", "markdown", "python", "html", "css", "lua", "go", "rust"},
				sync_install = true,
				highlight = {
					enable = true,
				},
				indent = { enable = true },
				context_commentstring = {
					enable = true,
					enable_autocmd = false,
				},
    }
)
