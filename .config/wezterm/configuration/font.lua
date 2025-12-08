local wezterm = require 'wezterm'

local module = {}

function module.apply_to_config(config)
    -- config.font = wezterm.font_with_fallback("Symbols Nerd Font Mono", "JetBrains Mono", "Noto Color Emoji")
    config.font_size = 13
end

return module
