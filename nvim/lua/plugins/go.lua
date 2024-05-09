--if true then
--return {}
--end
return {
  {
    "ray-x/go.nvim",
    dependancies = {
      "ra-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },

    config = function()
      require("go").setup()
    end,
    event = { "CmdLineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
  },
}
