return {
    {
        "linux-cultist/venv-selector.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "nvim-telescope/telescope.nvim",
            "mfussenegger/nvim-dap-python",
        },
        opts = {
            search = {
                anaconda_base = false,
                anaconda_envs = false,
                cwd = false,
                file = false,
                hatch = false,
                miniconda_base = false,
                pipx = false,
                poetry = false,
                virtualenvs = false,
                workspace = false,
                pyenv = {
                    command = "$FD '/bin/python$' ~/.venv --no-ignore-vcs --full-path --color never -E pkgs/ -E envs/ -L",
                },
            },
        },
        event = "VeryLazy",
        keys = {
            { "<leader>vs", "<cmd>VenvSelect<cr>" },
            { "<leader>vc", "<cmd>VenvSelectCached<cr>" },
        },
    },
}
