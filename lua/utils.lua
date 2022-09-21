local M = {}

-- :help map-modes
function M.map(mode, lhs, rhs, --[[optional]] desc )
	-- vim.api.nvim_set_keymap(mode, lhs, rhs, { silent = true })
	vim.keymap.set('n', lhs, rhs, {  desc = desc })
end

function M.noremap(mode, lhs, rhs, --[[optional]] desc)
	-- vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
	vim.keymap.set(mode, lhs, rhs, {  desc = desc })
end

function M.exprnoremap(mode, lhs, rhs, --[[optional]] desc)
	-- vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true, expr = true })
	vim.keymap.set(mode, lhs, rhs, {  desc = desc })
end

-- stylua: ignore start
function M.nmap(lhs, rhs, --[[optional]] desc) M.map('n', lhs, rhs, desc) end

-- A better function which could support Description text as well
-- Nah, I won't be using this though
-- local nmap = function(keys, func, desc)
--   if desc then
--     desc = 'LSP: ' .. desc
--   end
--
--   vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
-- end

function M.nnoremap(lhs, rhs, --[[optional]] desc) M.noremap('n', lhs, rhs) end

function M.vnoremap(lhs, rhs, --[[optional]] desc) M.noremap('v', lhs, rhs) end

function M.xnoremap(lhs, rhs, --[[optional]] desc) M.noremap('x', lhs, rhs) end

function M.inoremap(lhs, rhs, --[[optional]] desc) M.noremap('i', lhs, rhs) end

function M.tnoremap(lhs, rhs, --[[optional]] desc) M.noremap('t', lhs, rhs) end

function M.exprinoremap(lhs, rhs, --[[optional]] desc) M.exprnoremap('i', lhs, rhs) end

function M.exprnnoremap(lhs, rhs, --[[optional]] desc) M.exprnoremap('n', lhs, rhs) end

return M
-- stylua: ignore end
