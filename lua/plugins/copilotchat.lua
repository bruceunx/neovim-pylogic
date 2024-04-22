local prompts = {
	-- Code related prompts
	Explain = "Please explain how the following code works.",
	Review = "Please review the following code and provide suggestions for improvement.",
	Tests = "Please explain how the selected code works, then generate unit tests for it.",
	Refactor = "Please refactor the following code to improve its clarity and readability.",
	FixCode = "Please fix the following code to make it work as intended.",
	FixError = "Please explain the error in the following text and provide a solution.",
	BetterNamings = "Please provide better names for the following variables and functions.",
	Documentation = "Please provide documentation for the following code.",
	SwaggerApiDocs = "Please provide documentation for the following API using Swagger.",
	SwaggerJsDocs = "Please write JSDoc for the following API using Swagger.",
	-- Text related prompts
	Summarize = "Please summarize the following text.",
	Spelling = "Please correct any grammar and spelling errors in the following text.",
	Wording = "Please improve the grammar and wording of the following text.",
	Concise = "Please rewrite the following text to make it more concise.",
}

return {
	"bruceunx/CopilotChat.nvim",
	branch = "canary",
	dependencies = {
		{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
		{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
	},
	opts = {
		debug = true,
		use_selection = false,
		use_general_ai = true,
		-- question_header = "## User ",
		-- answer_header = "## Copilot ",
		-- error_header = "## Error ",
		-- separator = " ", -- Separator to use in chat
		-- prompts = prompts,
		-- auto_follow_cursor = false, -- Don't follow the cursor after getting response
		-- show_help = true, -- Show help in virtual text, set to true if that's 1st time using Copilot Chat
		gpt_server = "groq", -- copilot or gemini or groq or openai
		copilot_token_url = "http://152.136.138.142:28443/copilot_internal/v2/token",
		groq = {
			url = "http://172.232.237.13:33333/groq/chat",
		},
		copilot = {
			url = "https://api.githubcopilot.com/chat/completions",
		},
		gemini = {
			url = "http://172.232.237.13:33333/gemini/chat",
		},
		openai = {
			url = "http://172.232.237.13:33333/openai_chat/chat",
		},
	},
	config = function(_, opts)
		-- local chat = require("CopilotChat")
		-- local select = require("CopilotChat.select")

		-- opts.selection = select.unnamed

		-- Override the git prompts message
		-- opts.prompts.Commit = {
		-- 	prompt = "Write commit message for the change with commitizen convention",
		-- 	selection = select.gitdiff,
		-- }
		-- opts.prompts.CommitStaged = {
		-- 	prompt = "Write commit message for the change with commitizen convention",
		-- 	selection = function(source)
		-- 		return select.gitdiff(source, true)
		-- 	end,
		-- }

		-- chat.setup(opts)
		require("CopilotChat").setup(opts)
	end,

	-- vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
	-- 	chat.ask(args.args, { selection = select.visual })
	-- end, { nargs = "*", range = true })
	--
	-- -- Inline chat with Copilot
	-- vim.api.nvim_create_user_command("CopilotChatInline", function(args)
	-- 	chat.ask(args.args, {
	-- 		selection = select.visual,
	-- 		window = {
	-- 			layout = "float",
	-- 			relative = "cursor",
	-- 			width = 1,
	-- 			height = 0.4,
	-- 			row = 1,
	-- 		},
	-- 	})
	-- end, { nargs = "*", range = true })

	-- Restore CopilotChatBuffer
	-- 	vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
	-- 		chat.ask(args.args, { selection = select.buffer })
	-- 	end, { nargs = "*", range = true })
	--
	-- 	-- Custom buffer for CopilotChat
	-- 	vim.api.nvim_create_autocmd("BufEnter", {
	-- 		pattern = "copilot-*",
	-- 		callback = function()
	-- 			-- vim.opt_local.relativenumber = true
	-- 			vim.opt_local.number = true
	--
	-- 			-- Get current filetype and set it to markdown if the current filetype is copilot-chat
	-- 			local ft = vim.bo.filetype
	-- 			if ft == "copilot-chat" then
	-- 				vim.bo.filetype = "markdown"
	-- 			end
	-- 		end,
	-- 	})
	--
	-- 	-- Add which-key mappings
	-- 	local wk = require("which-key")
	-- 	wk.register({
	-- 		g = {
	-- 			m = {
	-- 				name = "+Copilot Chat",
	-- 				d = "Show diff",
	-- 				p = "System prompt",
	-- 				s = "Show selection",
	-- 				y = "Yank diff",
	-- 			},
	-- 		},
	-- 	})
	-- end,
	event = "VeryLazy",
	keys = {
		-- 	-- Show help actions with telescope
		-- 	{
		-- 		"<leader>ah",
		-- 		function()
		-- 			local actions = require("CopilotChat.actions")
		-- 			require("CopilotChat.integrations.telescope").pick(actions.help_actions())
		-- 		end,
		-- 		desc = "CopilotChat - Help actions",
		-- 	},
		-- 	-- Show prompts actions with telescope
		-- 	{
		-- 		"<leader>ap",
		-- 		function()
		-- 			local actions = require("CopilotChat.actions")
		-- 			require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
		-- 		end,
		-- 		desc = "CopilotChat - Prompt actions",
		-- 	},
		-- 	{
		-- 		"<leader>ap",
		-- 		":lua require('CopilotChat.integrations.telescope').pick(require('CopilotChat.actions').prompt_actions({selection = require('CopilotChat.select').visual}))<CR>",
		-- 		mode = "x",
		-- 		desc = "CopilotChat - Prompt actions",
		-- 	},
		-- Code related commands
		{ "<leader>ae", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
		{ "<leader>at", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
		{ "<leader>ar", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code" },
		{ "<leader>aR", "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Refactor code" },
		{ "<leader>an", "<cmd>CopilotChatBetterNamings<cr>", desc = "CopilotChat - Better Naming" },
		-- 	-- Chat with Copilot in visual mode
		-- 	{
		-- 		"<leader>av",
		-- 		":CopilotChatVisual",
		-- 		mode = "x",
		-- 		desc = "CopilotChat - Open in vertical split",
		-- 	},
		-- 	{
		-- 		"<leader>ax",
		-- 		":CopilotChatInline<cr>",
		-- 		mode = "x",
		-- 		desc = "CopilotChat - Inline chat",
		-- 	},
		-- 	-- Custom input for CopilotChat
		-- 	{
		-- 		"<leader>ai",
		-- 		function()
		-- 			local input = vim.fn.input("Ask Copilot: ")
		-- 			if input ~= "" then
		-- 				vim.cmd("CopilotChat " .. input)
		-- 			end
		-- 		end,
		-- 		desc = "CopilotChat - Ask input",
		-- 	},
		-- 	-- Generate commit message based on the git diff
		-- 	{
		-- 		"<leader>am",
		-- 		"<cmd>CopilotChatCommit<cr>",
		-- 		desc = "CopilotChat - Generate commit message for all changes",
		-- 	},
		-- 	{
		-- 		"<leader>aM",
		-- 		"<cmd>CopilotChatCommitStaged<cr>",
		-- 		desc = "CopilotChat - Generate commit message for staged changes",
		-- 	},
		-- Quick chat with Copilot
		{
			"<leader>aq",
			function()
				local input = vim.fn.input("Quick Chat: ")
				if input ~= "" then
					vim.cmd("CopilotChatBuffer " .. input)
				end
			end,
			desc = "CopilotChat - Quick chat",
		},
		-- 	-- Debug
		-- 	{ "<leader>ad", "<cmd>CopilotChatDebugInfo<cr>", desc = "CopilotChat - Debug Info" },
		-- 	-- Fix the issue with diagnostic
		-- 	{ "<leader>af", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "CopilotChat - Fix Diagnostic" },
		-- Clear buffer and chat history
		{ "<leader>al", "<cmd>CopilotChatReset<cr>", desc = "CopilotChat - Clear buffer and chat history" },
		-- Toggle Copilot Chat Vsplit
		{ "<leader>av", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle" },
		--
		-- Change GPT server keybinding
		{
			"<leader>ac",
			function()
				local input = vim.fn.input(
					"Change gpt_server: 1 - Copilot, 2 - Gemini, 3 - Groq, 4 - openai or just type name \n"
				)
				if input ~= "" then
					if input == "1" then
						require("CopilotChat").change_gpt("copilot")
					elseif input == "2" then
						require("CopilotChat").change_gpt("gemini")
					elseif input == "3" then
						require("CopilotChat").change_gpt("groq")
					elseif input == "4" then
						require("CopilotChat").change_gpt("openai")
					else
						require("CopilotChat").change_gpt(input)
					end
				end
			end,
			desc = "CopilotChat - change gpt server",
		},
		{
			"<leader>as",
			function()
				local input = vim.fn.input("Use selection: 1 - yes, 2 - no \n")
				if input ~= "" then
					if input == "1" then
						require("CopilotChat").use_selection(true)
					else
						require("CopilotChat").use_selection(false)
					end
				end
			end,
			desc = "CopilotChat - Suppress selection",
		},
		{
			"<leader>ag",
			function()
				local input = vim.fn.input("Use general ai: 1 - yes, 2 - no \n")
				if input ~= "" then
					if input == "1" then
						require("CopilotChat").use_general_ai(true)
					else
						require("CopilotChat").use_general_ai(false)
					end
				end
			end,
			desc = "CopilotChat - Switch general ai or Code ai",
		},
	},
}
