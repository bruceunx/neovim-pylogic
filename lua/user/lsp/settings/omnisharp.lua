local pid = vim.fn.getpid()
local omnisharp_bin = "/Users/bruce/.local/share/nvim/mason/packages/omnisharp/omnisharp"

return {
		handlers = {
			["textDocument/definition"] = require('omnisharp_extended').handler,
		},
    cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
}
