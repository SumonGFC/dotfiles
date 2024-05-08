local M = {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
                {
                        "hrsh7th/cmp-nvim-lsp",
                        event = "InsertEnter",
                },
                {
                        "hrsh7th/cmp-emoji",
                        event = "InsertEnter",
                },
                {
                        "hrsh7th/cmp-buffer",
                        event = "InsertEnter",
                },
                {
                        "hrsh7th/cmp-path",
                        event = "InsertEnter",
                },
                {
                        "hrsh7th/cmp-cmdline",
                        event = "InsertEnter",
                },
                {
                        "saadparwaiz1/cmp_luasnip",
                        event = "InsertEnter",
                },
                {
                        "L3MON4D3/LuaSnip",
                        event = "InsertEnter",
                        dependencies = {
                                "rafamadriz/friendly-snippets",
                        },
                },
                {
                        "hrsh7th/cmp-nvim-lua",
                },
        },
}




M.config = function()
        local cmp = require "cmp"
        local luasnip = require "luasnip"

        local check_backspace = function()
                local col = vim.fn.col "." - 1
                return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
        end


        cmp.setup({
                snippet = {
                        expand = function(args)
                                require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                        end,
                },

                mapping = cmp.mapping.preset.insert {
                        ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
                        ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
                        ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
                        ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
                        ["<C-S-k>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
                        ["<C-S-j>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
                        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
                        ["<C-e>"] = cmp.mapping {
                                i = cmp.mapping.abort(),
                                c = cmp.mapping.close(),
                        },
                        -- Accept currently selected item. If none selected, `select` first item.
                        -- Set `select` to `false` to only confirm explicitly selected items.
                        ["<CR>"] = cmp.mapping.confirm { select = false },
                        ["<Tab>"] = cmp.mapping(function(fallback)
                                if cmp.visible() then
                                        cmp.select_next_item()
                                elseif luasnip.expandable() then
                                        luasnip.expand()
                                elseif luasnip.expand_or_jumpable() then
                                        luasnip.expand_or_jump()
                                elseif check_backspace() then
                                        fallback()
                                        -- require("neotab").tabout()
                                else
                                        fallback()
                                        -- require("neotab").tabout()
                                end
                        end, { "i", "s" }
                        ),
                        ["<S-Tab>"] = cmp.mapping(function(fallback)
                                if cmp.visible() then
                                        cmp.select_prev_item()
                                elseif luasnip.jumpable(-1) then
                                        luasnip.jump(-1)
                                else
                                        fallback()
                                end
                        end, { "i", "s" }
                        ),
                },

                sources = cmp.config.sources({
                        { name = "nvim_lsp" },
                        { name = "nvim_lua" },
                        { name = "luasnip" },
                        { name = "buffer" },
                        { name = "path" },

                }),

                formatting = {
                        format = function(entry, vim_item)
                                -- Source
                                vim_item.menu = ({
                                        buffer = "[Buffer]",
                                        nvim_lsp = "[LSP]",
                                        luasnip = "[LuaSnip]",
                                        nvim_lua = "[NvimAPI]",
                                        path = "[Path]",
                                })[entry.source.name]
                                return vim_item
                        end,
                },
                confirm_opts = {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = false,
                },
                window = {
                        documentation = {
                                border = "rounded",
                        },
                }
        })

        cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                        { name = "path" },
                }, {
                        { name = "cmdline" },
                }),
        })
end

return M
