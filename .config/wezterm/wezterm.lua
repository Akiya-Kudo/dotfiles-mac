-- Pull in the wezterm API
local wezterm = require 'wezterm'

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-----------------------------------
-- Load modules
-----------------------------------
local theme = require 'configuration.theme'
local font = require 'configuration.font'
local binding = require 'configuration.binding'

theme.apply_to_config(config)
font.apply_to_config(config)
binding.apply_to_config(config)

return config