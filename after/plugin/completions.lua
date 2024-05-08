-- COMPLETIONS AND SNIPPET SETUP
local cmp = require('cmp')

require("luasnip.loaders.from_vscode").lazy_load()

local luasnip = require 'luasnip'
local sources = {
    -- keyword_length
    -- max_item_count
    -- priority
    {name = 'nvim_lsp'},
    {name = 'calc'},
    {name = 'git'},
    {name = 'luasnip', max_item_count = 5},
    {name = 'nvim_lua'},
    {name = 'buffer', max_item_count = 5},
    {name = 'path'},
    -- {name = 'emoji'}
}

cmp.setup {
    snippet = {expand = function(args) luasnip.lsp_expand(args.body) end},
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },

    mapping = cmp.mapping.preset.insert {
        -- TODO: move to keymaps pelase
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        -- ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        },
        -- ["<Tab>"] = cmp.mapping.select_next_item({behavior=cmp.SelectBehavior.Insert}),
        -- ["<S-Tab>"] = cmp.mapping.select_prev_item({behavior=cmp.SelectBehavior.Insert}),
        -- ['<Tab>'] = cmp.mapping(function(fallback)
        --     if cmp.visible() then
        --         cmp.select_next_item()
        --     elseif luasnip.expand_or_jumpable() then
        --         luasnip.expand_or_jump()
        --     else
        --         fallback()
        --     end
        -- end, {'i', 's'}),
        -- ['<S-Tab>'] = cmp.mapping(function(fallback)
        --     if cmp.visible() then
        --         cmp.select_prev_item()
        --     elseif luasnip.jumpable(-1) then
        --         luasnip.jump(-1)
        --     else
        --         fallback()
        --     end
        -- end, {'i', 's'})
    },
    sources = sources
}

local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
