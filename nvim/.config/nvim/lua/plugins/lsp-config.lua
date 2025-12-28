return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "gopls", "jdtls", "pyright", "emmet_ls", "cssls" },
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })
            lspconfig.gopls.setup({
                capabilities = capabilities,
                cmd = { "gopls" },
                settings = {
                    gopls = {
                        completeUnimported = true,
                        usePlaceholders = true,
                        analyses = {
                            unusedparams = true,
                        },
                    },
                },
            })
            lspconfig.emmet_ls.setup({
                capabilities = capabilities,
                filetypes = { "html", "css" },
            })
            lspconfig.ts_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.cssls.setup({
                capabilities = capabilities,
            })
            lspconfig.dartls.setup({
                capabilities = capabilities,
            })
            lspconfig.pyright.setup({
                capabilities = capabilities,
                settings = {
                    python = {
                        -- pythonPath = "/home/ricky/IST/Tese/Dora-KRB/python_env/bin/python",
                        -- analysis = {
                        --     extraPaths = { "/home/ricky/IST/Tese/Dora-KRB/python_env/lib/python3.10/site-packages", "/home/ricky/IST/Tese/Dave-KRB/python_env/lib/python3.10/site-packages", "/home/ricky/IST/Tese/library-KRB/python_env/lib/python3.10/site-packages" },
                        -- },
                    }
                }
            })

            vim.keymap.set('n', 'J', vim.diagnostic.open_float)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, {})
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

            -- Add border to floating windows
            local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
            function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
                opts = opts or {}
                opts.border = "rounded"
                return orig_util_open_floating_preview(contents, syntax, opts, ...)
           end
        end
    },
}
