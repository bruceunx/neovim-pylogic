return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then

      vim.o.statusline = " "
    else
      vim.o.laststatus = 0
    end
  end,
  opts = function()

    local filetype = {
      "filetype",
      icons_enabled = false,
    }

    -- local location = {
    --   "location",
    --   padding = 0,
    -- }

    return {
      options = {
        globalstatus = true,
        icons_enabled = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        always_divide_middle = true,
      },
      sections = {
        -- lualine_a = { "mode", "buffers" },
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = { 'copilot' ,'encoding', 'fileformat', 'filetype' }, 
        -- lualine_a = { "mode"},
        -- lualine_b = {"branch"},
        -- lualine_c = { diagnostics },
        -- lualine_x = { diff, spaces, "encoding", filetype },
        -- lualine_x = {
        --   {
        --   'filename',
        --   file_status = true, -- displays file status (readonly status, modified status)
        --   path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
        --   }
        -- },
        lualine_y = {'lsp_progress'},
        lualine_y = { 'progress', "location" },
        -- lualine_z = { 'location' }
    },
  }
	end
}
