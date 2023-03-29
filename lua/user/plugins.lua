---@diagnostic disable: undefined-global
-- https://github.com/wbthomason/packer.nvim
local packer = require("packer")

packer.startup({
	-- 所有插件的安装都书写在 function 中
	function()
		-- 包管理器
		use({
			"wbthomason/packer.nvim",
		})
		--use({"nvim-lua/popup.nvim"})
		use({"JoosepAlviste/nvim-ts-context-commentstring"})
		use({
			"nvim-lualine/lualine.nvim",
		})
		-- nvim-tree
		use({
			"kyazdani42/nvim-tree.lua",
			requires = {
				-- 依赖一个图标插件
				"kyazdani42/nvim-web-devicons",
			},
		})
		-- 语法高亮
		use({
			"nvim-treesitter/nvim-treesitter",
			-- run = {":TSupdate"},
			-- requires = {
			--     "p00f/nvim-ts-rainbow" -- 彩虹括号
			-- },
		})
		-- 模糊查找
		use({
			"nvim-telescope/telescope.nvim",
			requires = {
				"nvim-lua/plenary.nvim", -- Lua 开发模块
				"BurntSushi/ripgrep", -- 文字查找
				"sharkdp/fd", -- 文件查找
			},
		})
		-- 显示缩进线
		use({
			"lukas-reineke/indent-blankline.nvim",
		})
		-- 自动匹配括号
		use({
			"windwp/nvim-autopairs",
		})
		--- 自动会话管理
		-- 多光标模式
		use({
			"terryma/vim-multiple-cursors",
		})
		-- 显示网页色
		use({
			"norcalli/nvim-colorizer.lua",
		})
		-- 内置终端
		-- use({
		-- 	"akinsho/toggleterm.nvim",
		-- })
		use 'voldikss/vim-floaterm'
		-- LSP 基础服务
		use({
			"neovim/nvim-lspconfig",
		})

		-- 自动安装 LSP
		use({
			"williamboman/nvim-lsp-installer",
		})

		-- install tmux vim navigator
		use({'christoomey/vim-tmux-navigator'})

		-- LSP UI 美化
		use({
			"tami5/lspsaga.nvim",
		})
		use({
			"sainnhe/gruvbox-material",
			requires = { "rktjmp/lush.nvim" },
		})
		use({
			"ellisonleao/gruvbox.nvim",
			requires = { "rktjmp/lush.nvim" },
		})
		-- 自动代码补全系列插件

		use({
			"hrsh7th/nvim-cmp", -- 代码补全核心插件，下面都是增强补全的体验插件
			requires = {
				{ "onsails/lspkind-nvim" }, -- 为补全添加类似 vscode 的图标
				{ "hrsh7th/vim-vsnip" }, -- vsnip 引擎，用于获得代码片段支持
				{ "hrsh7th/cmp-vsnip" }, -- 适用于 vsnip 的代码片段源
				{ "hrsh7th/cmp-nvim-lsp" }, -- 替换内置 omnifunc，获得更多补全
				{ "hrsh7th/cmp-path" }, -- 路径补全
				{ "hrsh7th/cmp-buffer" }, -- 缓冲区补全
				{ "hrsh7th/cmp-cmdline" }, -- 命令补全
				{ "f3fora/cmp-spell" }, -- 拼写建议
				{ "rafamadriz/friendly-snippets" }, -- 提供多种语言的代码片段
				{ "lukas-reineke/cmp-under-comparator" }, -- 让补全结果的排序更加智能

				{ "tzachar/cmp-tabnine", run = "./install.sh" }, -- tabnine 源,提供基于 AI 的智能补全

			},
		})
		---- 键位绑定器
		use({
			"folke/which-key.nvim",
		})
		use( {"mfussenegger/nvim-jdtls", disable = true,ft = "java"})
		--- pretter html js
		-- use {
		--     "MunifTanjim/prettier.nvim",
		--     config = function()
		--         require("conf.prettier")
		--     end
		-- }

		-- 代码注释
		use({
			"numToStr/Comment.nvim",
		})

		use({ "jose-elias-alvarez/null-ls.nvim" }) -- 代码格式化

		-- gitsigns
		-- use {
		--   'lewis6991/gitsigns.nvim',
		--   config = function()
		--     require('gitsigns').setup()
		--   end
		-- }
		--
		-- 安装其它插件

		 use({
			 "iamcco/markdown-preview.nvim"
	     })
    -- DAP
      use { "mfussenegger/nvim-dap"}
      use { "rcarriga/nvim-dap-ui"}
      use { "ravenxrz/DAPInstall.nvim"}

	end,
	-- 使用浮动窗口
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
	},
})
-- 实时生效配置
vim.cmd([[
      augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
      augroup end
    ]])
