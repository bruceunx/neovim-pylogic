return {
  "nvimtools/none-ls.nvim",
  event = false,
  opts = function(_, opts)
    local nls = require("null-ls")
    opts.root_dir = opts.root_dir
      or require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git")
    opts.sources = vim.list_extend(opts.sources or {}, {
      nls.builtins.formatting.ruff,
      nls.builtins.formatting.yapf,
      nls.builtins.diagnostics.ruff,
      nls.builtins.diagnostics.mypy,
      nls.builtins.diagnostics.eslint,
    })
  end,
}
