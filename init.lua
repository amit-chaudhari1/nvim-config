require("utils")
require("keymaps")
require("options")
require('lsp-config')
require("lua-snip-config")
require("completions")
require("plugins")
require('fancylualine')
require('telescope-config')
require('treesitter-config')
require('gitsigns-config')
require('nvim-tree-config')
require('Comment').setup() -- noNeed for a custom setup felt yet
require('formatter-config')


-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
require('indent_blankline').setup {
  -- char = '┊',
  -- char = '|',
  char = '|',
  -- char = '`',
  show_trailing_blankline_indent = false,
}

-- workaround for wsl clipboard
if vim.fn.has('wsl') == 1 then
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = { ["+"] = { "clip.exe" },["*"] = { "clip.exe" } },
    paste = {
      ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
  }
end

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
