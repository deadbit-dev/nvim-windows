local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
    'omnisharp',
	'pyright',
	'tsserver',
	'eslint',
	'sumneko_lua',
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	['<C-Space>'] = cmp.mapping.complete(),
})

lsp.set_preferences({
    setup_servers_on_start = true,
    cmp_capabilities = true,
	sign_icons = {
        error = 'x',
        warn = '!',
        hint = '',
        info = 'i'
    }
})

local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "ﬦ",
  TypeParameter = ""
}

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
    window = {
        completion = cmp.config.window.bordered()
    },
    formatting = {
        expandable_indicator = false,
        fields = {'menu', 'abbr', 'kind'},
        format = function(_, vim_item)
            vim_item.kind = string.format('%s ', kind_icons[vim_item.kind])
            return vim_item
        end
    },
})

lsp.on_attach(function(_, bufnr)
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
end)

local omnisharp_bin = "C:\\Users\\pavel\\AppData\\Local\\nvim-data\\mason\\packages\\omnisharp\\Omnisharp.exe"

lsp.configure('omnisharp', {
  handlers = {
    ["textDocument/definition"] = require('omnisharp_extended').handler,
  },
  cmd = { omnisharp_bin, '--languageserver' }, -- '--hostPID', tostring(pid)
})

lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = {
        prefix = '●'
    },
    underline = false,
    update_in_insert = true,
    float = {
        source = "always",
    },
})
