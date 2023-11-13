local packer = require("packer")

packer.startup({
	function()
		use "wbthomason/packer.nvim"
		use "famiu/bufdelete.nvim"
		use "JoosepAlviste/nvim-ts-context-commentstring"
		use "nvim-lualine/lualine.nvim"
		use "lukas-reineke/indent-blankline.nvim"
		use "windwp/nvim-autopairs"
		use "norcalli/nvim-colorizer.lua"
		use "voldikss/vim-floaterm"
		use "christoomey/vim-tmux-navigator"
		use "tami5/lspsaga.nvim"
		use "folke/which-key.nvim"
		use "numToStr/Comment.nvim"
		use "jose-elias-alvarez/null-ls.nvim"
		use { 'codota/tabnine-nvim', run = "./dl_binaries.sh" }
		-- use "iamcco/markdown-preview.nvim"
		use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
		use "mfussenegger/nvim-dap"
		use "rcarriga/nvim-dap-ui"
		use "ravenxrz/DAPInstall.nvim"
		use {"akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" }
		use { "sainnhe/gruvbox-material", requires =  "rktjmp/lush.nvim"  }
		use {"kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" }
		use {"nvim-treesitter/nvim-treesitter"}
		use "Hoffs/omnisharp-extended-lsp.nvim"
		use {
				"williamboman/mason.nvim",
				 run = ":MasonUpdate", -- :MasonUpdate updates registry contents
				"williamboman/mason-lspconfig.nvim",
				"neovim/nvim-lspconfig",
		}
		use{
			"nvim-telescope/telescope.nvim",
			requires = {
				"nvim-lua/plenary.nvim",
				"BurntSushi/ripgrep",
				"sharkdp/fd",
			},
		}
		use({
			"hrsh7th/nvim-cmp",
			requires = {
				{ "onsails/lspkind-nvim" },
				{ "hrsh7th/vim-vsnip" },
				{ "hrsh7th/cmp-vsnip" },
				{ "hrsh7th/cmp-nvim-lsp" },
				{ "hrsh7th/cmp-path" },
				-- { "hrsh7th/cmp-buffer" },
				{ "hrsh7th/cmp-cmdline" },
				-- { "f3fora/cmp-spell" },
				-- { "rafamadriz/friendly-snippets" },
				-- { "lukas-reineke/cmp-under-comparator" },
				{ "tzachar/cmp-tabnine", run = "./install.sh" },

			},
		})
	end,
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
	},
})
vim.cmd([[
      augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
      augroup end
    ]])
