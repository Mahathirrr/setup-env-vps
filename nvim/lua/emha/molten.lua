return {
  {
    "benlubas/molten-nvim",
    dependencies = {
      "3rd/image.nvim",
    },
    ft = { "python", "markdown", "quarto", "qmd", "jupyter" },
    cmd = { "MoltenInit", "MoltenInfo" },
    build = ":UpdateRemotePlugins",
    init = function()
      -- these are examples, not defaults. Please see the readme
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 20
      vim.g.molten_auto_open_output = false
      vim.g.molten_auto_image_popup = true
      vim.g.molten_output_show_exec_time = true
    end,
    event = "BufEnter",
  },
}
