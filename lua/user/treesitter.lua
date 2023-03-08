local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
        -- 安装的高亮支持来源
        ensure_installed = {"c", "cpp", "kotlin", "javascript", "markdown", "python", "html", "css", "lua", "go", "java", "c_sharp"},
        -- 同步下载高亮支持
        sync_install = true,
        -- 高亮相关
        highlight = {
            -- 启用高亮支持
            enable = true,
            -- 使用 treesitter 高亮而不是 neovim 内置的高亮
            additional_vim_regex_highlighting = false,
	    -- disable = { "lua"},
        },
        -- 范围选择
        incremental_selection = {
            enable = true,
            keymaps = {
                -- 初始化选择
                init_selection = "<leader><CR>",
                -- 递增
                node_incremental = "<leader><CR>",
                -- 递减
                node_decremental = "<BS>",
                -- 选择一个范围
                scope_incremental = "<TAB>"
            }
        },
        -- 缩进，关闭
        indent = {
            enable = false
        },
        -- 彩虹括号，由 nvim-ts-rainbow 插件提供
        -- rainbow = {
        --     enable = true,
        --     extended_mode = true
        --     -- colors = {}, -- table of hex strings
        --     -- termcolors = {} -- table of colour name strings
        -- },
    }

)
