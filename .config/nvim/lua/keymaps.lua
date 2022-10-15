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

imap("<C-Space>", "<C-X><C-O>")
-- nmap("J", "7j")
-- nmap("K", "7k")

nmap("==", ":vs<CR>")
nmap("--", ":sp<CR>")

nmap("<leader>rl", ":so ~/.config/nvim/init.lua<CR>")
nmap("<leader>rc", ":vs<CR>:Ex ~/.config/nvim<CR>")
nmap("<C-S>", ":update<CR>")
nmap("<leader>wq", ":wq<CR>")
nmap("<leader>q", ":q<CR>")

local float_term_cmd = ":FloatermNew --height=0.9 --width=0.9 --wintype=float --name=floaterm1 "
nmap("<leader>gg", float_term_cmd .. "lazygit<CR>")
nmap("<leader>p", float_term_cmd .. "ranger<CR>")
nmap("<leader>y", float_term_cmd .. "ipython<CR>")
nmap("<leader>ss", ":mks! .session.vim<CR>")
nmap("<leader>ds", ":Pydocstring<CR>")
nmap("<leader>tr", ":Telescope resume<CR>")
nmap("<leader>gl", ":Flogsplit<CR>")

nmap("<leader>ff", ":Telescope fd<CR>")
nmap("<leader>fg", ":Telescope live_grep<CR>")
nmap("<leader>fb", ":Telescope buffers<CR>")
nmap("<leader>fh", ":Telescope help_tags<CR>")
nmap("<leader>gb", ":Telescope git_branches<CR>")

nmap('<C-T>', ':Ttoggle<CR>')
tmap('<C-T>', '<C-\\><C-N>:Ttoggle<CR>')

nmap("<leader>xx", ":TroubleToggle<CR>")

tmap("<C-W>h", "<C-\\><C-N><C-W>h")
tmap("<C-W>j", "<C-\\><C-N><C-W>j")
tmap("<C-W>k", "<C-\\><C-N><C-W>k")
tmap("<C-W>l", "<C-\\><C-N><C-W>l")

-- Flutter
nmap("<leader>fc", ":Telescope flutter commands<CR>")

nmap("<F11>", ":set spell!<cr>")
imap("<F11>", "<C-O>:set spell!<cr>")

imap("<C-p>", "<C-O>:Copilot panel<CR>")

imap('<C-c>', '<C-O>:echo "Use kj to exit insert mode!!!"<CR>')
imap('kj', '<Esc>')
nmap('ss', ':update<CR>')
