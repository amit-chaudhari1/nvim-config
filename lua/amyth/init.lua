require("amyth.utils")
require("amyth.lazy")
-- require("amyth.dapui").setup()
require("amyth.options")
require("amyth.keymaps")
-- require("amyth.lsp-config")
-- require("amyth.lua-snip-config")
-- require("amyth.completions")
-- require("amyth.fancylualine")
-- require("amyth.telescope-config")
-- require("amyth.treesitter-config")
-- require("amyth.gitsigns-config")
-- require("amyth.nvim-tree-config")
-- require("amyth.Comment").setup() -- noNeed for a custom setup felt yet
-- require("amyth.formatter-config")
-- require("amyth.neodev").setup({
--  library = { plugins = { "nvim-dap-ui" }, types = true },
--  })

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
-- require("indent_blankline").setup {
--    char = '┊',
--   -- char = '|',
--   -- char = '|',
--   -- char = '`',
--   show_trailing_blankline_indent = false,
-- }

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

