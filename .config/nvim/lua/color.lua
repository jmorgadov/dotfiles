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
