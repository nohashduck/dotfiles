
return {
    "nvimdev/dashboard-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = 'VimEnter',
    keys = {
        { "<leader>m", "<cmd>Dashboard<cr>" }
    },

    config = function()
        require('dashboard').setup {
            theme = 'doom',
            config = {
                header = { },
                center = {
                    {
                        icon = ' ',
                        desc = ' Lazy',
                        desc_hl = 'String',
                        key = 'l',
                        key_hl = 'Number',
                        action = 'Lazy',
                    },
                    {
                        icon = ' ',
                        desc = ' Mason',
                        desc_hl = 'String',
                        key = 'm',
                        key_hl = 'Number',
                        action = 'Mason',
                    },
                    {
                        icon = ' ',
                        desc = ' Exit',
                        desc_hl = 'String',
                        key = 'q',
                        key_hl = 'Number',
                        action = 'q',
                    },
                },
                footer = { },
            },
        }
    end
}
