return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "InsertEnter",
  opts = {
    suggestion = { 
      enabled = true,
      auto_triggers = true 
    },
    panel = { enabled = true },
    filetypes = {
      markdown = true,
      help = true,
    },
  },
  config = function()
    require("copilot").setup({})
  end,
}
