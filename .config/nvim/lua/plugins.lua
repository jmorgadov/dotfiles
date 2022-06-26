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
Plug 'w0ng/vim-hybrid'
Plug 'doums/darcula'
Plug 'lifepillar/vim-gruvbox8'
Plug 'sainnhe/everforest'
Plug 'RRethy/nvim-base16'
Plug 'joshdick/onedark.vim'
Plug 'daschw/leaf.nvim'

-- Languages
Plug 'lervag/vimtex'
Plug 'plasticboy/vim-markdown'
Plug 'akinsho/flutter-tools.nvim'

-- Languages general
vim.cmd [[ Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} ]]
Plug 'github/copilot.vim'
Plug 'neovim/nvim-lsp'
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'

-- Utilf
vim.cmd [[ Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} ]]
Plug 'onsails/lspkind-nvim'					-- Add icons to LSP completion
Plug 'oberblastmeister/termwrapper.nvim'    -- Terminal wrapper
Plug 'windwp/nvim-autopairs'				-- Auto pairs
Plug 'tpope/vim-commentary'					-- Toggle comentaries on code
Plug 'SirVer/ultisnips'						-- Snippet engine
Plug 'tpope/vim-fugitive'					-- Git
Plug 'rbong/vim-flog'						-- Git log
Plug 'szw/vim-maximizer'					-- Maximize a buffer temporarly (util for vimspector)
Plug 'nvim-orgmode/orgmode'					-- Org mode
Plug 'nvim-lualine/lualine.nvim'			-- Global bar
Plug 'lewis6991/gitsigns.nvim'				-- Git signs
Plug 'tpope/vim-surround'					-- Surround
Plug 'lilydjwg/colorizer'

-- Initialize plugin system
vim.call('plug#end')

vim.cmd [[ set statusline+=%{FugitiveHead()} ]]
