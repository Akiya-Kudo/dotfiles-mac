-- Pull in the wezterm API
local wezterm = require 'wezterm'

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-----------------------------------
-- Load modules
-----------------------------------
local color = require 'lua.color'
local font = require 'lua.font'

color.apply_to_config(config)
font.apply_to_config(config)

return config