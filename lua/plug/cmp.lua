--[[
    File: cmp.lua
    Description: CMP plugin configuration (with lspconfig)
    See: https://github.com/hrsh7th/nvim-cmp
]]
require "utils/aliases"

local luasnip = require('luasnip')
local cmp = require('cmp')

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- Luasnip expand
        end,
    },

    -- Mappings for cmp
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = function(fallback)
            if fn.pumvisible() == 1 then
                fn.feedkeys(api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
            elseif luasnip.expand_or_jumpable() then
                fn.feedkeys(api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if fn.pumvisible() == 1 then
                fn.feedkeys(api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
            elseif luasnip.jumpable(-1) then
                fn.feedkeys(api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
            else
                fallback()
            end
        end,
    },

    sources = cmp.config.sources({
        { name = 'nvim_lsp' },                -- LSP
        { name = 'nvim_lsp_signature_help' }, -- LSP for parameters in functions
        { name = 'nvim_lua' },                -- Lua Neovim API
        { name = 'luasnip' },                 -- Luasnip
        { name = 'buffer' },                  -- Buffers
        { name = 'path' },                    -- Paths
        { name = "emoji" },                   -- Emoji
    }),
}

-- Add snippets from Friendly Snippets
require("luasnip/loaders/from_vscode").lazy_load()
