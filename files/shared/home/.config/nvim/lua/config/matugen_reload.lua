local M = {}

function M.reload()
  package.loaded["config.matugen_colors"] = nil

  local ok, colors = pcall(require, "config.matugen_colors")
  if not ok then
    vim.notify(
      "Could not load Matugen colors: " .. tostring(colors),
      vim.log.levels.WARN
    )
    return
  end

  require("base16-colorscheme").setup(colors)
end

return M
