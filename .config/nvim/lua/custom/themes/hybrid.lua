local M = {}
M.base_30 = {
  white = "#c5c8c6",
  darker_black = "#1b1c20",
  black = "#18191c", --  nvim bg
  black2 = "#373b41",
  one_bg = "#282a2e",
  one_bg2 = "#373b41",
  one_bg3 = "#282a2e",
  grey = "#707880",
  grey_fg = "#c5c8c6",
  grey_fg2 = "#c5c8c6",
  light_grey = "#c5c8c6",
  red = "#cc6666",
  baby_pink = "#FF6E79",
  pink = "#ff9ca3",
  line = "#282a2e", -- for lines like vertsplit
  green = "#b5bd68",
  vibrant_green = "#b5bd68",
  nord_blue = "#81a2be",
  blue = "#81a2be",
  yellow = "#f0c674",
  sun = "#f0c674",
  purple = "#b294bb",
  dark_purple = "#b294bb",
  teal = "#8abeb7",
  orange = "#de935f",
  cyan = "#8abeb7",
  statusline_bg = "#282a2e",
  lightbg = "#373b41",
  pmenu_bg = "#81a2be",
  folder_bg = "#81a2be",
}

M.base_16 = {
  base00 = "#18191c",
  base01 = "#282a2e",
  base02 = "#373b41",
  base03 = "#969896",
  base04 = "#b4b7b4",
  base05 = "#c5c8c6",
  base06 = "#e0e0e0",
  base07 = "#ffffff",
  base08 = "#cc6666",
  base09 = "#de935f",
  base0A = "#f0c674",
  base0B = "#b5bd68",
  base0C = "#8abeb7",
  base0D = "#81a2be",
  base0E = "#b294bb",
  base0F = "#a3685a",
}

M.type = "dark"

M.polish_hl = {
  ["@function.builtin"] = { fg = M.base_30.yellow },
  -- ["@punctuation.bracket"] = { fg = M.base_30.yellow },
}

M = require("base46").override_theme(M, "hybrid")

return M
