function SetTransparent()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "none", fg = "#ffffff" })
    vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none", fg = "#cccccc" })
end

function SetGruvBox(is_transparent)
    require("gruvbox").setup({
        underline = false,
        italic = false,
        transparent_mode = false,
    })

    vim.cmd.colorscheme("gruvbox")

    if is_transparent then SetTransparent() end
end

function SetOneDark(is_transparent)
    local onedark = require("onedark")

    onedark.setup({
        transparent = true,
        term_colors = true,
        diagnostics = {
            background = false
        }
    })

    onedark.load()

    if is_transparent then SetTransparent() end
end

function SetJellyBeans(is_transparent)
    vim.cmd.colorscheme("jellybeans-nvim")

    if is_transparent then SetTransparent() end
end

SetJellyBeans()
