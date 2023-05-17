local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
   formatting.prettier,
   formatting.stylua,
   formatting.black,
	 formatting.json_tool,
	 formatting.rustfmt,
	 formatting.isort.with({
			args = { "--stdout", "--filename", "$FILENAME", "-" , "--profile", "black"}
		}),

		-- Bash
	 formatting.shfmt,

	 lint.pylint,
   lint.mypy,
   lint.shellcheck,
   lint.jsonlint,
}

null_ls.setup {
   debug = true,
   sources = sources,
   default_timeout = 20000,
   fallback_severity = vim.diagnostic.severity.INFO,
}
