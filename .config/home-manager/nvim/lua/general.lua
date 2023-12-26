vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 0
vim.g.netrw_browse_liststyle = 1

vim.cmd([[let g:netrw_bufsettings = 'noma nomod nonu nowrap ro nobl']])
vim.cmd("colorscheme gruvbox")

vim.opt.nu = false
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.cursorline = true
vim.opt.cursorcolumn = true

local indent_map = {
	nix = { tabstop = 2, shiftwidth = 2, expandtab = true },
	markdown = { tabstop = 4, shiftwidth = 4, expandtab = true },
	html = { tabstop = 4, shiftwidth = 4, expandtab = true },
}
local group = vim.api.nvim_create_augroup("MyCustomIndents", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = vim.tbl_keys(indent_map),
	group = group,
	callback = function()
		local match = vim.fn.expand("<amatch>")
		for opt, val in pairs(indent_map[match]) do
			vim.api.nvim_set_option_value(opt, val, { scope = "local" })
		end
	end,
})

vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.o.completeopt = 'menuone,noselect'

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.o.termguicolors = true

vim.opt.colorcolumn = "81"

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})


vim.cmd("command C let @/=\"\"")
