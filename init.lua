if vim.g.vscode then
	require "user.options"
	require "user.keymaps_vs"
else
	require "user.options"
	require "user.keymaps"
	require "user.plugins"
	require "user.colorscheme"
	require "user.cmp"
	require "user.telescope"
	require "user.treesitter"
	require "user.autopairs"
	require "user.comment"
	require "user.nvim-tree"
	-- require "user.indentline"
	require "user.web_color"
	require "user.lspsaga_config"
	require "user.whichkey"
	require "user.lualine"
	require "user.bufferline"
	require "user.lsp"
	require "user.dap"
end

require('tabnine').setup({
  disable_auto_comment=true,
  accept_keymap="<Tab>",
  dismiss_keymap = "<C-]>",
  debounce_ms = 800,
  suggestion_color = {gui = "#808080", cterm = 244},
  exclude_filetypes = {"TelescopePrompt", "NvimTree"},
  log_file_path = nil, -- absolute path to Tabnine log file
})
