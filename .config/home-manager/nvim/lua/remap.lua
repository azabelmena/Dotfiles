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

vim.keymap.set("n", "$", "g$")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "0", "g0")

vim.keymap.set("n", "<C-]>", ":bnext<CR>")
vim.keymap.set("n", "<C-[>", ":bprevious<CR>")
vim.keymap.set("n", "<C-p>", ":bdelete<CR>")

vim.keymap.set("n", "<leader>ss", ":setlocal spell!<CR>")
vim.keymap.set("n", "<leader>sn", "]s")
vim.keymap.set("n", "<leader>sp", "[s")
vim.keymap.set("n", "<leader>sa", "zg")
vim.keymap.set("n", "<leader>s?", "z=")
