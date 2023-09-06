local on_attach = require("amyth.keymaps").on_attach
-- local capabilities = require("completions").capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lsp_options = {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 150,
    }
}

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✅",
            package_pending = "👉",
            package_uninstalled = "💀"
        }
    }
})

require("mason-lspconfig").setup({ensure_installed = {"lua_ls", "tsserver"}})

require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup(lsp_options)
    end,
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    ["rust_analyzer"] = function() require("rust-tools").setup {} end,
    ["clangd"] = function ()
        require("lspconfig").clangd.setup(vim.tbl_deep_extend("force", lsp_options, {
            capabilities = { offsetEncoding = { "utf-16" } }
        }))
    end,
    ["html"] = function ()
        require("lspconfig").html.setup(vim.tbl_deep_extend("force", lsp_options, {
            filetypes = {"html", "htmldjango"}
        }))
    end,
    ["cssls"] = function ()
        require("lspconfig").cssls.setup(vim.tbl_deep_extend("force", lsp_options, {
            capabilities = {
                textDocument = {
                    completion= {
                        completionItem = { snippetSupport = true }
                    }
                }
            },
        }))
    end,
}
