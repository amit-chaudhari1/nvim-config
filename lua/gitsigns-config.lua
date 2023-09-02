-- Gitsigns
-- See `:help gitsigns.txt`
require('gitsigns').setup {
  signs = {
    add = { text = '👉' },
    change = { text = '✌️' },
    delete = { text = '💀' },
    topdelete = { text = '💀' },
    changedelete = { text = '☠️' },
  },
}
