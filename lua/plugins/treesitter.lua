return {
  "nvim-treesitter/nvim-treesitter",
  version = false, -- last release is way too old and doesn't work on Windows
  build = ":TSUpdate",
  -- event = { "LazyFile", "VeryLazy" },
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = {
      "bash",
      "c",
      "cpp",
      "csharp",
      "rust",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "toml",
      "tsx",
      "typescript",
      "yaml",
    },
  },
}
