conky.config = {
    alignment = 'bottom_right',
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
    font = 'Iosevka Term:size=14',
    gap_x = 30,
    gap_y = 10,
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
${execp "cal | sed s/^/\${alignr}/"}

$alignr ${font Iosevka Nerd Font:size=20} Italy ${execi 1 TZ=Europe/Rome date "+%I:%M:%S %p"} 
$color${font Iosevka Term:bold:size=80} ${time %I:%M:%S %p}${font Iosevka Term:size=20}
$hr
$color $alignr ${font Iosevka Nerd Font:size=30}  ${time %A %d, %b %Y} 
]]
