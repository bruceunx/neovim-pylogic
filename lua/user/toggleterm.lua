
local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup {
  size = 17,
--  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "horizontal",
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "curved",
  },
}

function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  -- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end


local Terminal = require("toggleterm.terminal").Terminal

local floatTerm = Terminal:new { hidden = true, direction = "float" }


vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"

local lazygit = Terminal:new { cmd = "lazygit", direction = "float", hidden = true }

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

function _FLOAT_TOGGLE()
  floatTerm:toggle()
end

vim.keybinds.gmap("t", "<C-\\>", "<C-\\><C-n>:close<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-\\>", "<cmd>exe v:count1 . 'ToggleTerm'<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>o", "<cmd>lua _FLOAT_TOGGLE()<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>g", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", vim.keybinds.opts)
-- 打开或关闭所有终端
--[[ vim.keybinds.gmap("t", "<Esc>", "<C-\\><C-n>", vim.keybinds.opts) ]]
--[[ vim.keybinds.gmap("n", "<leader>cc", "<cmd>ToggleTermToggleAll<CR>", vim.keybinds.opts) ]]
