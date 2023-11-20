local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

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
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)
-- Better paste
keymap("v", "p", '"_dP', opts)
keymap("n", "gf", "<C-w>gf", opts)

keymap("n", "<leader>cs", "<cmd>set spell!<CR>", opts) 

keymap("n", "<leader>1", "<cmd>Neotree toggle<CR>", opts) 

keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts) 
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts) 
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts) 
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts) 
keymap("n", "mv", "<cmd>MarkdownPreview<cr>", opts) 
keymap("n", "mvx", "<cmd>MarkdownPreviewStop<cr>", opts) 

keymap("n", "<leader>m", ":e %:h/", opts)

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- Lsp
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)

--open floaterm with lazygit
keymap("n", "<leader>t", "<cmd>FloatermNew --height=0.77 --width=0.7<CR>", opts)
keymap("n", "<leader>g", "<cmd>FloatermNew --height=0.77 --width=0.7 lazygit<CR>", opts)
keymap("t", "<leader>\\", "<cmd>FloatermToggle<CR>", opts)
keymap("n", "<leader>i", "<cmd>FloatermToggle<CR>", opts)


-- bufferlne
keymap("n", "<leader>bp", "<cmd>BufferLinePick<cr>", opts)
keymap("n", "<leader>bc", "<cmd>BufferLinePickClose<cr>", opts)
keymap("n", "<leader>bl", "<cmd>BufferLineCycleNext<cr>", opts)
keymap("n", "<leader>bL", "<cmd>BufferLineCloseRight<cr>", opts)
keymap("n", "<leader>bh", "<cmd>BufferLineCyclePrev<cr>", opts)
keymap("n", "<leader>bH", "<cmd>BufferLineCloseLeft<cr>", opts)
