local status_ok, treesitter = pcall(require, "nvim-treesitter")
if not status_ok then
  return
end

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
        ensure_installed = {"c", "cpp", "kotlin", "javascript", "markdown", "python", "html", "css", "lua", "go", "java", "c_sharp"},
				ignore_install = { "" }, -- List of parsers to ignore installing
				sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)

				highlight = {
					enable = true, -- false will disable the whole extension
					disable = { "css" }, -- list of language that will be disabled
				},
				autopairs = {
					enable = true,
				},
				indent = { enable = true, disable = { "python", "css" } },

				context_commentstring = {
					enable = true,
					enable_autocmd = false,
				},
    }
)
