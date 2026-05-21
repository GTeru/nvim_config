-- lazy.nvim
return {
  "folke/snacks.nvim",
  opts = {
    picker = {},
    explorer = {},
  },
  keys = {
    {
      "<leader><space>",
      function()
        Snacks.picker.files({ hidden = true, ignored = true })
      end,
      desc = "Find files",
    },
  },
}
