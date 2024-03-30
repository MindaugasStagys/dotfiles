-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre",
})
vim.keymap.set(
    "n",
    "<leader>sw",
    '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
    {
        desc = "Search current word",
    }
)
vim.keymap.set(
    "v",
    "<leader>sw",
    '<esc><cmd>lua require("spectre").open_visual()<CR>',
    {
        desc = "Search current word",
    }
)
vim.keymap.set(
    "n",
    "<leader>sp",
    '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
    {
        desc = "Search on current file",
    }
)
vim.keymap.set("n", "<localleader>w", function()
    require("nvim-python-repl").send_statement_definition()
end, { desc = "Send semantic unit to REPL" })
vim.keymap.set("v", "<localleader>w", function()
    require("nvim-python-repl").send_visual_to_repl()
end, { desc = "Send visual selection to REPL" })
vim.keymap.set("n", "<localleader>vs", function()
    require("nvim-python-repl").toggle_vertical()
end, { desc = "Create REPL in vertical or horizontal split" })

vim.keymap.set("n", "git", "<cmd>Neogit<CR>", {
    desc = "Open Neogit",
})

vim.keymap.set("n", "venv", "<cmd>VenvSelect<CR>", {
    desc = "Open venv selection",
})

vim.keymap.set("n", "rain", "<cmd>RainbowToggle<CR>", {
    desc = "Load rainbow parenthesis",
})
