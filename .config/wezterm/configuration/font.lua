local wezterm = require 'wezterm'

local module = {}

function module.apply_to_config(config)
    config.font_dirs = {
        -- 環境変数 HOME を使用して絶対パスを指定するのが確実です
        os.getenv('HOME') .. '/.config/font',
    }
    config.font = wezterm.font_with_fallback({
        'HackGen Console',
        'JetBrains Mono',
        'Noto Color Emoji',
        'Symbols Nerd Font Mono',
    })
    config.font_size = 13
end

return module
