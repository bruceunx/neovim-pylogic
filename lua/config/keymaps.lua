local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- vim.keymap.del("n", "<C-j>")

keymap('n', 'W', ':w<CR>', opts)
keymap('n', 'Q', ':q<CR>', opts)
keymap('n', 'J', '5j', opts)
keymap('n', 'K', '5k', opts)
keymap('n', 'L', '5l', opts)
keymap('n', 'H', '5h', opts)
keymap('i', 'jj', '<ESC>', opts)
keymap('i', 'jk', '<ESC>', opts)

keymap('n', 'M', 'J', opts)

keymap('n', 'vv', ':vsplit<CR>', opts)
keymap('n', 'ss', ':split<CR>', opts)

-- Better window navigation
keymap('n', '+', '<C-a>', opts)
keymap('n', '-', '<C-x>', opts)
keymap('n', '<C-a>', 'gg<S-v>G', opts)


-- go to ~.local/nvim/lazygit find keymaps and delete <C-j>
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", opts)
keymap("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", opts)
--
keymap("n", "F", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
keymap("n", "<CR>", "o<ESC>k", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
-- Navigate buffers
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)
-- Better paste
keymap("v", "p", '"_dP', opts)
keymap("n", "gf", "<C-w>gf", opts)

keymap("n", "<leader>cs", "<cmd>set spell!<CR>", opts) 

keymap("n", "<leader>1", "<cmd>Neotree toggle<CR>", opts) 


keymap("n", "mv", "<cmd>MarkdownPreview<cr>", opts) 
keymap("n", "mvx", "<cmd>MarkdownPreviewStop<cr>", opts) 


-- Lsp
-- keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)

--open floaterm with lazygit
-- keymap("n", "<leader>g", "<cmd>FloatermNew --height=0.77 --width=0.7 lazygit<CR>", opts)
