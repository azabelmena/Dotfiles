vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<C-n>", ":Ex!<CR>")
vim.keymap.set("n", "<C-s>", ":Sex!<CR>")
vim.keymap.set("n", "<C-b>", ":Sex?<CR>")

vim.keymap.set("n", "J", "<C-d>zz")
vim.keymap.set("n", "K", "<C-u>zz")

vim.keymap.set("v", "J", "<C-d>zz")
vim.keymap.set("v", "K", "<C-u>zz")

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

vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

vim.keymap.set("n", "<Esc>", "<Esc>")
vim.keymap.set("n", "<Bksp>", "<Bksp>")
vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<PageUp>", "<Nop>")
vim.keymap.set("n", "<PageDown>", "<Nop>")

vim.keymap.set("i", "<Up>", "<Nop>")
vim.keymap.set("i", "<Left>", "<Nop>")
vim.keymap.set("i", "<Right>", "<Nop>")
vim.keymap.set("i", "<Down>", "<Nop>")
vim.keymap.set("i", "<PageUp>", "<Nop>")
vim.keymap.set("i", "<PageDown>", "<Nop>")

vim.keymap.set("v", "<Up>", "<Nop>")
vim.keymap.set("v", "<Left>", "<Nop>")
vim.keymap.set("v", "<Right>", "<Nop>")
vim.keymap.set("v", "<Down>", "<Nop>")
vim.keymap.set("v", "<PageUp>", "<Nop>")
vim.keymap.set("v", "<PageDown>", "<Nop>")

vim.keymap.set("n", "<localleader>ff", "<cmd>Telescope find_files hidden=true no_ignore=true<CR>", { desc = "Fuzzy find files in cwd" })
vim.keymap.set("n", "<localleader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
vim.keymap.set("n", "<localleader>fs", "<cmd>Telescope live_grep<CR>", { desc = "Find string in cwd" })
vim.keymap.set("n", "<localleader>fc", "<cmd>Telescope grep_string<CR>", { desc = "Find string under cursor in cwd" })
vim.keymap.set("n", "<localleader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Find help tags" })
vim.keymap.set("n", "<localleader>fm", "<cmd>Telescope man_pages<CR>", { desc = "Find man pages" })
vim.keymap.set("n", "<localleader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find man pages" })
