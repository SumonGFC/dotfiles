local configs = require("nvim-treesitter.configs")

configs.setup {
        ensure_installed = {"c", "html", "javascript", "lua", "ruby", "python"},
        sync_install = false,   -- install parsers synchronously
        ignore_install = {""},  -- list of parsers to ignore_install
        highlight = {
                enable = true,
                disable = {""},
                additional_vim_regex_highlighting = true,
        },
        indent = { enable = false, disable = { "yaml" } }
}
