require('gitsigns').setup {
    signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
    }
}

local gs = package.loaded.gitsigns
vim.keymap.set('n', '<leader>gd', gs.toggle_deleted)
