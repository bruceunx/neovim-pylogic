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
				sync_install = true,
				highlight = {
					enable = true, -- false will disable the whole extension
					-- aditional_vim_regex_highlighting = false,
				},
        -- incremental_selection = {
        --     enable = true,
        --     keymaps = {
        --         -- 初始化选择
        --         init_selection = "<leader><CR>",
        --         -- 递增
        --         node_incremental = "<leader><CR>",
        --         -- 递减
        --         node_decremental = "<BS>",
        --         -- 选择一个范围
        --         scope_incremental = "<TAB>"
        --     }
        -- },
				indent = { enable = true },

				context_commentstring = {
					enable = true,
					enable_autocmd = false,
				},
    }
)
