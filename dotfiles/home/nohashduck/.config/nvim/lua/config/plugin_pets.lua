return {
    "nohashduck/pets.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "giusgad/hologram.nvim",
    },

    config = function()
        require("pets").setup {
            row = 5,
            speed_multiplier = 1,
            death_animation = true,
            popup = {
                width = "25%",
            },
        };
    end
}
