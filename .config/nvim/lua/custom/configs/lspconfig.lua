local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require("lspconfig")
local util = require "lspconfig/util"


local rust_opts = {
  tools = {
    reload_workspace_from_cargo_toml = false,
    runnables = {
      use_telescope = true,
    },
    inlay_hints = {
      auto = true,
      show_parameter_hints = false,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  },
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"rust"},
    root = util.root_pattern("Cargo.toml"),
    settings = {
      ["rust-analyzer"] = {
          checkOnSave = {
            command = "clippy",
          },
          cargo = {
            features = "all",
          },
          inlayHints = {
            locationLinks = true,
          }
      }
    }
  }
}

lspconfig.rust_analyzer.setup(rust_opts.server)
require("rust-tools").setup(rust_opts)

lspconfig.pyright.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  pythonPath = "/home/morgado/.pyenv/shims/python",
  analysis = {
    autoImportCompletion = true,
  },
  -- root_dir = function(fname)
  --   local root_files = {
  --     'pyproject.toml',
  --     'setup.py',
  --     'setup.cfg',
  --     'requirements.txt',
  --     'Pipfile',
  --     'pyrightconfig.json',
  --    }
  --   return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname) or util.path.dirname(fname)
  -- end,
}
lspconfig.texlab.setup{ on_attach = on_attach, capabilities = capabilities }


vim.api.nvim_create_autocmd("CursorHold", {
	buffer = bufnr,
	callback = function()
		local opts = {
			focusable = false,
			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
			border = 'rounded',
			source = 'always',
			prefix = ' ',
			-- scope = 'cursor',
		}
		vim.diagnostic.open_float(nil, opts)
	end
})

vim.diagnostic.config({
	virtual_text = {
		severity = {
			min = vim.diagnostic.severity.WARN,
		},
	},
	signs = true,
	underline = false,
	update_in_insert = true,
	severity_sort = true,
})
