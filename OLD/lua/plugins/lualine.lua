local status, lualine = pcall(require, "lualine")
if (not status) then return end

lualine.setup({
    options = {
        icons_enabled = true,
        theme = 'ayu_mirage',
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = {},
        lualine_c = { 'branch', 'filetype' }, -- 'filename' },
        lualine_x = {},
        lualine_y = {}, -- 'location' },
        lualine_z = { 'progress', 'location', 'filesize' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {
        lualine_a = {
            {
                'buffers',
                show_filename_only = true,
                max_length = vim.o.columns,
                component_separators = { left = '', right = '' },
                mode = 0,
                buffers_color = {
                    active = 'lualine_a_normal',
                    inactive = 'lualine_a_inactive',
                },
                symbols = {
                    modified = ' ●',
                    alternate_file = '',
                    directory = '',
                },
            },
        },
        lualine_z = {
            {
                'tabs'
            }
        }
    },
    winbar = {},
    inactive_winbar = {},
    extensions = {}
})
