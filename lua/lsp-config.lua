require('lspconfig').jsonls.setup {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas {
        select = {},
        ignore = {},
        replace = {},
      },
      validate = { enable = true },
    },
  },
}
