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
        -- 矢印キーでも単語移動できるように
        {
            key = "RightArrow",
            mods = "ALT",
            action = wezterm.action.SendKey {
                key = "f",
                mods = "META",
            },
        },
        -- 矢印キーでも単語移動できるように
        {
            key = "LeftArrow",
            mods = "ALT",
            action = wezterm.action.SendKey {
                key = "b",
                mods = "META",
            },
        },
        -- backspaceで単語ごとの削除ができるように
        {
            key = "Backspace",
            mods = "ALT",
            action = wezterm.action.SendKey {
                key = "w",
                mods = "CTRL",
            },
        },
	-- delete all
	{
        key = "Backspace",
        mods = "CMD",
        action = wezterm.action.SendKey {
            key = "Backspace",
            mods = "CTRL",
        },
	},
        -- pane direction
        {key="LeftArrow", mods="CMD|SHIFT", action=wezterm.action.ActivatePaneDirection("Left")},
        {key="RightArrow", mods="CMD|SHIFT", action=wezterm.action.ActivatePaneDirection("Right")},
        {key="UpArrow", mods="CMD|SHIFT", action=wezterm.action.ActivatePaneDirection("Up")},
        {key="DownArrow", mods="CMD|SHIFT", action=wezterm.action.ActivatePaneDirection("Down")},
        -- close pane
        {
            key = "w",
            mods = "CMD|SHIFT",
            action = wezterm.action.CloseCurrentPane { confirm = false },
        },
    }
    -- tabやpaneの削除confirmationを表示したい場合は下記を有効にする
    -- 空のリストにすることで、すべてのプロセスで確認ダイアログが表示される
    -- config.skip_close_confirmation_for_processes_named = {}
end

-- return our module table
return module
