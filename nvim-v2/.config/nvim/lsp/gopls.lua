-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
return {
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
}
