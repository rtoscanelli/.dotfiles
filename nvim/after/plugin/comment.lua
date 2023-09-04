require('nvim_comment').setup()

vim.keymap.set('n', '<leader>\\', vim.cmd.CommentToggle)
