return {
        {"hrsh7th/cmp-nvim-lsp"},
        {"hrsh7th/cmp-buffer"},
        { "hrsh7th/cmp-path" },
        {"hrsh7th/cmp-cmdline"},
        {
                "f3fora/cmp-spell",
                config = function ()
                        vim.opt.spell = true
                        vim.opt.spelllang = { "en_us" }
                end,
        },
        {"hrsh7th/cmp-calc"}, -- This is can calculate math by cmp window

        {"saadparwaiz1/cmp_luasnip"},
        {
                "L3MON4D3/LuaSnip",
                denpendencies = {"rafamadriz/friendly-snippets"},
                config =function ()
                        require("luasnip.loaders.from_vscode").lazy_load() -- More details about this line to see https://github.com/rafamadriz/friendly-snippets
                end,
        },

        -- Show cmp kind
        {
                -- More details see https://github.com/onsails/lspkind.nvim
                "onsails/lspkind.nvim",
                config = function ()
                            -- setup() is also available as an alias
                        require("lspkind").setup({
                            -- DEPRECATED (use mode instead): enables text annotations
                            --
                            -- default: true
                            -- with_text = true,

                            -- defines how annotations are shown
                            -- default: symbol
                            -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
                            mode = 'symbol_text',

                            -- default symbol map
                            -- can be either 'default' (requires nerd-fonts font) or
                            -- 'codicons' for codicon preset (requires vscode-codicons font)
                            --
                            -- default: 'default'
                            preset = 'default',

                            -- override preset symbols
                            --
                            -- default: {}
                            symbol_map = {
                              Text = "󰉿",
                              Method = "󰆧",
                              Function = "󰊕",
                              Constructor = "",
                              Field = "󰜢",
                              Variable = "󰀫",
                              Class = "󰠱",
                              Interface = "",
                              Module = "",
                              Property = "󰜢",
                              Unit = "󰑭",
                              Value = "󰎠",
                              Enum = "",
                              Keyword = "󰌋",
                              Snippet = "",
                              Color = "󰏘",
                              File = "󰈙",
                              Reference = "󰈇",
                              Folder = "󰉋",
                              EnumMember = "",
                              Constant = "󰏿",
                              Struct = "󰙅",
                              Event = "",
                              Operator = "󰆕",
                              TypeParameter = "",
                            },
                        })
                end,
        },

        {
                -- More info please see https://github.com/hrsh7th/nvim-cmp
                "hrsh7th/nvim-cmp",
                config = function()
                        local cmp = require("cmp")
                        local lspkind = require("lspkind")
                        cmp.setup({
                                formatting = {
                                        format = lspkind.cmp_format({
                                                mode = 'symbol_text',
                                                maxwidth = {
                                                        menu = 50,
                                                        abbr = 50,
                                                },
                                                ellipsis_char = '...',
                                                show_labelDetails = true,
                                                -- before = function (entry, vim_item)
                                                --        ... 
                                                --        return vim_item
                                                -- end
                                        })
                                },
                                snippet = {
                                        -- REQUIRED - you must specify a snippet engine
                                        expand = function(args)
                                        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                                        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                                        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                                        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
                                        end,
                                },
                                window = {
                                        -- completion = cmp.config.window.bordered(),
                                        -- documentation = cmp.config.window.bordered(),
                                },
                                mapping = cmp.mapping.preset.insert({
                                        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                                        ['<C-f>'] = cmp.mapping.scroll_docs(4),
                                        ['<C-Space>'] = cmp.mapping.complete(),
                                        ['<C-e>'] = cmp.mapping.abort(),
                                        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                                }),
                                -- Add any cmp plugins here
                                sources = cmp.config.sources({
                                        { name = 'nvim_lsp' },
                                        -- { name = 'vsnip' }, -- For vsnip users.
                                        { name = 'luasnip' }, -- For luasnip users.
                                        -- { name = 'ultisnips' }, -- For ultisnips users.
                                        -- { name = 'snippy' }, -- For snippy users.
                                        }, {
                                        { name = 'buffer' },
                                        { name = 'path' },
                                        {
                                                name = "spell",
                                                option = {
                                                        keep_all_entries = false,
                                                        enable_in_context = function()
                                                                return true
                                                        end,
                                                        preselect_correct_word = true,
                                                },
                                        },
                                        { name = 'calc' },
                               })
                        })
                        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
                        cmp.setup.cmdline({ '/', '?' }, {
                                mapping = cmp.mapping.preset.cmdline(),
                                sources = {
                                        { name = 'buffer' },
                                }
                        })
                        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
                        cmp.setup.cmdline(':', {
                                mapping = cmp.mapping.preset.cmdline(),
                                sources = cmp.config.sources({
                                        { name = 'path' },
                                },
                                {
                                        { name = 'cmdline' },
                                }),
                                matching = { disallow_symbol_nonprefix_matching = false }
                        })
                end,
        },
}
