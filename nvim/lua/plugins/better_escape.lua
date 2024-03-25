return {
    "max397574/better-escape.nvim",
    event = "VeryLazy",
    config = function()
        require("better_escape").setup({
            mapping = { "jk", "jj", "kj" },
            timeout = 200,
            clear_empty_lines = false,
            keys = "<Esc>",
        })
    end,
}
