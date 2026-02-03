return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false, -- nvim-treesitter explicitly says it does not support lazy-loading
        build = ":TSUpdate", -- keep parsers in sync with the plugin
        config = function()
            local ts = require("nvim-treesitter")
            ts.install({
                "r",
                "rnoweb",
                "bash",
                "c",
                "diff",
                "html",
                "json",
                "lua",
                "luadoc",
                "luap",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "toml",
                "tsx",
                "vim",
                "vimdoc",
                "xml",
                "yaml",
            })

            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    pcall(vim.treesitter.start)
                end,
            })
        end,
    },
}
