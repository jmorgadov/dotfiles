local cmd = vim.cmd

-- Airline
vim.g.airline_powerline_fonts = 1
vim.g.airline_theme = "onedark"
cmd [[ let g:airline#extensions#tabline#enabled = 0 ]]

-- FZF
vim.g.fzf_layout = { window = { width = 0.8, height = 0.8 } }

-- Telescope
require('telescope').setup{ defaults = { file_ignore_patterns = {".git"} } }

-- Trouble
require("trouble").setup {}

-- ALE
cmd [[ autocmd FileType python :normal zR ]]
vim.g.ale_python_executable = "python"
vim.g.ale_python_pylint_use_global = 1
cmd [[ let g:ale_python_isort_use_global = 1 ]]
cmd [[ let g:ale_linters={ 'python': ['pylint'] } ]]
cmd [[ let g:ale_fixers = { 'python': ['black', 'isort'] } ]]
cmd [[ let g:ale_python_isort_options = '--profile black' ]]
cmd [[ highlight ALEWarning ctermfg=none cterm=underline ]]
cmd [[ highlight ALEErrorSign ctermbg=none ]]
cmd [[ highlight ALEWarningSign ctermbg=none ]]
-- cmd [[ let g:ale_pattern_options = { '.*tests/.*' : { 'ale_enabled' : 0 } } ]]

-- Vimtex
cmd [[ autocmd FileType tex map <F5> :call vimtex#compiler#start()<CR> ]]
cmd [[ autocmd FileType tex map <F6> :call vimtex#compiler#stop()<CR> ]]

-- Markdown
vim.g.vim_markdown_conceal = 2
vim.g.vim_markdown_conceal_code_blocks = 0
vim.g.vim_markdown_math = 1
vim.g.vim_markdown_toml_frontmatter = 1
vim.g.vim_markdown_frontmatter = 1
vim.g.vim_markdown_strikethrough = 1
vim.g.vim_markdown_autowrite = 1
vim.g.vim_markdown_follow_anchor = 1
cmd [[ autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown ]]
cmd [[ autocmd FileType markdown set conceallevel=0 ]]
cmd [[ autocmd FileType markdown :normal zR ]]

-- Tree sitter
require('nvim-treesitter.configs').setup {
	highlight = {
		-- `false` will disable the whole extension
		enable = true,
	}
}

-- Term Wrapper
require"termwrapper".setup {
    -- these are all of the defaults
    open_autoinsert = true, -- autoinsert when opening
    toggle_autoinsert = true, -- autoinsert when toggling
    autoclose = true, -- autoclose, (no [Process exited 0])
    winenter_autoinsert = false, -- autoinsert when entering the window
    default_window_command = "belowright 13split", -- the default window command to run when none is specified,
                                                   -- opens a window in the bottom
    open_new_toggle = true, -- open a new terminal if the toggle target does not exist
    log = 1, -- 1 = warning, 2 = info, 3 = debug
}


-- Shade
require'shade'.setup({
  overlay_opacity = 100,
  opacity_step = 1,
  keys = {
    brightness_up    = '<C-Up>',
    brightness_down  = '<C-Down>',
    toggle           = '<Leader>s',
  }
})
