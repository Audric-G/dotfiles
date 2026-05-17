--hlsearch
return {
  "nvimdev/hlsearch.nvim",
  lazy = false,
  priority = 1002,
  config = function()
    require('hlsearch').setup()
  end,
}
