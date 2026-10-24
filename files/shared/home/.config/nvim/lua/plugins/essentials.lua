return {
  -- Automatically close brackets and quotes
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  -- Git commands such as :Git, :Gcommit and :Gdiff
  {
    "tpope/vim-fugitive",
    cmd = "Git",
  },

  -- Git signs in the sign column
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },

  -- Detect indentation from existing files
  {
    "NMAC427/guess-indent.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
  },
}
