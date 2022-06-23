local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

-- local hide_in_width = function()
--   return vim.fn.winwidth(0) > 80
-- end
--
-- local diagnostics = {
--   "diagnostics",
--   sources = { "nvim_diagnostic" },
--   sections = { "error", "warn" },
--   symbols = { error = " ", warn = " " },
--   colored = false,
--   always_visible = true,
-- }
--
-- local diff = {
--   "diff",
--   colored = false,
--   symbols = { added = "", modified = "", removed = "" }, -- changes diff symbols
--   cond = hide_in_width,
-- }

local filetype = {
  "filetype",
  icons_enabled = false,
}

local location = {
  "location",
  padding = 0,
}

-- local spaces = function()
--   return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
-- end

lualine.setup {
  options = {
    globalstatus = true,
    icons_enabled = false,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { "mode", "buffers" },
    lualine_b = {"branch"},
    -- lualine_c = { diagnostics },
    -- lualine_x = { diff, spaces, "encoding", filetype },
    lualine_x = {
      {
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
      }
    },
    lualine_y = { location, "encoding", filetype },
    lualine_z = { "progress" },
  },
}
