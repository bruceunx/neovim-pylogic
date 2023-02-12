
local status_ok, lualine = pcall(require, "jdtls")
if not status_ok then
  return
end

local root_dir = vim.fn.getcwd()
local home = os.getenv('HOME')
local workspace_folder = home .. "/java/workspaces/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local config = {
	cmd = {'/usr/bin/jdtls'},
  cmd = {
    "java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-jar",
    "/home/bruce/.local/share/nvim/lsp_servers/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
    "-configuration",
    "/home/bruce/.local/share/nvim/lsp_servers/jdtls/config_linux",
		'-data', workspace_folder,
  },
  --[[ root_dir = require("jdtls.setup").find_root({".git", "mvnw", "gradlew"}), ]]
	root_dir = vim.fs.dirname(vim.fs.find({'.gradlew', '.git', 'mvnw'}, { upward = true })[1]),
  --[[ root_dir = vim.fn.getcwd(), ]]
  settings = {
    java = {}
  },
  init_options = {
    bundles = {}
  }
}
require("jdtls").start_or_attach(config)
