local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
        print("lspconfig not found")
        return
end

require('mason').setup()
require('mason-lspconfig').setup()
require('mason-lspconfig').setup_handlers {
        function(server_name)
                local opts = {
                        on_attach = require("user.lsp.handlers").on_attach,
                        capabilities = require("user.lsp.handlers").capabilities,
                        single_file_support = true,
                }

                require("lspconfig")[server_name].setup(opts)
        end
}

vim.diagnostic.config({
        update_in_insert = true
})

