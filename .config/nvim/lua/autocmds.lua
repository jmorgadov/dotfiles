-- Set tab spacing to 2 spaces if filetype is dart
vim.cmd [[augroup filetype_dart]]
vim.cmd [[autocmd BufRead,BufNewFile *.dart set tabstop=2 shiftwidth=2 softtabstop=2]]
vim.cmd [[augroup END]]

vim.cmd [[ autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2 ]]
vim.cmd [[ autocmd FileType tex set textwidth=72 ]]
