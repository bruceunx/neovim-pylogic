return {
  -- add gruvbox
  -- { "ellisonleao/gruvbox.nvim" },

 { "sainnhe/gruvbox-material", dependencies =  "rktjmp/lush.nvim"  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  }
}
