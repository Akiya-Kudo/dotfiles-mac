local wezterm = require 'wezterm'

local module = {}

function module.apply_to_config(config)
    config.color_scheme = 'Black Metal (Mayhem) (base16)'

    -- colors
    config.colors = {
        -- prompt
        background = '#000000',
        foreground = '#ffffff',
        split = '#cd9b5b',
        cursor_border = '#f28705',
        cursor_fg = '#ffffff',
        cursor_bg = '#f28705',
        selection_fg = '#ffffff',
        selection_bg = '#26416e',
        -- tab bar
        tab_bar = {
            background = 'rgba(255, 255, 255, 0)',
            active_tab = {
                bg_color = '#f28705',
                fg_color = '#ffffff',
            },
            inactive_tab = {
                bg_color = '#907b51',
                fg_color = '#ffffff',
            },
        },
    }
    
    -- cursor
    config.default_cursor_style = 'SteadyBar'
    -- config.default_cursor_style = 'BlinkingBar'
    -- config.visual_bell = {
    --     fade_in_function = 'EaseIn',
    --     fade_in_duration_ms = 15,
    --     fade_out_function = 'EaseOut',
    --     fade_out_duration_ms = 15,
    -- }

    -- opacity
    config.window_background_opacity = 0.6
    config.macos_window_background_blur = 12

    -- window decorations
    config.window_decorations = "RESIZE"

    -- padding
    config.window_padding = {
        left = 24,
        right = 24,
        top = 24,
        bottom = 24,
    }
    
    -- inactive pane color
    config.inactive_pane_hsb = {
        saturation = 0.4,
        brightness = 0.4,
    }
end

-- タブタイトルを現在のディレクトリ名に設定
wezterm.on('format-tab-title', function(tab)
    local cwd = tab.active_pane.current_working_dir.file_path or ''
    local name = string.match(cwd, '[^/]+$') or 'WEZTERM'
    if #name > 20 then
        name = string.sub(name, 1, 20) .. '...'
    end
    return { { Text = ' ' .. name .. ' ' } }
end)


-- return our module table
return module
