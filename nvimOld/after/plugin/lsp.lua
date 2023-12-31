-- Basic setup
local lsp_zero = require("lsp-zero")
lsp_zero.preset("recommended")
lsp_zero.ensure_installed({
    'gopls'
})

-- Autocompletion keybinds
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp_zero.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
  -- Navigate between snippet placeholder
  ['<C-f>'] = cmp_action.luasnip_jump_forward(),
  ['<C-b>'] = cmp_action.luasnip_jump_backward(),
})
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp_zero.setup_nvim_cmp({
  mapping = cmp_mappings
})

-- LSP keybinds
lsp_zero.on_attach(function(bufnr)
  local opts = {buffer = bufnr, remap = false}
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- Configure LSP servers
require('lspconfig').gopls.setup {
    on_attach = lsp_zero.on_attach,
    capabilities = lsp_zero.capabilities,
    settings = {
        gopls = {
            completeUnimported = true,
            usePlaceholders = true,
        },
    }
}

require('lspconfig').jdtls.setup {
    cmd = {'jdtls', 'ssh', '-p', '2222', 'kali@localhost'},
    on_attach = lsp_zero.on_attach,
    settings = {
        java = {
            signatureHelp = { enabled = true }
        }
    }
}

-- LSP final setup
lsp_zero.setup()

vim.diagnostic.config({
    virtual_text = true
})
