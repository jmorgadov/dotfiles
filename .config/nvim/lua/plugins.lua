local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
-- Plugin outside ~/.vim/plugged with post-update hook
Plug 'nvim-lua/plenary.nvim'
Plug 'godlygeek/tabular'

-- Navegation
Plug 'nvim-telescope/telescope.nvim'
Plug 'junegunn/fzf'

-- Themes
Plug 'EdenEast/nightfox.nvim'
Plug 'Mofiqul/adwaita.nvim'
Plug 'Mofiqul/vscode.nvim'
Plug 'RRethy/nvim-base16'
Plug 'Shatur/neovim-ayu'
Plug 'Yazeed1s/minimal.nvim'
Plug 'arcticicestudio/nord-vim'
Plug 'cpea2506/one_monokai.nvim'
Plug 'daschw/leaf.nvim'
Plug 'doums/darcula'
Plug 'kaiuri/nvim-juliana'
Plug 'kvrohit/rasmus.nvim'
Plug 'lewpoly/sherbet.nvim'
Plug 'marko-cerovac/material.nvim'
Plug 'navarasu/onedark.nvim'
Plug 'preservim/nerdtree'
Plug 'ramojus/mellifluous.nvim'
Plug 'rktjmp/lush.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'sainnhe/everforest'
Plug 'sainnhe/sonokai'
Plug 'tomasiser/vim-code-dark'
Plug 'w0ng/vim-hybrid'
Plug 'xiyaowong/nvim-transparent'
vim.cmd [[ Plug 'catppuccin/nvim', { 'as': 'catppuccin' } ]]
vim.cmd [[ Plug 'folke/tokyonight.nvim', { 'branch': 'main' } ]]
vim.cmd [[ Plug 'projekt0n/github-nvim-theme', { 'tag': '0.0.7' } ]]

-- Languages
Plug 'lervag/vimtex'
Plug 'plasticboy/vim-markdown'
Plug 'akinsho/flutter-tools.nvim'
Plug 'simrat39/rust-tools.nvim'
-- Plug 'tpope/vim-markdown'

-- Languages general
vim.cmd [[ Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} ]]
Plug 'neovim/nvim-lsp'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'rcarriga/nvim-notify'

-- Util
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
Plug 'lewis6991/gitsigns.nvim'				-- Git signs
Plug 'NvChad/nvim-colorizer.lua'
Plug 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
Plug 'voldikss/vim-floaterm'
Plug 'ggandor/leap.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'Exafunction/codeium.vim'
Plug 'mrded/nvim-lsp-notify'

-- Initialize plugin system
vim.call('plug#end')
