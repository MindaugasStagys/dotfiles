return {
    {
        "R-nvim/R.nvim",
        lazy = false,
        config = function()
            ---@type RConfigUserOpts
            local opts = {
                hook = {
                    on_filetype = function()
                        vim.api.nvim_buf_set_keymap(
                            0,
                            "n",
                            "<LocalLeader>d",
                            "<Plug>RDSendChunk",
                            { noremap = true }
                        )
                    end,
                },
            }
            require("r").setup(opts)
        end,
    },
    "R-nvim/cmp-r",
    {
        "hrsh7th/nvim-cmp",
        config = function()
            require("cmp").setup({ sources = { { name = "cmp_r" } } })
            require("cmp_r").setup({})
        end,
    },
}
