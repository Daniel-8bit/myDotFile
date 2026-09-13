local function safe_require(module_name)
    local ok, mod = pcall(require, module_name)
    if not ok then
        vim.notify("⚠️ Failed to load: " .. module_name .. "\n" .. mod, vim.log.levels.WARN)
        return nil
    end
    return mod
end

safe_require("core.options")
safe_require("core.keymaps")

require("config.lazy")