-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd("VimEnter", {
    desc = "Auto select virtualenv Nvim open",
    pattern = "*",
    callback = function()
        local venv = vim.fn.findfile("pyproject.toml", vim.fn.getcwd() .. ";")
        if venv ~= "" then
            require("venv-selector").retrieve_from_cache()
        end
    end,
    once = true,
})

-- Define a variable to keep track of whether the functionality is enabled or disabled
local highlightEnabled = true

-- Function to toggle the highlighting functionality on and off
function ToggleHighlight()
    highlightEnabled = not highlightEnabled
    if highlightEnabled then
        vim.cmd("match ErrorMsg /\\%>80v.*/")
    else
        vim.cmd("match none")
    end
end

-- Function to highlight the 81st character of each line
function HighlightEightyFirstCharacter()
    if highlightEnabled then
        vim.cmd("match ErrorMsg /\\%>80v.*/")
    end
end

-- Command to toggle the highlighting functionality
vim.cmd("command! ToggleHighlight lua ToggleHighlight()")

-- Call the function to highlight the 81st character initially
HighlightEightyFirstCharacter()

-- Map <leader>1 to toggle the highlighting functionality
vim.api.nvim_set_keymap(
    "n",
    "<leader>1",
    ":ToggleHighlight<CR>",
    { noremap = true, silent = true }
)

-- Define the Lua function to open a Neovim terminal in a vertical split
function OpenVerticalTerminal()
    vim.cmd("vsplit term://zsh")
    vim.cmd("startinsert")
end

-- Map <leader><leader> to the function
vim.api.nvim_set_keymap(
    "n",
    "<localleader><localleader>",
    "<cmd>lua OpenVerticalTerminal()<CR>",
    { noremap = true, silent = true }
)
