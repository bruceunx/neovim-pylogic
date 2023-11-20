return {
 { "famiu/bufdelete.nvim" },
 { 'codota/tabnine-nvim', build = "./dl_binaries.sh" },
 { "voldikss/vim-floaterm"},
 { "iamcco/markdown-preview.nvim", build = "cd app && npm install", init = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, },
 { "Hoffs/omnisharp-extended-lsp.nvim", lazy=true},
}
