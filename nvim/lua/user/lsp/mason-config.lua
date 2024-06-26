local servers = {
        "lua_ls",
        "pyright",
        "jsonls",
        "bash_ls",
        "clangd",
        "cssls",
        "html",
        "solargraph",
        "tsserver",
        "yamlls"
}

local settings = {
        ui = { border = "none" },
        log_level = vim.log.levels.INFO,
        max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
        -- ensure_installed = servers,
        automatic_installation = true,
})

--[[
local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
        print("lspconfig not found")
	return
end
]]--

local opts = {}

for _, server in pairs(servers) do
        -- get table entries from handlers module
	opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]      -- 1 based index!

        -- get specific lsp settings from settings dir
	local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)    -- .. is concat operator
        if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
