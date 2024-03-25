return {
    {
        "jpalardy/vim-slime",
        init = function()
            vim.g.slime_target = "neovim"
            vim.g.slime_no_mappings = true
        end,
        config = function()
            vim.g.slime_input_pid = false
            vim.g.slime_suggest_default = true
            vim.g.slime_menu_config = false
            vim.keymap.set(
                "n",
                "gzz",
                "<Plug>SlimeMotionSend",
                { remap = true, silent = false }
            )
            vim.keymap.set(
                "n",
                "<leader><CR>",
                "<Plug>SlimeLineSend",
                { remap = true, silent = false }
            )
            vim.keymap.set(
                "x",
                "<leader><CR>",
                "<Plug>SlimeRegionSend",
                { remap = true, silent = false }
            )
            vim.keymap.set(
                "n",
                "gzc",
                "<Plug>SlimeConfig",
                { remap = true, silent = false }
            )
        end,
    },
}
