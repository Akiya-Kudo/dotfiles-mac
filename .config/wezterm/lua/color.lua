local module = {}

function module.apply_to_config(config)
    config.background = '#000000'
    config.foreground = '#ffffff'
    config.color_scheme = 'iceberg-dark'
    config.window_background_opacity = 0.3,
    config.macos_window_background_blur = 15,
end

-- return our module table
return module