local Utils = require("utils")
local cmp = require("cmp")

local exprnnoremap = Utils.exprnnoremap
local nnoremap = Utils.nnoremap
local vnoremap = Utils.vnoremap
local xnoremap = Utils.xnoremap
local inoremap = Utils.inoremap
local tnoremap = Utils.tnoremap

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

-- nvim diagnostics
nnoremap( '[d', 'vim.lsp.diagnostic.goto_prev()<CR>', '')
nnoremap( '[d', 'lua vim.lsp.diagnostic.goto_next()<CR>', '')

-- nvimtree
nnoremap('<leader>t', require("nvim-tree.api").tree.toggle, 'Toggle NvimTree')

-- [[ Advanced Telescope Keymaps ]]
nnoremap('<leader>sf', require('telescope.builtin').find_files , '[S]earch [F]iles respect .gitignore' )
nnoremap('<leader>sh', require('telescope.builtin').help_tags, '[S]earch [H]elp' )
nnoremap('<leader>sw', require('telescope.builtin').grep_string, '[S]earch current [W]ord' )
nnoremap('<leader>se', require('telescope.builtin').live_grep, '[S]earch [E]verywhere' )
nnoremap('<leader>sd', require('telescope.builtin').diagnostics, '[S]earch [D]iagnostics' )
nnoremap('<leader>gf', require('telescope.builtin').git_files, 'Search [G]it [F]iles' )
nnoremap('<leader>gc', require('telescope.builtin').git_commits, 'Search [G]it [C]ommits' )
nnoremap('<leader>sb', require('telescope.builtin').buffers, '[S]earch all the [B]uffers' )

-- [[ Basic Telescope Keymaps ]]
nnoremap('<leader>?', require('telescope.builtin').oldfiles, '[?] Find recently opened files' )
nnoremap('<leader><space>', require('telescope.builtin').keymaps, 'List out all the keymaps (native+customs)' )
nnoremap('<leader>/',
	function() require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		previewer = false, }) end, '[/] Fuzzily search in current buffer]' )
nnoremap('<leader>dt', require("dapui").toggle, 'Toggle DAP UI')

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
-- vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- vnoremap('<Space>', '<Nop>',{ silent = true }) -- yanking to clipboard from visual mode
-- nnoremap('<Space>', '<Nop>',{ silent = true }) -- QOL thing for me to reload my config with leader rc
-- Remap for dealing with word wrap

exprnnoremap('k', 'v:count == 0 ? "gk" : "k"' )
exprnnoremap('j', 'v:count == 0 ? "gj" : "j"' )


-- if vim.lsp.buf_get_clients(0) > 0 then
-- 	nnoremap('<leader>rn', vim.lsp.buf.rename, 'rename the symbol under cursor')
-- 	nnoremap('<leader>ca', vim.lsp.buf.code_action, 'list all the code actions')
-- 	nnoremap('gd', vim.lsp.buf.definition, 'go to the Defintion')
-- 	nnoremap('gi', vim.lsp.buf.implementation, 'go to the Implementation')
-- 	nnoremap('gr', require('telescope.builtin').lsp_references, 'go to References')
-- 	nnoremap('<leader>ds', require('telescope.builtin').lsp_document_symbols, 'lsp document symbols')
-- 	nnoremap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols , 'lsp dynamic workspace symbols')
-- 	-- See `:help K` for why this keymap
-- 	nnoremap('K', vim.lsp.buf.hover, 'Hover Documentation')
-- 	nnoremap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
-- 	-- Lesser used LSP functionality
-- 	nnoremap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
-- 	nnoremap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
-- 	nnoremap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
-- 	nnoremap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
-- 	nnoremap('<leader>wl', function()
-- 		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- 		end, '[W]orkspace [L]ist Folders')
-- 	-- Create a command `:Format` local to the LSP buffer
-- 	-- vim.api.nvim_buf_create_user_command(bufnr, 'Format', vim.lsp.buf.format or vim.lsp.buf.formatting,
-- 	-- 	'Format current buffer with LSP' })
-- end

