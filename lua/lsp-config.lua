local on_attach =require("keymaps")

require("mason").setup()
require("mason-lspconfig").setup({
ensure_installed = { "lua_ls"} })


require("lspconfig").lua_ls.setup {
  on_attach = on_attach
}

