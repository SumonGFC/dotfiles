require "user.options"
require "user.keymaps"
require "user.lazy"     -- plugins

-- vim.cmd "colorscheme darkplus"
vim.cmd "colorscheme vscode"

require "user.lsp"
require "user.lsp.settings"     -- empty for now
require "user.telescope-configs"
require "user.treesitter-configs"
require 'user.gitsigns-config'

require "user.indents"

-- :autocmd Filetype html setlocal ts=2 sw=2 expandtab
-- :autocmd Filetype css setlocal ts=2 sw=2 expandtab
-- :autocmd Filetype javascript setlocal ts=4 sw=4 sts=4 expandtab
-- :autocmd Filetype python setlocal ts=4 sw=4 sts=4 expandtab
-- :autocmd Filetype c setlocal ts=4 sw=4 sts=4 expandtab
-- :autocmd Filetype ruby setlocal ts=2 sw=2 sts=2 expandtab
