vim.api.nvim_create_autocmd(
  { 'ColorScheme' },
  {
  	  pattern = '*',
  	  callback = function()
  	  	  vim.api.nvim_command('highlight LspReferenceText guibg=#404040')
  	  	  vim.api.nvim_command('highlight LspReferenceRead guibg=#404040')
  	  	  vim.api.nvim_command('highlight LspReferenceWrite guibg=#404040')
  	  end
  }
)
-- setup must be called before loading the colorscheme
-- Default options:
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = true,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  dim_inactive = false,
  transparent_mode = false,
  overrides = {
  	SignColumn = {bg = "#3c3836"}
  }
})

require("catppuccin").setup {
    flavour = "mocha" -- mocha, macchiato, frappe, latte
}

vim.cmd [[
  colorscheme catppuccin
  hi FloatermBorder guibg=##1d2021
  hi NormalFloat guibg=#1d2021
  hi DiagnosticError guifg=#CC6666
  hi DiagnosticWarn  guifg=#F0C674
  hi DiagnosticInfo  guifg=#81A2BE
  hi DiagnosticHint  guifg=#B5BD68
]]
