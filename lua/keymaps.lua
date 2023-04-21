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
nnoremap("<leader>p", '"+p') -- yanking to clipboard from normal mode
vnoremap("<leader>y", '"+y') -- yanking to clipboard from visual mode
nnoremap('<leader>rc', ':so % ~/.config/nvim/init.lua <cr>') -- QOL thing for me to reload my config with leader rc

-- nvim tree toggle
nnoremap('<leader>t', require("nvim-tree.api").tree.toggle, 'Toggle NvimTree')

-- [[ Advanced Telescope Keymaps ]]
nnoremap('<leader>sf', require('telescope.builtin').find_files , '[S]earch [F]iles respect .gitignore' )
nnoremap('<leader>sh', require('telescope.builtin').help_tags, '[S]earch [H]elp' )
nnoremap('<leader>sw', require('telescope.builtin').grep_string, '[S]earch current [W]ord' )
nnoremap('<leader>sg', require('telescope.builtin').live_grep, '[S]earch by [G]rep' )
nnoremap('<leader>sd', require('telescope.builtin').diagnostics, '[S]earch [D]iagnostics' )
nnoremap('<leader>sgf', require('telescope.builtin').git_files, '[S]earch Git Files' )
nnoremap('<leader>sgc', require('telescope.builtin').git_commits, '[S]earch Git commits' )

nnoremap('<leader>sb', require('telescope.builtin').buffers, '[S]earch all the [B]uffers' )

-- [[ Basic Telescope Keymaps ]]
nnoremap('<leader>?', require('telescope.builtin').oldfiles, '[?] Find recently opened files' )
nnoremap('<leader><space>', require('telescope.builtin').keymaps, 'List out all the keymaps (native+customs)' )
nnoremap('<leader>/',
	function() require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		previewer = false, }) end, '[/] Fuzzily search in current buffer]' )

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
-- vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vnoremap('<Space>', '<Nop>',{ silent = true }) -- yanking to clipboard from visual mode
nnoremap('<Space>', '<Nop>',{ silent = true }) -- QOL thing for me to reload my config with leader rc
-- Remap for dealing with word wrap

exprnnoremap('k', 'v:count == 0 ? "gk" : "k"' )
exprnnoremap('j', 'v:count == 0 ? "gj" : "j"' )

-- [[ LSP SPECIFIC KEYMAPS ]]
local on_attach =  function (_,_)
	nnoremap('<leader>rn', vim.lsp.buf.rename, 'rename the symbol under cursor') nnoremap('<leader>ca', vim.lsp.buf.code_action, 'list all the code actions')
	nnoremap('gd', vim.lsp.buf.definition, 'go to the defintion')
	nnoremap('gi', vim.lsp.buf.implementation, 'go to the implementation')
	nnoremap('gr', require('telescope.builtin').lsp_references)
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
return on_attach
