local opt = vim.opt

opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'
opt.fillchars = { eob = ' ' }
opt.clipboard = 'unnamedplus'
opt.title = true
opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smarttab = true
opt.autoindent = true
opt.autoread = true
opt.smartindent = true
opt.termguicolors = true
opt.wrap = false
opt.swapfile = false
opt.updatetime = 250

-- MOVE THEME OPTIONS TO THEME FILE

local cmd = vim.cmd
cmd('colorscheme tokyonight-night')

local api = vim.api
api.nvim_set_hl(0, "FloatBorder", { bg = "#1a1b26", fg = "#5E81AC" })
api.nvim_set_hl(0, "NormalFloat", { bg = "#1a1b26" })
api.nvim_set_hl(0, "TelescopeNormal", { bg = "#1a1b26" })
api.nvim_set_hl(0, "TelescopeBorder", { bg = "#1a1b26" })
