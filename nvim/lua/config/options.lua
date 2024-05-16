-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.signcolumn = "yes"
vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

vim.g.coq_settings = {
    auto_start = "shut-up",
    completion = {
        always = false,
    },
    keymap = {
        pre_select = false,
        manual_complete = "<c-p>",
    },
    limits = {
        completion_manual_timeout = 0.166,
    },
}
vim.g.slime_python_ipython = 1

vim.g.vimtex_view_method = "skim"
vim.g.vimtex_compiler_progname = "nvr"
vim.g.tex_flavor = "latex"
vim.g.vimtex_view_skim_sync = 1
vim.g.vimtex_view_skim_activate = 1
vim.g.livepreview_previewer = "open -a Skim"
vim.g.vimtex_compiler_latexmk = {
    backend = "nvim",
    background = 1,
    build_dir = "",
    callback = 1,
    continuous = 1,
    executable = "latexmk",
    options = {
        "-pvc",
        "-shell-escape",
        "-verbose",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode",
    },
}
