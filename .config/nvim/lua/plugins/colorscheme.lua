-- TOKYDARK
-- return {
--   "tiagovla/tokyodark.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--       vim.cmd("colorscheme tokyodark")
--   end,
--}

--GRUVBOX
return {
  "morhetz/gruvbox",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd [[
      colorscheme gruvbox
      set background=light
    ]]
  end,
}
