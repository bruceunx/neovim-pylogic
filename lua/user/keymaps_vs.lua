-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
--[[ local opts = { silent = true } ]]
local opts = { noremap = true, silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
keymap('n', 'W', ':w<CR>', opts)
keymap('n', 'Q', ':q<CR>', opts)
keymap('n', 'J', '5j', opts)
keymap('n', 'K', '5k', opts)
keymap('n', 'L', '5l', opts)
keymap('n', 'H', '5h', opts)
keymap('i', 'jj', '<ESC>', opts)
keymap('i', 'jk', '<ESC>', opts)

keymap('n', 'vv', ':vsplit<CR>', opts)
keymap('n', 'ss', ':split<CR>', opts)

-- Better window navigation
keymap('n', '+', '<C-a>', opts)
keymap('n', '-', '<C-x>', opts)
keymap('n', '<C-a>', 'gg<S-v>G', opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap('n', '<c-j>', '<c-w>j', opts)

keymap("n", "F", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
keymap("n", "<CR>", "o<ESC>k", opts)
keymap("n", "N", "J", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
-- Navigate buffers
--[[ keymap("n", "<S-l>", ":bnext<CR>", opts) ]]
--[[ keymap("n", "<S-h>", ":bprevious<CR>", opts) ]]
-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)
-- Close buffers
--[[ keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts) ]]
-- Better paste
keymap("v", "p", '"_dP', opts)

keymap("n", "<leader>cs", "<cmd>set spell!<CR>", opts) 


