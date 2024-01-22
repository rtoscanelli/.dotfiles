return {
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")
            -- load vscode snippets
            require("luasnip.loaders.from_vscode").lazy_load()
            -- load my custom snippets
            require("luasnip.loaders.from_vscode").load({
                paths = {
                    "~/.config/nvim/snippets",
                },
            })

            local cmp_kinds = {
                Text = "  ",
                Method = "  ",
                Function = "  ",
                Constructor = "  ",
                Field = "  ",
                Variable = "󰀫  ",
                Class = "  ",
                Interface = "  ",
                Module = "  ",
                Property = "  ",
                Unit = "  ",
                Value = "  ",
                Enum = "  ",
                Keyword = "  ",
                Snippet = "  ",
                Color = "  ",
                File = "  ",
                Reference = "  ",
                Folder = "  ",
                EnumMember = "  ",
                Constant = "  ",
                Struct = "  ",
                Event = "  ",
                Operator = "  ",
                TypeParameter = "  ",
            }

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                formatting = {
                    format = function(_, vim_item)
                        vim_item.kind = (cmp_kinds[vim_item.kind] or "") .. vim_item.kind
                        return vim_item
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),

                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-n>"] = cmp.mapping.select_next_item(),

                    -- Scroll up and down in documentation
                    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-d>"] = cmp.mapping.scroll_docs(4),

                    ["<C-e>"] = cmp.mapping.abort(),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                }),
            })
        end,
    },
}
