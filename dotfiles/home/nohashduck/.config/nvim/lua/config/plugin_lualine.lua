return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
        require("lualine").setup {
            icons_enabled = true,
            options = {
                component_separators = "",
                section_separators = { left = "", right = "" },
            },

            sections = {
                lualine_a = { "mode" },
                lualine_b = { "filename" },
                lualine_c = { },
                lualine_x = { },
                lualine_y = { "filetype" },
                lualine_z = { { "location", separator = { left = "" }, left_padding = 2 } },
            }
        }
    end
}
