local map = vim.keymap.set

-- Clear search highlighting
map("n", "<Esc>", vim.cmd.nohlsearch, {
  silent = true,
  desc = "Clear highlights and stay in normal mode",
})

-- Save
map("n", "<leader>w", vim.cmd.w, {
  silent = true,
  desc = "Save current file",
})

-- Open netrw in the current file's directory
map("n", "<leader>cd", function()
  vim.cmd.Ex(vim.fn.expand("%:p:h"))
end, {
  silent = true,
  desc = "Open netrw explorer in current file directory",
})

-- VimTeX: single compilation
map("n", "<leader>ll", function()
  vim.fn["vimtex#compiler#compile"]()
end, {
  silent = true,
  desc = "VimTeX: Compile currently open file",
})

-- VimTeX: continuous compilation
map("n", "<leader>lv", function()
  vim.fn["vimtex#compiler#start"]()
end, {
  silent = true,
  desc = "VimTeX: Start continuous compilation",
})

-- VimTeX: stop compilation
map("n", "<leader>lk", function()
  vim.fn["vimtex#compiler#stop"]()
end, {
  silent = true,
  desc = "VimTeX: Stop compilation",
})

-- Toggle line diagnostics
map("n", "<leader>e", function()
  local closed = false

  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local config = vim.api.nvim_win_get_config(win)

    if config.relative ~= "" then
      local buf = vim.api.nvim_win_get_buf(win)
      local ft = vim.bo[buf].filetype

      if ft == "" or ft == "diagnostic" then
        vim.api.nvim_win_close(win, true)
        closed = true
      end
    end
  end

  if not closed then
    vim.diagnostic.open_float({
      scope = "line",
      focus = false,
    })
  end
end, {
  silent = true,
  desc = "Toggle inline diagnostics for current line",
})

-- Next diagnostic
map("n", "]d", function()
  vim.diagnostic.jump({ count = 1 })
end, {
  desc = "Next diagnostic",
})

-- Exit insert mode with jk
map("i", "jk", "<Esc>", {
  silent = true,
  desc = "Exit insert mode",
})

-- Exit terminal mode
map("t", "<Esc>", "<C-\\><C-n>", {
  silent = true,
  desc = "Exit terminal mode",
})

-- Toggle/focus diagnostic list
map("n", "<leader>q", function()
  if vim.bo.filetype == "qf" then
    vim.cmd.lclose()
    return
  end

  local loclist = vim.fn.getloclist(0, { winid = 0 })

  if loclist.winid > 0 then
    vim.api.nvim_set_current_win(loclist.winid)
  else
    vim.diagnostic.setloclist()
    vim.cmd.lopen()
  end
end, {
  desc = "Toggle/focus diagnostic list",
})

-- LSP mappings: only active when a server attaches
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local buf = event.buf
    local opts = { buffer = buf }

    map("n", "gd", vim.lsp.buf.definition,
      vim.tbl_extend("force", opts, {
        desc = "Definition",
      }))

    map("n", "gD", vim.lsp.buf.declaration,
      vim.tbl_extend("force", opts, {
        desc = "Declaration",
      }))

    map("n", "gi", vim.lsp.buf.implementation,
      vim.tbl_extend("force", opts, {
        desc = "Implementation",
      }))

    map("n", "gr", function()
      require("telescope.builtin").lsp_references()
    end, vim.tbl_extend("force", opts, {
      desc = "References",
    }))

    map("n", "K", vim.lsp.buf.hover,
      vim.tbl_extend("force", opts, {
        desc = "Hover",
      }))

    map("n", "<leader>rn", vim.lsp.buf.rename,
      vim.tbl_extend("force", opts, {
        desc = "Rename",
      }))

    map("n", "<leader>ca", vim.lsp.buf.code_action,
      vim.tbl_extend("force", opts, {
        desc = "Code action",
      }))
  end,
})
