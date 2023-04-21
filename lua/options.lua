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

-- Set colorscheme
vim.cmd [[colorscheme gruvbox]]
-- vim.cmd [[colorscheme monochrome]]
-- vim.cmd [[colorscheme karma]]
-- vim.cmd [[colorscheme onedark]]
-- vim.cmd [[colorscheme tokyonight-storm]]
-- vim.cmd [[colorscheme tokyonight]]

-- transparent background for alacritty
vim.cmd [[hi! Normal ctermbg=NONE guibg=NONE]]
vim.cmd [[hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE]]
