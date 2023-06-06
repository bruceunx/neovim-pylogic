require("nvim-tree").setup(
    {
        auto_reload_on_write = true,
				actions = {
					open_file = {
						quit_on_open = false,
					}
				},
        view = {
            width = 30,
            hide_root_folder = false,
            side = "right"
        },
        filters = {
             dotfiles = true,
             custom = {},
             exclude = {},
        },
        diagnostics = {
            enable = false,
            icons = {
                hint = "",
                info = "",
                warning = "",
                error = ""
            }
        },
        git = {
            enable = true,
            ignore = true,
            timeout = 500
        }
    }
)
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
vim.g.nvim_tree_add_trailing = 1
