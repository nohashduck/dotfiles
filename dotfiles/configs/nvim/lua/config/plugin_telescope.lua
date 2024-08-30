return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" };
    keys = {
        { "<leader>f", "<cmd>Telescope live_grep<cr>" }
    },
}
