-- return {
--   "nvim-treesitter/nvim-treesitter",
--   version = false, -- last release is way too old and doesn't work on Windows
--   build = ":TSUpdate",
--   -- event = { "LazyFile", "VeryLazy" },
--   cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
--   opts = {
--     highlight = { enable = true },
--     indent = { enable = true },
--     ensure_installed = {
--       "bash",
--       "c",
--       "cpp",
--       "csharp",
--       "rust",
--       "html",
--       "javascript",
--       "json",
--       "lua",
--       "markdown",
--       "markdown_inline",
--       "python",
--       "toml",
--       "tsx",
--       "typescript",
--       "yaml",
--     },
--   },
-- }
--
-- return {
-- 	{ "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
--
-- 	{
-- 		"nvim-treesitter/nvim-treesitter",
-- 		opts = {
-- 			ensure_installed = {
-- 				"cmake",
-- 				"cpp",
-- 				"c",
-- 				"c_sharp",
-- 				"css",
-- 				"python",
-- 				"go",
-- 				"graphql",
-- 				"rust",
-- 				"scss",
--         "markdown",
--         "markdown_inline",
-- 				"sql",
-- 				"svelte",
--         "javascript",
--         "json",
--         "toml",
--         "tsx",
--         "typescript",
--         "yaml",
--         "lua",
-- 			},
--
-- 			-- matchup = {
-- 			-- 	enable = true,
-- 			-- },
--
-- 			-- https://github.com/nvim-treesitter/playground#query-linter
-- 			query_linter = {
-- 				enable = true,
-- 				use_virtual_text = true,
-- 				lint_events = { "BufWrite", "CursorHold" },
-- 			},
--
-- 			playground = {
-- 				enable = true,
-- 				disable = {},
-- 				updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
-- 				persist_queries = true, -- Whether the query persists across vim sessions
-- 				keybindings = {
-- 					toggle_query_editor = "o",
-- 					toggle_hl_groups = "i",
-- 					toggle_injected_languages = "t",
-- 					toggle_anonymous_nodes = "a",
-- 					toggle_language_display = "I",
-- 					focus_language = "f",
-- 					unfocus_language = "F",
-- 					update = "R",
-- 					goto_node = "<cr>",
-- 					show_help = "?",
-- 				},
-- 			},
-- 		},
-- 		config = function(_, opts)
-- 			require("nvim-treesitter.configs").setup(opts)
--
-- 			-- MDX
-- 			vim.filetype.add({
-- 				extension = {
-- 					mdx = "mdx",
-- 				},
-- 			})
-- 			vim.treesitter.language.register("markdown", "mdx")
-- 		end,
-- 	},
-- }
local config = function()
	require("nvim-treesitter.configs").setup({
		build = ":TSUpdate",
		indent = {
			enable = true,
		},
		autotag = {
			enable = true,
		},
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		ensure_installed = {
			"markdown",
			"json",
			"javascript",
			"typescript",
			"yaml",
			"html",
			"css",
			"markdown",
			"bash",
			"lua",
			"gitignore",
			"python",
      "rust",
      "svelte",
		},
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = true,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-s>",
				node_incremental = "<C-s>",
				scope_incremental = false,
				node_decremental = "<BS>",
			},
		},
	})
end

return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	config = config,
}
