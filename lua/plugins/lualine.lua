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
    local lualine_require = require("lualine_require")
    lualine_require.require = require

    -- local icons = require("lazyvim.config").icons
    -- vim.o.laststatus = vim.g.lualine_laststatus

	local filetype = {
		"filetype",
		icons_enabled = false,
	}

	local location = {
		"location",
		padding = 0,
	}

    return {
  options = {
    globalstatus = true,
    icons_enabled = false,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard" },
    always_divide_middle = true,
  },
    tabline = {
        lualine_a = {},
        lualine_b = {'branch'},
        lualine_c = {'filename'},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
  sections = {
    -- lualine_a = { "mode", "buffers" },
    lualine_a = { "mode"},
    lualine_b = {"branch"},
    -- lualine_c = { diagnostics },
    -- lualine_x = { diff, spaces, "encoding", filetype },
    lualine_x = {
      {
      'filename',
      file_status = false, -- displays file status (readonly status, modified status)
      path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
      }
    },
    -- lualine_y = { location, "encoding", filetype },
    lualine_y = { "encoding", filetype },
    lualine_z = {'lsp_progress'}, lualine_x = {'tabnine'},
    -- lualine_z = { "progress" },
  },
}
	end
}
