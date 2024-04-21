local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- vim.keymap.del("n", "<C-j>")

keymap("n", "W", ":w<CR>", opts)
keymap("n", "Q", ":q<CR>", opts)
keymap("n", "J", "5j", opts)
keymap("n", "K", "5k", opts)
keymap("n", "L", "5l", opts)
keymap("n", "H", "5h", opts)
keymap("i", "jj", "<ESC>", opts)
keymap("i", "jk", "<ESC>", opts)

keymap("n", "M", "J", opts)

keymap("n", "vv", ":vsplit<CR>", opts)
keymap("n", "ss", ":split<CR>", opts)

-- Better window navigation
keymap("n", "+", "<C-a>", opts)
keymap("n", "-", "<C-x>", opts)
keymap("n", "<C-a>", "gg<S-v>G", opts)

-- go to ~.local/nvim/lazygit find keymaps and delete <C-j>
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", opts)
keymap("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", opts)
--
-- keymap("n", "F", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
keymap("n", "<CR>", "o<ESC>k", opts)

-- Resize with arrows
-- keymap("n", "<C-Up>", ":resize -2<CR>", opts)
-- keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-w><", ":vertical resize -10<CR>", opts)
keymap("n", "<C-w>>", ":vertical resize +10<CR>", opts)
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
keymap("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "g]", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
keymap("n", "g[", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)

keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

keymap("n", "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions({ jump_type='vsplit' })<CR>", opts)
keymap("n", "gw", "<cmd>lua require'telescope.builtin'.diagnostics({ bufnr = 0})<CR>", opts)
keymap("n", "gr", "<cmd>lua require'telescope.builtin'.lsp_references()<CR>", opts)
keymap("n", "<leader>gi", "<cmd>lua require'telescope.builtin'.lsp_incoming_calls()<CR>", opts)
keymap("n", "<leader>go", "<cmd>lua require'telescope.builtin'.lsp_outgoing_calls()<CR>", opts)
keymap("n", "<leader>gq", "<cmd>lua require'telescope.builtin'.quickfix()<CR>", opts)

keymap("n", "gcd", "<cmd>lua require'omnisharp_extended'.telescope_lsp_definition({ jump_type='vsplit' })<CR>", opts)
keymap("n", "gcr", "<cmd>lua require'omnisharp_extended'.telescope_lsp_references({ jump_type='vsplit' })<CR>", opts)
keymap(
	"n",
	"gcD",
	"<cmd>lua require'omnisharp_extended'.telescope_lsp_type_definition({ jump_type='vsplit' })<CR>",
	opts
)
keymap(
	"n",
	"gci",
	"<cmd>lua require'omnisharp_extended'.telescope_lsp_implementation({ jump_type='vsplit' })<CR>",
	opts
)

-- CopilotChat
keymap("v", "<leader>ae", "<cmd>CopilotChatExplain<cr>", opts)
keymap("v", "<leader>ar", "<cmd>CopilotChatReview<cr>", opts)
keymap("v", "<leader>at", "<cmd>CopilotChatTests<cr>", opts)
--open floaterm with lazygit
-- keymap("n", "<leader>g", "<cmd>FloatermNew --height=0.77 --width=0.7 lazygit<CR>", opts)
