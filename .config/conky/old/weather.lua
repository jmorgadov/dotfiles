conky.config = {
    alignment = 'bottom_left',
    background = false,
    border_width = 1,
    cpu_avg_samples = 2,
    default_color = '#eeeeee',
    default_outline_color = 'white',
    default_shade_color = 'black',
    double_buffer = true,
    draw_borders = false,
    draw_graph_borders = true,
    draw_outline = false,
    draw_shades = false,
    extra_newline = false,
    font = 'Iosevka Nerd Font:size=14',
    gap_x = 30,
    gap_y = 8,
    minimum_height = 5,
    minimum_width = 5,
    net_avg_samples = 2,
    no_buffers = true,
    out_to_console = false,
    out_to_ncurses = false,
    out_to_stderr = false,
    out_to_x = true,
    own_window = true,
    own_window_class = 'Conky',
    show_graph_range = false,
    show_graph_scale = false,
    stippled_borders = 0,
    update_interval = 1.0,
    uppercase = false,
    use_spacer = 'none',
    use_xft = true,
    own_window_transparent = false,
	own_window_argb_visual = true,
	own_window_argb_value = 0,
	own_window_type = 'override',
	own_window_hints = 'undecorated,below,sticky,skip_taskbar,skip_pager',
}

conky.text = [[
${execi 300 $HOME/.config/conky/weather}
${font Iosevka Nerd Font:bold:size=50}${execi 100 cat ~/.cache/weather.json | jq -r '.name'}${font :size=22}
${font Iosevka Nerd Font:size=16}  ${execi 60 cat $HOME/.cache/weather.json | jq '.sys.sunrise' | xargs -I {} date --date @{} +%I:%M:%S%P}  \
  ${execi 60 cat $HOME/.cache/weather.json | jq '.sys.sunset' | xargs -I {} date --date @{} +%I:%M:%S%P}${font :size=8}

${voffset -20}${font Iosevka Nerd Font:size=100}${execi 15 $HOME/.config/conky/weather-text-icon}${font}\
${offset 120}${voffset -85}${font Iosevka Nerd Font:bold:size=64}${execi 60 cat $HOME/.cache/weather.json | jq '.main.temp' | awk '{printf "%.0f",$1}'}°C\
${font Iosevka Nerd Font:italic:size=24} feels ${execi 60 cat $HOME/.cache/weather.json | jq '.main.feels_like' | awk '{printf "%.0f",$1}'}°C${font}
${offset 190}${font Iosevka Nerd Font:size=24}${execi 60 cat ~/.cache/weather.json | jq -r '.weather[0].description' | sed "s|\<.|\U&|g"}${font}\
${offset 30}${voffset -2}${font Iosevka Nerd Font:size=15} ${execi 60 (cat ~/.cache/weather.json | jq '.main.humidity')}%  \
${font Iosevka Nerd Font:size=15}  ${execi 60 (cat ~/.cache/weather.json | jq '.wind.speed')}m/s
]]
