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
		 	run = {":TSupdate"},
		})
		-- 模糊查找
		-- 显示缩进线
		use({
			"lukas-reineke/indent-blankline.nvim",
		})
		-- 自动匹配括号
		use({
			"windwp/nvim-autopairs",
		})
		-- 显示网页色
		use({
			"norcalli/nvim-colorizer.lua",
		})
		use 'voldikss/vim-floaterm'

		-- install tmux vim navigator
		use({'christoomey/vim-tmux-navigator'})

		-- LSP UI 美化
		use({
			"nvim-telescope/telescope.nvim",
			requires = {
				"nvim-lua/plenary.nvim", -- Lua 开发模块
				"BurntSushi/ripgrep", -- 文字查找
				"sharkdp/fd", -- 文件查找
			},
		})
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

		use({
			"numToStr/Comment.nvim",
		})
		use {
				"williamboman/mason.nvim",
				 run = ":MasonUpdate", -- :MasonUpdate updates registry contents
				"williamboman/mason-lspconfig.nvim",
				"neovim/nvim-lspconfig",
		}

		use({ "jose-elias-alvarez/null-ls.nvim" }) -- 代码格式化

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
