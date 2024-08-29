return {
    "nvim-treesitter/nvim-treesitter",

    config = function()
        require("nvim-treesitter.configs").setup {
            syns_install = false,
            auto_install = true,
            highlight = { enable = true },
        };
    end
}
