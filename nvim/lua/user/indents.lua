local function __indent_filetypes(ft, s)
        vim.api.nvim_create_autocmd("Filetype", {
                pattern = ft,
                command = "setlocal sw=".. s .. " ts=" .. s .. " sts=" .. s
        })
end

__indent_filetypes("html", "2")
__indent_filetypes("css", "2")
__indent_filetypes("javascript", "4")
__indent_filetypes("python", "4")
__indent_filetypes("c", "8")
__indent_filetypes("ruby", "2")
__indent_filetypes("lua", "8")
