return {
	-- add gruvbox
	--
	-- { "EdenEast/nightfox.nvim" },
	-- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

	-- { "sainnhe/gruvbox-material", dependencies = "rktjmp/lush.nvim" },
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "solarized-osaka",
		},
	},
}
