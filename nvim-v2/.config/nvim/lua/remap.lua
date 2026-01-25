vim.g.mapleader = " "

-- open vim directory explorer
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- open nvimtree (file explorer)
vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeOpen)

-- move selected line / block of text in visual mode up or down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- primeagen yank/paste registers
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>p", [["+p]])
vim.keymap.set("n", "<leader>P", [["+P]])

-- center cursor after jumping
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- vim-tmux-navigator
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- wrap text
vim.keymap.set("n", "<leader>w", ":set wrap!<CR>")

-- split
vim.keymap.set("n", "<leader>s", ":split<CR>")
vim.keymap.set("n", "<leader>v", ":vsplit<CR>")
