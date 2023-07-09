local lspkind = require("lspkind")
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local source_mapping = {
	-- buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	-- nvim_lua = "[Lua]",
	cmp_tabnine = "[TN]",
	path = "[Path]",
}

cmp.setup(
    {
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end
        },
        sources = cmp.config.sources(
            {
                {name = "vsnip"},
                {name = "nvim_lsp"},
                -- {name = "buffer"},
                -- {name = "cmdline"},
                -- {name = "spell"},
                {name = "cmp_tabnine"},
                {name = "path"}
            }
        ),
				formatting = {
						format = function(entry, vim_item)
							-- if you have lspkind installed, you can use it like
							-- in the following line:
							vim_item.kind = lspkind.symbolic(vim_item.kind, {mode = "symbol"})
							vim_item.menu = source_mapping[entry.source.name]
							if entry.source.name == "cmp_tabnine" then
								local detail = (entry.completion_item.labelDetails or {}).detail
								vim_item.kind = ""
								if detail and detail:find('.*%%.*') then
									vim_item.kind = vim_item.kind .. ' ' .. detail
								end

								if (entry.completion_item.data or {}).multiline then
									vim_item.kind = vim_item.kind .. ' ' .. '[ML]'
								end
							end
							local maxwidth = 80
							vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
							return vim_item
						end,
					},
        -- formatting = {
        --     format = lspkind.cmp_format(
        --         {
        --             with_text = true,
        --             maxwidth = 50,
        --             before = function(entry, vim_item)
        --                 vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
        --                 return vim_item
        --             end
        --         }
        --     )
        -- },
        sorting = {
            comparators = {
                cmp.config.compare.offset,
                cmp.config.compare.exact,
                cmp.config.compare.score,
                cmp.config.compare.recently_used,
--                require("cmp-under-comparator").under,
                require("cmp_tabnine.compare"),
                -- cmp.config.compare.kind,
                -- cmp.config.compare.sort_text,
                -- cmp.config.compare.length,
                -- cmp.config.compare.order
            }
        },
        mapping = {
				['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
				['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
							["<CR>"] = cmp.mapping.confirm(),
							["<C-k>"] = cmp.mapping(
									{
											i = function()
													if cmp.visible() then
															cmp.abort()
													else
															cmp.complete()
													end
											end,
											c = function()
													if cmp.visible() then
															cmp.close()
													else
															cmp.complete()
													end
											end
									}
							),
            ["<Tab>"] = cmp.mapping(
                function(fallback)
                    if cmp.visible() then
                        local entry = cmp.get_selected_entry()
                        if not entry then
                            cmp.select_next_item({behavior = cmp.SelectBehavior.Select})
                        end
                        cmp.confirm()
                    else
                        fallback()
                    end
                end,
                {"i", "s", "c"}
            )
        }
    }
)
cmp.setup.cmdline(
    "/",
    {
        sources = {
            {name = "buffer"}
        }
    }
)
cmp.setup.cmdline(
    ":",
    {
        sources = cmp.config.sources(
            {
                {name = "path"}
            },
            {
                {name = "cmdline"}
            }
        )
    }
)
