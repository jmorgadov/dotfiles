conky.config = {
    alignment = 'top_right',
    background = false,
    border_width = 1,
    cpu_avg_samples = 2,
    default_color = '#eeeeee',
    default_outline_color = 'white',
    default_shade_color = 'white',
    double_buffer = true,
    draw_borders = false,
    draw_graph_borders = true,
    draw_outline = false,
    draw_shades = false,
    extra_newline = false,
    font = 'Iosevka Term:size=12',
    gap_x = 30,
    gap_y = 60,
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
$color$sysname $nodename $kernel $machine
$hr
${color grey}Uptime:$color $uptime
${color grey}RAM:$color $mem $memperc% ${membar 6}
${color grey}CPU:$color $freq_g GHz $cpu% ${cpubar 6}
${color grey}Processes:$color $processes  ${color grey}
$hr
${color grey}File systems:
$color${fs_used /} ${fs_bar 6 /}
$hr
${color gray}Battery:$color $battery_time - $battery_status
$battery_percent% $battery_bar
$hr
${color grey}Name                 PID   CPU%   MEM%
${color lightgrey}${top name 1} ${top pid 1} ${top cpu 1} ${top mem 1}
${color lightgrey}${top name 2} ${top pid 2} ${top cpu 2} ${top mem 2}
${color lightgrey}${top name 3} ${top pid 3} ${top cpu 3} ${top mem 3}
${color lightgrey}${top name 4} ${top pid 4} ${top cpu 4} ${top mem 4}
]]
