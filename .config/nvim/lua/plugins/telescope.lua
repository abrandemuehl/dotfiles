return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        {
            "<leader>be",
            function()
                require('telescope.builtin').buffers()
            end,
            mode = { "n" }
        },
        {
            "<C-p>",
            function()
                require('telescope.builtin').git_files()
            end,
            mode = { "n" }
        }
    },
}
