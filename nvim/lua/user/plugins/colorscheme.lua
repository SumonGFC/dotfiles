local spec =  {
        {
                "LunarVim/Colorschemes"
        },
        {
                "catppuccin/nvim"
        },
        {
                "Mofiqul/vscode.nvim",
                config = function()
                        require('vscode').setup({
                                color_overrides = {
                                        vscBack = "#0a0a0a"
                                }
                        })
                end
        },
}





return spec
