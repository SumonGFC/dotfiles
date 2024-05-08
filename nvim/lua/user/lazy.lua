local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("user.plugins")

-- Color tweeks lol 
require("catppuccin").setup({
        show_end_of_buffer = true,
        no_italic = true,
        no_bold = true,
        no_underline = true,
        --[[
        color_overrides = {
                mocha = {
                        base = "#101010" --"#12121B"
                }
        }]]--
})

