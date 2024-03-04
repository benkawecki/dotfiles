return {
  -- add gruvbox
  {
    "sainnhe/sonokai",
    opts = {
      sonokai_theme = "atlantis",
    },
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "sonokai",
    },
  },
}
