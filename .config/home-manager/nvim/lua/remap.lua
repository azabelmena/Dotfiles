vim.g.mapleader = ","
vim.g.maplocalleader = ","

vim.keymap.set("n", "<C-n>", ":Ex!<CR>")
vim.keymap.set("n", "<C-s>", ":Sex!<CR>")
vim.keymap.set("n", "<C-b>", ":Sex?<CR>")

vim.keymap.set("n", "J", "<C-d>zz")
vim.keymap.set("n", "K", "<C-u>zz")

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
