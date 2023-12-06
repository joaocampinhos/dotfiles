-- credit to original theme for existing : https://github.com/kdheepak/monochrome.nvim
-- NOTE: This is a modified version of it

local M = {}

M.base_30 = {
  white = "#D8DEE9",
  darker_black = "#1a1a1a",
  black = "#191919", --  nvim bg
  black2 = "#202020",
  one_bg = "#242424",
  one_bg2 = "#2e2e2e",
  one_bg3 = "#383838",
  grey = "#424242",
  grey_fg = "#4c4c4c",
  grey_fg2 = "#606060",
  light_grey = "#677777",
  red = "#DE6E7C", -- Errors
  baby_pink = "#eca8a8",
  pink = "#da838b",
  line = "#2e2e2e", -- for lines like vertsplit
  green = "#819b69",
  vibrant_green = "#eff6ab",
  blue = "#8abae1",
  nord_blue = "#a5c6e1",
  yellow = "#ffe6b5",
  sun = "#eff6ab",
  purple = "#e1bee9",
  dark_purple = "#db9fe9",
  teal = "#6484a4",
  orange = "#efb6a0",
  cyan = "#9aafe6",
  statusline_bg = "#1e1e1e",
  lightbg = "#2e2e2e",
  pmenu_bg = "#859ba2",
  folder_bg = "#7797b7",
}

M.base_16 = {
  base00 = "#191919", -- Bg
  base01 = "#191919", -- Search
  base02 = "#66a5ad", -- selection
  base03 = "#ff00ff", -- ????
  base04 = "#ff00ff", -- ????
  base05 = "#bbbbbb", -- equal signs
  base06 = "#ff00ff", -- ????
  base07 = "#ff00ff", -- ????
  base08 = "#555555", -- text
  base09 = "#cfcfcf", -- values
  base0A = "#8e8e8e", -- types | classes
  base0B = "#cfcfcf", -- strings
  base0C = "#3d3839", -- brackets
  base0D = "#cfcfcf", -- method calling
  base0E = "#bbbbbb", -- return | const
  base0F = "#3d3839", -- . , ;
}

M.polish_hl = {
  ["@punctuation.bracket"] = { fg = M.base_30.darker_black },
}

M.type = "dark"

M = require("base46").override_theme(M, "mono")

return M

