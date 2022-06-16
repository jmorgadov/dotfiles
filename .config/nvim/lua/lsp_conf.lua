-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local key_opts = { noremap = true, silent = true }
-- vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', key_opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', key_opts)
-- vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	-- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', key_opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', key_opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>kk', '<cmd>lua vim.lsp.buf.hover()<CR>', key_opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', key_opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', key_opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', key_opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', key_opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', key_opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', key_opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', key_opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', key_opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', key_opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>fi', '<cmd>lua vim.lsp.buf.formatting()<CR>', key_opts)
	if client.resolved_capabilities.document_highlight then
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


--Flutter
require("flutter-tools").setup { on_attach = on_attach }

local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
	local opts = { on_attach = on_attach }
	if server.name == "sumneko_lua" then
		opts.settings = {
			Lua = {
				diagnostics = {
					globals = { 'vim', 'use' }
				}
			}
		}
	end
	if server.name == "html" then
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		opts.settings = {
			configurationSection = { "html", "css", "javascript" },
			embeddedLanguages = {
				css = true,
				javascript = true
			},
			provideFormatter = true,
			capabilities = capabilities
		}
	end
	if server.name == "dartls" then
		return
	end
	server:setup(opts)
end)

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
			scope = 'cursor',
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
