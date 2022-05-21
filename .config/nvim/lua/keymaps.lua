local function map(mode, shortcut, command)
	vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true })
end

local function nmap(shortcut, command)
	map('n', shortcut, command)
end

local function imap(shortcut, command)
	map('i', shortcut, command)
end

local function tmap(shortcut, command)
	map('t', shortcut, command)
end

nmap("n", "nzz")
nmap("N", "Nzz")
nmap("/", ":set hlsearch<CR>/")
nmap("?", ":set hlsearch<CR>?")
nmap("#", ":set hlsearch<CR>#")
nmap("*", ":set hlsearch<CR>*")

imap("<C-Space>", "<C-X><C-O>")
nmap("J", "7j")
nmap("K", "7k")

nmap("//", ":vs<CR>")
nmap("--", ":sp<CR>")

nmap("<leader>rl", ":so ~/.config/nvim/init.lua<CR>")
nmap("<leader>rc", ":vs<CR>:Ex ~/.config/nvim<CR>")
nmap("<C-S>", ":update<CR>")
nmap("<leader>wq", ":wq<CR>")
nmap("<leader>q", ":q<CR>")

nmap("<leader>at", ":ALEToggle<CR>")
nmap("<leader>gg", ":G<CR>")
nmap("<leader>hh", ":set hlsearch!<CR>")
nmap("<leader>ss", ":mks! .session.vim<CR>")
nmap("<leader>ds", ":Pydocstring<CR>")
nmap("<leader>tr", ":Telescope resume<CR>")
nmap("<leader>gl", "::Flogsplit<CR>")

nmap("<leader>ff", ":FZF<CR>")
nmap("<leader>fg", ":Telescope live_grep<CR>")
nmap("<leader>fb", ":Telescope buffers<CR>")
nmap("<leader>fh", ":Telescope help_tags<CR>")
nmap("<leader>gb", ":Telescope git_branches<CR>")

nmap('<C-T>', ':Ttoggle<CR>')
tmap('<C-T>', '<C-\\><C-N>:Ttoggle<CR>')
nmap("<leader>p", ":Ex<CR>")
-- nmap("<leader>o", ":Tsend ranger<CR><C-\\><C-N>:resize 40<CR>:startinsert<CR>")

nmap("<leader>xx", ":TroubleToggle<CR>")

tmap("<C-W>h", "<C-\\><C-N><C-W>h")
tmap("<C-W>j", "<C-\\><C-N><C-W>j")
tmap("<C-W>k", "<C-\\><C-N><C-W>k")
tmap("<C-W>l", "<C-\\><C-N><C-W>l")

nmap("<leader>fi", ":ALEFix<CR>")
nmap("<leader>mp", ":Mypy<CR>")

-- Org mode
nmap("<leader>tt", "cit")

-- Flutter
nmap("<leader>fc", ":Telescope flutter commands<CR>")
nmap("<leader>fw", ":FlutterRun -d chrome --web-port 40200<CR>")
nmap("<leader>fd", ":FlutterRun -d linux<CR>")

-- LSP
nmap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
nmap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
nmap('<space>kk', '<cmd>lua vim.lsp.buf.hover()<CR>')
nmap('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
nmap('<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
nmap('<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
nmap('<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
nmap('<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
nmap('<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
nmap('<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
nmap('<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
nmap('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
nmap('<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
