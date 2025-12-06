local module = {}

function module.apply_to_config(config)
    config.color_scheme = 'Black Metal (Mayhem) (base16)'

    -- text style
    config.colors = {
        background = '#000000',
        foreground = '#ffffff',
        split = '#f28705',
        cursor_border = '#f28705',
        cursor_fg = '#ffffff',
        cursor_bg = '#f28705',
        selection_fg = '#ffffff',
        selection_bg = '#26416e',
    }
    
    -- MEMO: cursor style
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
end

-- return our module table
return module