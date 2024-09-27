return {
    "numToStr/Comment.nvim",
    keys = {
        { "<C-/>", "<Plug>(comment_toggle_linewise_current)", mode = "n" },
        { "<C-/>", "<Plug>(comment_toggle_linewise_visual)", mode = "v" },
    },

    config = function()
        require("Comment").setup()
    end
}
