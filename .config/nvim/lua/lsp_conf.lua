-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local key_opts = { noremap = true, silent = true }
-- vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', key_opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', key_opts)

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    client.server_capabilities.semanticTokensProvider = nil
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', key_opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', key_opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>kk', '<cmd>lua vim.lsp.buf.hover()<CR>', key_opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', key_opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', key_opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', key_opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', key_opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', key_opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', key_opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', key_opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', key_opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', key_opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>fi', '<cmd>lua vim.lsp.buf.format { async = true }<CR>', key_opts)

	if client.server_capabilities.document_highlight then
		vim.api.nvim_create_augroup('lsp_document_highlight', {
			clear = false
		})
		vim.api.nvim_clear_autocmds({
			buffer = bufnr,
			group = 'lsp_document_highlight',
		})
		vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
			group = 'lsp_document_highlight',
			buffer = bufnr,
			callback = vim.lsp.buf.document_highlight,
		})
		vim.api.nvim_create_autocmd('CursorMoved', {
			group = 'lsp_document_highlight',
			buffer = bufnr,
			callback = vim.lsp.buf.clear_references,
		})
	end
end


require("mason").setup()
require("mason-lspconfig").setup()

nvim_lsp = require("lspconfig")
nvim_lsp.pyright.setup{ on_attach = on_attach }
nvim_lsp.texlab.setup{ on_attach = on_attach }
nvim_lsp.dartls.setup{ on_attach = on_attach }
nvim_lsp.clangd.setup{
    on_attach = on_attach,
	settings = {
		capabilities = capabilities,
		cmd = {
			"clangd",
			"--background-index",
			"--pch-storage=memory",
			"--clang-tidy",
			"--suggest-missing-includes",
			"--cross-file-rename",
			"--completion-style=detailed",
		},
		init_options = {
			clangdFileStatus = true,
			usePlaceholders = true,
			completeUnimported = true,
			semanticHighlighting = true,
		}
	}
}

--Flutter
require("flutter-tools").setup { lsp = { on_attach = on_attach } }

-- Rust
-- Configure LSP through rust-tools.nvim plugin.
-- rust-tools will configure and enable certain LSP features for us.
-- See https://github.com/simrat39/rust-tools.nvim#configuration
local opts = {
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

  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
  server = {
    -- on_attach is a callback called when the language server attachs to the buffer
    on_attach = on_attach,
    settings = {
      -- to enable rust-analyzer settings visit:
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
        -- enable clippy on save
        checkOnSave = {
          command = "clippy",
        },
        cargo = {
        	features = "all",
        },
        inlayHints = {
        	locationLinks = true,
        }
      },
    },
  },
}

require("rust-tools").setup(opts)

local notify = vim.notify
vim.notify = function(msg, ...)
    if msg:match("warning: multiple different client offset_encodings") then
        return
    end

    notify(msg, ...)
end

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250

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

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

require('lsp-notify').setup({
	notify = require("notify")
})
