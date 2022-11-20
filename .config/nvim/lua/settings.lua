vim.opt.compatible = false
vim.opt.colorcolumn = "87"
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.copyindent = true
vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.number = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.ignorecase = true
vim.opt.updatetime = 500
vim.opt.backspace = "indent,eol,start"
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.foldenable = false
vim.opt.mouse = "a"
vim.opt.syntax = "enable"
vim.opt.background = "dark"
vim.opt.termguicolors = true
vim.g.mapleader = " "
vim.g.html_indent_script1 = "zero"
vim.opt.spelllang="en"
vim.opt.cursorline = true
vim.g.floaterm_opener = "edit"
vim.opt.formatexpr = "tcqj"

vim.cmd [[
  filetype off
  filetype plugin indent on
  autocmd BufWinEnter,WinEnter term://* startinsert
  set laststatus=3
]]
