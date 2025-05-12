local paq = require('paq').paq

paq {'hrsh7th/cmp-nvim-lsp'}
paq {'hrsh7th/cmp-buffer'}
paq {'hrsh7th/cmp-path'}
paq {'hrsh7th/cmp-cmdline'}
paq {'hrsh7th/nvim-cmp'}
paq {'saadparwaiz1/cmp_luasnip'}

local cmp = require('cmp')
local luasnip = require('luasnip')

snippet = {
  expand = function(args)
    require('luasnip').lsp_expand(args.body)
  end,
}

sources = cmp.config.sources({
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
})

local function next_item(fallback)
    if cmp.visible() then
        cmp.select_next_item()
    else
        fallback()
    end
end

local function prev_item(fallback)
    if cmp.visible() then
        cmp.select_prev_item()
    else
        fallback()
    end
end

local function expand(fallback)
    if luasnip.expandable() then
        luasnip.expand()
    else
        fallback()
    end
end

local function jump_forward(fallback)
    if luasnip.jumpable(1) then
        luasnip.jump(1)
    end
end

local function jump_backward(fallback)
    if luasnip.jumpable(-1) then
        luasnip.jump(-1)
    end
end

local function choice_forward(fallback)
    if luasnip.choice_active() then
        luasnip.change_choice(1)
    end
end

local function choice_backward(fallback)
    if luasnip.choice_active() then
        luasnip.change_choice(-1)
    end
end

local function select_completion(fallback)
    entry = cmp.get_active_entry()

    if entry ~= nil then
        source = entry.source

        if source.name == "luasnip" then
            luasnip.expand()
        else
            cmp.complete()
            cmp.close()
        end
    else
        fallback()
    end
end

mapping = {
    ['<Tab>'] = cmp.mapping(expand, {"i"}),
    ['<C-k>'] = cmp.mapping(choice_forward, {"i", "s"}),
    ['<C-j>'] = cmp.mapping(choice_backward, {"i", "s"}),
    ['<C-l>'] = cmp.mapping(jump_forward, {"i", "s"}),
    ['<C-h>'] = cmp.mapping(jump_backward, {"i", "s"}),
    ['<CR>'] = cmp.mapping(select_completion, { "i" }),
    ['<C-n>'] = cmp.mapping(next_item, {"i"}),
    ['<C-p>'] = cmp.mapping(prev_item, {"i"}),
}

cmp.setup({
    snippet = snippet,
    mapping = mapping,
    sources = sources,
})
