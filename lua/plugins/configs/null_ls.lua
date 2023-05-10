local null_ls = require("null-ls")

local python = {
    null_ls.builtins.formatting.black.with({
        args = { "--line-length", "80" },
    }),
    null_ls.builtins.formatting.isort
}

null_ls.register(python)
