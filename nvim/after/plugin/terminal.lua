-- Add plugin configuration at the beginning of the file
--require('plugins')

-- Configure Neoterm
vim.g.neoterm_default_mod = 'below horizontal'

-- Some remaps
-- toggle terminal with ctrl ç (somehow neovim recognizes ";" as ctrl c)
--vim.keymap.set('n', ';', ':Ttoggle<CR>')
--vim.keymap.set('t', ';', ':Ttoggle<CR>')
--vim.keymap.set('n', '<leader>ç', ':Ttoggle resize=15<CR>')
--vim.keymap.set('t', '<leader>ç', vim.cmd.Ttoggle)
--vim.keymap.set("t", ";", ";")
--vim.g.neoterm_autoinsert = 1

-- New terminal plugin
vim.keymap.set('n', '<leader>ç', ':ToggleTerm size=15<CR>')
vim.keymap.set('t', '<leader>ç', vim.cmd.ToggleTerm)

-- Set the cursor to the terminal window after toggling
vim.cmd([[
  augroup TerminalCursor
    autocmd!
    autocmd TermOpen * startinsert
  augroup END
]])
