require('lualine').setup({
    options = {
        icons_enabled = true,
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = {},
        lualine_c = { 'branch', 'filetype' },
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'progress', 'location', 'filesize' }
    }
})
