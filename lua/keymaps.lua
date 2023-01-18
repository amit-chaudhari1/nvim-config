local Utils = require("utils")

local exprnnoremap = Utils.exprnnoremap
local nnoremap = Utils.nnoremap
local vnoremap = Utils.vnoremap
local xnoremap = Utils.xnoremap
local inoremap = Utils.inoremap
local tnoremap = Utils.tnoremap
local nmap = Utils.tnoremap

-- Mapping Leader as Spacebar key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- TODO: leader timeout

-- Auto completion of matching stuff
-- inoremap("{", '{}<Esc>ha<CR><ESC>O')
-- inoremap("`", '``<Esc>ha<CR><ESC>O')
-- inoremap("[", '[]<Esc>ha')
-- inoremap("(", '()<Esc>ha')
-- inoremap("'", "''<Esc>ha")
-- inoremap('"', '""<Esc>ha')
-- inoremap('<', '<><Esc>ha')

-- yank to clipboard.
nnoremap("<leader>y", '"+y') -- yanking to clipboard from normal mode
vnoremap("<leader>y", '"+y') -- yanking to clipboard from visual mode
nnoremap('<leader>rc', ':so % ~/.config/nvim/init.lua <cr>') -- QOL thing for me to reload my config with leader rc

-- [[ Advanced Telescope Keymaps ]]
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files , { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- [[ Basic Telescope Keymaps ]]
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/',
	function() require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown { winblend = 32,
		previewer = false, }) end, { desc = '[/] Fuzzily search in current buffer]' })

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

