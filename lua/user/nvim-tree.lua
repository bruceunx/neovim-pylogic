require("nvim-tree").setup(
    {
        -- 自动关闭
        -- auto_close = false,
        auto_reload_on_write = true,
        -- 视图
        view = {
            -- 宽度
            width = 30,
            -- 隐藏顶部的根目录显示
            hide_root_folder = false,
            -- 自动调整大小
            -- auto_resize = true,
            side = "right"
        },
        filters = {
             dotfiles = true,
             custom = {},
             exclude = {},
        },
        diagnostics = {
            -- 是否启用文件诊断信息
            enable = false,
            icons = {
                hint = "",
                info = "",
                warning = "",
                error = ""
            }
        },
        -- open_file = {
        --   quit_on_open = true,
        --   resize_window = true,
        -- },
        git = {
            -- 是否启用 git 信息
            enable = true,
            ignore = true,
            timeout = 500
        }
    }
)
-- 默认图标，可自行修改
vim.g.nvim_tree_icons = {
    default = " ",
    symlink = " ",
    git = {
        unstaged = "",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "",
        deleted = "",
        ignored = ""
    },
    folder = {
        -- arrow_open = "╰─▸",
        -- arrow_closed = "├─▸",
        arrow_open = "",
        arrow_closed = "",
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
        symlink_open = ""
    }
}
-- 目录后加上反斜杠 /
vim.g.nvim_tree_add_trailing = 1
-- 按 leader 1 打开文件树
