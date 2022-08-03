local wezterm = require 'wezterm';

-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = utf8.char(0xe0b2)
-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = utf8.char(0xe0b0)

-- tab bar setting
wezterm.on(
    'format-tab-title',
    function(tab, tabs, panes, config, hover, max_width)
        local edge_background = '#0b0022'
        local bakcground = '#1b1032'
        local foreground = '#808080'

        if tab.is_active then
            background = '#2b2042'
            foreground = '#c0c0c0'
        elseif hover then
            background = '#3b3052'
            foreground = '#909090'
        end

        local edge_foreground = background

        -- ensure that the titles fit in the available space,
        -- and that we have room for the edges.
        local title = wezterm.truncate_right(tab.active_pane.title, max_width - 2)

        return {
            { Background = { Color = edge_background } },
            { Foreground = { Color = edge_foreground } },
            { Text = SOLID_LEFT_ARROW },
            { Background = { Color = background } },
            { Foreground = { Color = foreground } },
            { Text = title },
            { Background = { Color = edge_background } },
            { Foreground = { Color = edge_foreground } },
            { Text = SOLID_RIGHT_ARROW },
        }
    end
)

return {
    font = wezterm.font('JetBrains Mono', { weight = 'Bold', italic = true }),
    use_ime = true,
    font_size = 10.0,
    color_scheme = "iceberg-dark",
    adjust_window_size_when_changing_font_size = false,
    tab_bar_at_bottom = true,
}
