return {
    {
        "andymass/vim-matchup",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            matchup_matchparen_offscreen = { method = "popup" },
        },
        init = function()
            -- disable legacy matchparen plugin
            vim.g.loaded_matchparen = 1
        end,
        config = function(_, opts)
            vim.g.matchup_matchparen_offscreen = opts.matchup_matchparen_offscreen
            require 'nvim-treesitter.configs'.setup {
                matchup = {
                    enable = true,
                    disable = {},
                    disable_virtual_text = false,
                    include_match_words = true,
                },
            }
        end,
    },
}
