-- local on_attach = require("amyth.keymaps").on_attach
-- local capabilities = require("completions").capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local Utils = require("amyth.utils")
-- local cmp = require("cmp")

local nnoremap = Utils.nnoremap

local on_attach = function(_,_)
	nnoremap('<leader>rn', vim.lsp.buf.rename, 'rename the symbol under cursor')
	nnoremap('<leader>ca', vim.lsp.buf.code_action, 'list all the code actions')
	nnoremap('gd', vim.lsp.buf.definition, 'go to the Defintion')
	nnoremap('gi', vim.lsp.buf.implementation, 'go to the Implementation')
	nnoremap('gr', require('telescope.builtin').lsp_references, 'go to References')
	nnoremap('<leader>ds', require('telescope.builtin').lsp_document_symbols, 'lsp document symbols')
	nnoremap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols , 'lsp dynamic workspace symbols')
	-- See `:help K` for why this keymap
	nnoremap('K', vim.lsp.buf.hover, 'Hover Documentation')
	nnoremap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
	-- Lesser used LSP functionality
	nnoremap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
	nnoremap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
	nnoremap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
	nnoremap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
	nnoremap('<leader>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, '[W]orkspace [L]ist Folders')
	-- Create a command `:Format` local to the LSP buffer
	-- vim.api.nvim_buf_create_user_command(bufnr, 'Format', vim.lsp.buf.format or vim.lsp.buf.formatting,
	-- 	'Format current buffer with LSP' })
end

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