local keymaps = {}
-- [[ LSP SPECIFIC KEYMAPS ]]
function keymaps.on_attach (_,_)
	nnoremap('<leader>rn', vim.lsp.buf.rename, 'rename the symbol under cursor')
	nnoremap('<leader>ca', vim.lsp.buf.code_action, 'list all the code actions')
	nnoremap('gd', vim.lsp.buf.definition, 'go to the Defintion')
	nnoremap('gi', vim.lsp.buf.implementation, 'go to the Implementation')
	nnoremap('gr', require('telescope.builtin').lsp_references, 'go to References')
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

-- [[ COMPLETIONS KEYMAPS ]]
-- inoremap('<C-space>', cmp.mapping.complete(), 'Invoke CMP Completions which are LSP and LuaSnip exclusive')
-- inoremap('<Tab>', function()
-- 	if cmp.visible() then
-- 		cmp.select_next_item()
-- 	elseif require('luasnip').expand_or_jumpable() then
-- 		require('luasnip').expand_or_jump()
-- 		else cmp.mapping.complete()
-- 	end
-- 	end
-- )
-- inoremap('<S-Tab>', function()
-- 	if cmp.visible() then
-- 		cmp.select_prev_item()
-- 	elseif require('luasnip').expand_or_jumpable() then
-- 		require('luasnip').expand_or_jump()
-- 		else cmp.mapping.complete()
-- 	end
-- 	end
-- )
--
-- inoremap('C-d',  cmp.mapping.scroll_docs (-4))
-- inoremap('C-f',  cmp.mapping.scroll_docs (4))

-- inoremap('<CR>', function()
-- 	if cmp.visible() then
-- 		-- choose mapping
-- 		return cmp.mapping.confirm ({behavior = cmp.ConfirmBehavior.Replace})
-- 	else
-- 		return vim.api.nvim_input("<CR>")
-- 		-- pressed enter put in a carriage return line
-- 	end end, '')


-- ['<C-d>'] = cmp.mapping.scroll_docs(-4),
-- ['<C-f>'] = cmp.mapping.scroll_docs(4),
-- ['<C-Space>'] = cmp.mapping.complete(),
-- ['<CR>'] = cmp.mapping.confirm {
-- behavior = cmp.ConfirmBehavior.Replace,
-- select = true,
-- },
-- ['<Tab>'] = cmp.mapping(function(fallback)
-- if cmp.visible() then
-- cmp.select_next_item()
-- elseif luasnip.expand_or_jumpable() then
-- luasnip.expand_or_jump()
-- else
-- fallback()
-- end
-- end, { 'i', 's' }),
-- ['<S-Tab>'] = cmp.mapping(function(fallback)
-- if cmp.visible() then
-- cmp.select_prev_item()
-- elseif luasnip.jumpable(-1) then
-- luasnip.jump(-1)
-- else
-- fallback()
-- end
-- end, { 'i', 's' }),
-- }


-- local cmp_keymaps = function (_,_)
-- end

-- [[ TREE SITTER KEYMAPS ]]
-- -- incremental keymaps
-- init_selection = '<c-space>',
-- node_incremental = '<c-space>',
-- -- TODO: I'm not sure for this one.
-- scope_incremental = '<c-s>',
-- node_decremental = '<c-backspace>',
-- -- textobject keymaps
-- -- You can use the capture groups defined in textobjects.scm
-- ['af'] = '@functon.outer',
-- ['if'] = '@function.inner',
-- ['ac'] = '@class.outer',
-- ['ic'] = '@class.inner',
-- -- move keymaps
-- goto_next_start = {
-- [']m'] = '@function.outer',
-- [']]'] = '@class.outer',
-- },
-- goto_next_end = {
-- [']M'] = '@function.outer',
-- [']['] = '@class.outer',
-- },
-- goto_previous_start = {
-- ['[m'] = '@function.outer',
-- ['[['] = '@class.outer',
-- },
-- goto_previous_end = {
-- ['[M'] = '@function.outer',
-- ['[]'] = '@class.outer',
-- },
-- -- swap keymaps
-- swap_next = {
-- ['<leader>a'] = '@parameter.inner',
-- },
-- swap_previous = {
-- ['<leader>A'] = '@parameter.inner',

-- [[ FUGITIVE KEYMAPS ]]

return keymaps
