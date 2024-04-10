local pid = vim.fn.getpid()
local omnisharp_bin = "/Users/bruce/.local/share/nvim/mason/bin/omnisharp"

return {
	handlers = {
		["textDocument/definition"] = require("omnisharp_extended").definition_handler,
		["textDocument/typeDefinition"] = require("omnisharp_extended").type_definition_handler,
		["textDocument/references"] = require("omnisharp_extended").references_handler,
		["textDocument/implementation"] = require("omnisharp_extended").implementation_handler,
	},
	cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
	enable_roslyn_analysers = true,
	enable_import_completion = true,
	organize_imports_on_format = true,
	enable_decompilation_support = true,
	filetypes = { "cs", "vb", "csproj", "sln", "slnx", "props", "csx", "props", "targets" },
}
