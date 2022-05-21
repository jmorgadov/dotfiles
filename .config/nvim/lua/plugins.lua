local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
-- Plugin outside ~/.vim/plugged with post-update hook
Plug 'nvim-lua/plenary.nvim'
Plug 'godlygeek/tabular'

-- Navegation
Plug 'nvim-telescope/telescope.nvim'
Plug 'junegunn/fzf'

-- Themes
Plug 'arcticicestudio/nord-vim'
Plug 'EdenEast/nightfox.nvim'
Plug 'ray-x/material_plus.nvim'
Plug 'jnurmine/Zenburn'
Plug 'mhartington/oceanic-next'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0ng/vim-hybrid'
Plug 'cocopon/iceberg.vim'
Plug 'doums/darcula'
Plug 'lifepillar/vim-gruvbox8'
Plug 'sainnhe/everforest'
Plug 'RRethy/nvim-base16'
Plug 'joshdick/onedark.vim'
Plug 'daschw/leaf.nvim'

-- Languages
Plug 'lervag/vimtex'
Plug 'plasticboy/vim-markdown'
Plug 'dart-lang/dart-vim-plugin'
Plug 'akinsho/flutter-tools.nvim'
Plug 'integralist/vim-mypy'

-- Languages general
vim.cmd [[ Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} ]]
Plug 'github/copilot.vim'
Plug 'neovim/nvim-lsp'
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'dense-analysis/ale'		-- Linter
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'

-- Utilf
vim.cmd [[ Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} ]]
Plug 'onsails/lspkind-nvim'
Plug 'sunjon/shade.nvim'
Plug 'oberblastmeister/termwrapper.nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'     -- Toggle comentaries on code
Plug 'vim-airline/vim-airline'  -- Powerline
Plug 'SirVer/ultisnips'			-- Some snippets
Plug 'tpope/vim-fugitive'		-- Git
Plug 'rbong/vim-flog'
Plug 'szw/vim-maximizer'		-- Maximize a buffer temporarly (util for vimspector)
Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-orgmode/orgmode'

-- Initialize plugin system
vim.call('plug#end')

vim.cmd [[ set statusline+=%{FugitiveHead()} ]]
