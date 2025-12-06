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
                bg_color = '#3c5768',
                fg_color = '#aaaaaa',
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
    config.window_background_opacity = 0.4
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
end

-- return our module table
return module