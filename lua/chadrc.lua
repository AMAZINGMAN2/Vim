-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua


---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "onedark",
  -- make transparent
  transparent_background = true,
  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.ui = {
  theme = "onedark",
  tabufline = {
    enabled = false,  -- Disable the tabline (tab bar)
  },  -- Add a comma here
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
  transparency = true,
}

return M
