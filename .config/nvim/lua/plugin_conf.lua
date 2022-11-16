local cmd = vim.cmd

--[ FZF ]-----------------------------------------------------------------------
vim.g.fzf_layout = { window = { width = 0.8, height = 0.8 } }


--[ Telescope ]-----------------------------------------------------------------
require('telescope').setup{ defaults = { file_ignore_patterns = {".git"} } }
-- require("telescope").load_extension("flutter")


--[ Trouble ]-------------------------------------------------------------------
require("trouble").setup {}


--[ Vimtex ]--------------------------------------------------------------------
cmd [[ autocmd FileType tex map <F5> :call vimtex#compiler#start()<CR> ]]
cmd [[ autocmd FileType tex map <F6> :call vimtex#compiler#stop()<CR> ]]


--[ Markdown ]------------------------------------------------------------------
vim.g.vim_markdown_conceal = 1
vim.g.vim_markdown_conceal_code_blocks = 0
-- vim.g.vim_markdown_math = 1
vim.g.vim_markdown_toml_frontmatter = 1
vim.g.vim_markdown_frontmatter = 1
vim.g.vim_markdown_folding_disabled = 1
-- vim.g.vim_markdown_strikethrough = 1
vim.g.vim_markdown_autowrite = 1
-- vim.g.vim_markdown_follow_anchor = 1
cmd [[ autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown ]]
-- cmd [[ autocmd FileType markdown set conceallevel=0 ]]
cmd [[ let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'c'] ]]


--[ Tree sitter ]---------------------------------------------------------------
require('nvim-treesitter.configs').setup { highlight = { enable = true, disable = { "markdown" } } }

--[ Term Wrapper ]--------------------------------------------------------------
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


--[ Orgmode ]-------------------------------------------------------------------
require('orgmode').setup({
	org_todo_keywords = {'TODO', 'WAITING', '|', 'DONE', 'DELEGATED'},
	org_agenda_files = {'~/personal/org/*'},
	org_default_notes_file = '~/personal/org/todo.org',
	mappings = {
		global = {
			org_agenda = 'ga',
			org_capture = 'gc'
		}
	}

})
require('orgmode').setup_ts_grammar()


--[ Color scheme ]--------------------------------------------------------------
local leaf_colors = require("leaf.colors").setup()
require("leaf").setup({
    undercurl = true,
    commentStyle = "italic",
    functionStyle = "NONE",
    keywordStyle = "italic",
    statementStyle = "bold",
    typeStyle = "NONE",
    variablebuiltinStyle = "italic",
    transparent = false,
    colors = {},
	overrides = {
		ColorColumn = { fg = leaf_colors.lighter, bg = leaf_colors.dark_dim },
	},
    theme = "darker", -- default, alternatives: "dark", "lighter", "darker", "lightest", "darkest"
})


--[ Lualine ]-------------------------------------------------------------------
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
    path = 1,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = { 'fzf', 'fugitive' }
}


--[ Null-ls ]-------------------------------------------------------------------
local null_ls = require("null-ls")
null_ls.setup({
    default_timeout = 20000,
    fallback_severity = vim.diagnostic.severity.INFO,
    sources = {
        -- Python
        -- null_ls.builtins.diagnostics.ruff,
        null_ls.builtins.diagnostics.pylint,
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.isort.with({
			args = { "--stdout", "--filename", "$FILENAME", "-" , "--profile", "black"}
		}),

		-- Bash
		null_ls.builtins.formatting.shfmt,

		-- Gitsigns
		null_ls.builtins.code_actions.gitsigns
	},
})


--[ Autopairs ]-----------------------------------------------------------------
require('nvim-autopairs').setup{}


--[ Gitsigns ]------------------------------------------------------------------
require('gitsigns').setup {
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 200,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}


--[ Tokyionight ]---------------------------------------------------------------
require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "night", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
  transparent = false, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value `:help attr-list`
    comments = "italic",
    keywords = "italic",
    functions = "NONE",
    variables = "NONE",
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "light", -- style for floating windows
  },
  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- fucntion will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors) end,

  --- You can override specific highlights to use other groups or a hex color
  --- fucntion will be called with a Highlights and ColorScheme table
  ---@param highlights Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors) end,
})

-- [ Leap ]---------------------------------------------------------------------
vim.keymap.set('n', 'f', '<Plug>(leap-forward)', {})
vim.keymap.set('n', 'F', '<Plug>(leap-backward)', {})
