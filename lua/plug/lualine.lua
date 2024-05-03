local foo = function()
    return "hello"
end

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'monokai-pro',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
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
        lualine_b = { 'diagnostics', 'filename' },
        lualine_c = {},
        lualine_x = { 'fileformat', 'encoding' },
        lualine_y = { 'diff', 'branch' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = { 'mode' },
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = { 'lazy' }
}
