local null_ls = require('null-ls')
local on_attach = require('lsp.on_attach')
local methods = require("null-ls.methods")
local h = require("null-ls.helpers")

local sources = {
  -- formatters
  null_ls.builtins.formatting.json_tool,
  null_ls.builtins.formatting.prettierd,
  null_ls.builtins.formatting.eslint_d,
  null_ls.builtins.formatting.stylelint,
  null_ls.builtins.formatting.rustfmt,
  null_ls.builtins.formatting.trim_newlines,
  null_ls.builtins.formatting.trim_whitespace,

  -- diagnostics
  null_ls.builtins.diagnostics.pylint
}

null_ls.setup {sources = sources, on_attach = on_attach, debug=true}

local clang = {
  method = methods.internal.DIAGNOSTICS_ON_SAVE,
  filetypes = { "c", "cpp" },
  generator = null_ls.generator({
    command = "clang++",
    args = {
      "$FILENAME",
    },
    to_stdin = false,
    from_stderr = true,
    format = "line",
    on_output = h.diagnostics.from_pattern(
      [[^([^:]+):(%d+):(%d+):%s+([^:]+):%s+(.*)$]],
      -- [[(%w+):(%d+):(%d+): (%w+): (.*)]],
      { "file", "row", "col", "severity", "message" },
      {
        severities = {
          ["fatal error"] = h.diagnostics.severities.error,
          ["error"] = h.diagnostics.severities.error,
          ["note"] = h.diagnostics.severities.information,
          ["warning"] = h.diagnostics.severities.warning,
        },
      }
    ),
  }),
}
null_ls.register(clang)
