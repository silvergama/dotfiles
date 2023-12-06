return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      require("plugins.neo-tree")
      opts.filesystem.filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false
      }
    end,
  }
}
