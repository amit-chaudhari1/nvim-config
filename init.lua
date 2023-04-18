require("utils")
require("keymaps")
require("options")
require("lua-snip-config")
require("completions")
require("plugins")
require('fancylualine')
require('managermason')
require('telescope-config')
require('treesitter-config')
require('gitsigns-config')
require('nvim-tree-config')
require('lsp-config')
require('Comment').setup() -- noNeed for a custom setup felt yet

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

-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

-- [[LSP SPECIFIC SHORT CUTS]]
local on_attach = function(_, bufnr)
  -- There were several lines of many normal mapping for lsp, which can now be found in keymaps.lua with their new nnoremap
end

require('lspconfig').lua_ls.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = { enable = false, },
    },
  },
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
