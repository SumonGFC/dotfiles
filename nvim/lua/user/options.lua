vim.opt.backup = false                          -- creates a backup file
vim.opt.clipboard = "unnamedplus"		-- allows neovim to access the system clipboard
vim.opt.cmdheight = 2				-- allow more space for the neovim command line
vim.opt.completeopt = { "menuone", "noselect" }	-- mostly just for cmp
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.pumheight = 10                          -- pop up menu height vim.opt.showtabline = 2                         -- always show tabs
vim.opt.smartcase = true			-- smart case
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
-- vim.opt.undofile = true                         -- enable persistent undo
vim.opt.updatetime = 300                        -- faster completion (4000ms default)
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
-- vim.opt.cursorline = true                       -- highlight the current line
vim.opt.colorcolumn = '80'
vim.opt.number = true                           -- set numbered lines
vim.opt.relativenumber = true                   -- set relative numbered lines
vim.opt.numberwidth = 4                         -- set number column width to 2 {default 4}
vim.opt.wrap = true                            -- display lines as one long line
vim.opt.scrolloff = 8                           -- is one of my fav
vim.opt.sidescrolloff = 8
vim.opt.guifont = "monospace:h17"               -- the font used in graphical neovim applications
vim.opt.guicursor = "a:block,i-ci-ve-r:blinkwait1-blinkon350-blinkoff350"

-- vim.opt.termguicolors = true
-- vim.opt.background = 'dark'

vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.shiftwidth = 8                          -- the number of spaces inserted for each indentation
vim.opt.tabstop = 8                             -- insert spaces for a tab

vim.opt.signcolumn = "yes"
