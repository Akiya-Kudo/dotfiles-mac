local wezterm = require 'wezterm'
local module = {}

function module.apply_to_config(config)
    config.keys = {
        {
            key = 'd',
            mods = 'CMD',
            action = wezterm.action.SplitHorizontal({ domain = 'CurrentPaneDomain' }),
        },
        {
            key=  'd',
            mods = 'CMD|SHIFT',
            action = wezterm.action.SplitVertical({ domain = 'CurrentPaneDomain'}),
        },
        {
            key = "RightArrow",
            mods = "ALT",
            action = wezterm.action.SendKey {
                key = "f",
                mods = "META",
            },
        },
        {
            key = "LeftArrow",
            mods = "ALT",
            action = wezterm.action.SendKey {
                key = "b",
                mods = "META",
            },
        },
        {
            key = "Backspace",
            mods = "ALT",
            action = wezterm.action.SendKey {
                key = "w",
                mods = "CTRL",
            },
        }
    }
end

-- return our module table
return module