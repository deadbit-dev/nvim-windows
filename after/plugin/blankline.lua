local blankline = require("indent_blankline")

vim.g.indent_blankline_char = '¦'

blankline.setup {
    show_current_context = true,
    --show_current_context_start = true
}
