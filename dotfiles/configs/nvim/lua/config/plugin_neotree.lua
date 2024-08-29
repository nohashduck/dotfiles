return {
    "nvim-neo-tree/neo-tree.nvim", branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },

    keys = {
        { "<leader>d", "<cmd>Neotree float<cr>" },
    },

    config = function()
        require("neo-tree").setup {
            popup_border_style = "rounded",
            filesystem = {
                filtered_items = { hide_dotfiles = false, hide_gitignored = true },
                icons = { modified = " " },
            },
        };
    end
}
