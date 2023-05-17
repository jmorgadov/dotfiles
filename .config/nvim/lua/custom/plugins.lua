local plugins = {
  { "voldikss/vim-floaterm", lazy=false },
  { "simrat39/rust-tools.nvim", ft="rust" },
  { "github/copilot.vim", lazy=false },
  { "rcarriga/nvim-notify", lazy = false, },
  { "tpope/vim-commentary", lazy = false, },
  {
    "mrded/nvim-lsp-notify",
    lazy = false,
    dependencies = {
      "rcarriga/nvim-notify",
      config = function ()
        require("notify").setup({
          background_colour = "#000000",
        })
      end
    },
    config = function ()
      require('lsp-notify').setup({
        notify = require("notify")
      })
    end
  },
  {
    "lervag/vimtex",
    ft = "tex",
    config = function ()
      local autocmd = vim.api.nvim_create_autocmd
      autocmd("FileType", {
        pattern = "tex",
        callback = function()
          vim.api.nvim_set_keymap("n", "<F5>", ":call vimtex#compiler#start()<CR>", { noremap = true })
          vim.api.nvim_set_keymap("n", "<F4>", ":call vimtex#compiler#stop()<CR>", { noremap = true })
        end,
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
     dependencies = {
       "jose-elias-alvarez/null-ls.nvim",
       config = function()
         require "custom.configs.null-ls"
       end,
     },
     config = function()
        require "plugins.configs.lspconfig"
        require "custom.configs.lspconfig"
     end,
  },
  { "folke/trouble.nvim", lazy=false }
}

return plugins
