local M = {}

---@param plugin_name string
M.plugin_keymap_desc = function(plugin_name)
    ---@param desc string
    return function(desc)
        -- Capitalize plugin name and concat with desc
        return plugin_name:gsub("^%l", string.upper) .. ": " .. desc
    end
end

return M
