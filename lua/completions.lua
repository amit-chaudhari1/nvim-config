-- COMPLETIONS AND SNIPPET SETUP
local cmp = require('cmp')

local luasnip = require 'luasnip'
local sources = {
    -- keyword_length
    -- max_item_count
    -- priority
    {name = 'luasnip', priority = 1, max_item_count = 2}, {name = 'nvim_lua'},
    {name = 'nvim_lsp'}, {name = 'calc'}, {name = 'git'},
    {name = 'buffer', max_item_count = 2}, {name = 'path'}, {name = 'emoji'}
}

cmp.setup {
    snippet = {expand = function(args) luasnip.lsp_expand(args.body) end},
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },

    mapping = cmp.mapping.preset.insert {
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        },
        -- ['<Tab>'] = cmp.mapping(function(fallback)
        --   if cmp.visible() then
        --     cmp.select_next_item()
        --   elseif luasnip.expand_or_jumpable() then
        --     luasnip.expand_or_jump()
        --   else
        --     fallback()
        --   end
        -- end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {'i', 's'})
    },
    sources = sources
}

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
