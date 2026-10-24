return {
  {
    "RRethy/base16-nvim",
    lazy = false,
    priority = 1000,

    config = function()
      vim.opt.termguicolors = true
      
      require("config.matugen_reload").reload()

      local function_groups = {
        "@function",
        "@function.call",
        "@function.builtin",
        "@method",
        "@method.call",
      }

      for _, group in ipairs(function_groups) do
        vim.api.nvim_set_hl(0, group, { italic = false })
      end
    end,
  },
}

