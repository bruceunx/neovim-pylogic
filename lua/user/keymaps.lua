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

keymap("n", "<leader>1", "<cmd>NvimTreeToggle<CR>", opts)
-- 按 leader fc 在文件树中找到当前以打开文件的位置
keymap("n", "<leader>fc", "<cmd>NvimTreeFindFile<CR>", opts)
-- 默认按键
-- o     ：打开目录或文件
-- a     ：新增目录或文件
-- r     ：重命名目录或文件
-- x     ：剪切目录或文件
-- c     ：复制目录或文件
-- d     ：删除目录或文件
-- y     ：复制目录或文件名称
-- Y     ：复制目录或文件相对路径
-- gy    ：复制目录或文件绝对路径
-- p     ：粘贴目录或文件
-- s     ：使用系统默认程序打开目录或文件
-- <Tab> ：将文件添加到缓冲区，但不移动光标
-- <C-v> ：垂直分屏打开文件
-- <C-x> ：水平分屏打开文件
-- <C-]> ：进入光标下的目录
-- <C-r> ：重命名目录或文件，删除已有目录名称
-- -     ：返回上层目录
-- I     ：切换隐藏文件/目录的可见性
-- H     ：切换点文件的可见性
-- R     ：刷新资源管理器
-- 另外，文件资源管理器操作和操作文档方式一致，可按 / ? 进行搜索

--open floaterm with lazygit
keymap("n", "<leader>g", "<cmd>FloatermNew --height=0.77 --width=0.7 lazygit<CR>", opts)

-- keymap("t", "<Esc>", "<C-\\><C-n><CR>", opts)
-- keymap("t", "<C-\\>", "<C-\\><C-n>:close<CR>", opts)
-- keymap("t", "<C-]>", "<C-\\><C-n><CR>", opts)
-- keymap("t", "<C-]>", "<C-\\><C-n>:close<CR>", opts)
-- keymap("n", "<C-\\>", "<cmd>exe v:count1 . 'ToggleTerm'<CR>", opts)
-- keymap("n", "<leader>t", "<cmd>lua _FLOAT_TOGGLE()<CR>", opts)
-- keymap("n", "<leader>g", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)
-- keymap("n", "<leader>cc", "<cmd>ToggleTermToggleAll<CR>", opts)
-- vim.keybinds.gmap("t", "<Esc>", "<C-\\><C-n>", opts
