-- Disable some default plugins that we have
vim.g.loaded_gzip = false
vim.g.loaded_matchit = false
vim.g.loaded = false
vim.g.loaded_netrwPlugin = false
vim.g.loaded_tarPlugin = false
vim.g.loaded_zipPlugin = false
vim.g.loaded_man = false
vim.g.loaded_2html_plugin = false
vim.g.loaded_remote_plugins = false
vim.g.did_load_filetypes = false

--show the diagnostics in a popout window
vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- Display title on top of tabs2
vim.o.title = true

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable relative numbering.
vim.wo.relativenumber = true
-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Set the cursor as a block even in insert mode
-- Decrease update time
vim.o.updatetime = 150
vim.wo.signcolumn = 'yes'

vim.o.termguicolors = true
--vim.g.karma_style = "day"

-- set the scroll off 9 lines before the last line, The scrolling will start from 09 lines before the top/bottom.
vim.o.scrolloff = 9

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

vim.o.hlsearch = true

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- vim.g.karma_style = "day"
vim.g.neoformat_try_node_exe = 1

-- Set colorscheme
-- vim.cmd [[colorscheme gruvbox]]
-- vim.cmd [[colorscheme monochrome]]
-- vim.cmd [[colorscheme karma]]
-- vim.cmd [[colorscheme onedark]]
-- vim.cmd [[colorscheme tokyonight-storm]]
-- vim.cmd [[colorscheme tokyonight]]
vim.cmd.colorscheme "catppuccin"

-- transparent background for alacritty
-- vim.cmd [[hi! Normal ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE]]
-- vim.cmd [[hi! SignColumn ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! LineNr ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! EndOfBuffer ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! VertSplit ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! Folded ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! FoldColumn ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! CursorLineNr ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! CursorLine ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! Cursor ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! NormalNC ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! Pmenu ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! PmenuSel ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! PmenuSbar ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! PmenuThumb ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! TabLine ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! TabLineFill ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! TabLineSel ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! StatusLine ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! StatusLineNC ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! SpellBad ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! SpellCap ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! SpellLocal ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! SpellRare ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! Visual ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! VisualNOS ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! QuickFixLine ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! Debug ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! DebugBreakpoint ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! Conceal ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! MatchParen ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! IncSearch ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! Search ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! SpecialKey ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! Title ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! Underlined ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! Undercurl ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! Error ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! WarningMsg ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! MoreMsg ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! Question ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! ModeMsg ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! MsgArea ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! MsgSeparator ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! Comment ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! Constant ctermbg=NONE guibg=NONE]]
-- vim.cmd [[hi! Highlight ctermbg=NONE guibg=NONE]]
