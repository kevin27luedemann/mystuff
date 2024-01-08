# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

from qtile_extras import widget
from qtile_extras.widget.decorations import BorderDecoration


mod = "mod4"
terminal = "/home/luedemann/.local/kitty.app/bin/kitty"

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn("/home/luedemann/.local/kitty.app/bin/kitty"), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "q", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "e", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "d", lazy.spawn("dmenu_run"), desc="Spawn a command using a prompt widget"),
]

groups = []
group_names = ["1", "2", "3", "4", "5", "6", "7", "8", "9","0","ssharp"]

group_labels = ["1", "2", "3", "4", "5", "6", "7", "8", "9","10","11"]


group_layouts = [   "monadtall", "monadtall", "monadtall",
                    "monadtall", "monadtall", "monadtall",
                    "monadtall", "monadtall", "monadtall",
                    "monadtall", "monadtall"]

for i in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[i],
            layout=group_layouts[i].lower(),
            label=group_labels[i],
        ))

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=False),
                desc="Move focused window to group {}".format(i.name),
            ),
        ]
    )

layouts = [
    #layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=2),
    # layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
     layout.MonadTall(border_width=1),
     layout.MonadWide(border_width=1),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
     layout.Zoomy(),
]

widget_defaults = dict(
    font="sans",
    fontsize=13,
    padding=3,
)
extension_defaults = widget_defaults.copy()

SolarizedDark = [
    ["#002b36", "#002b36"], # bg
    ["#839496", "#839496"], # fg
    ["#073642", "#073642"], # color01
    ["#dc322f", "#dc322f"], # color02
    ["#859900", "#859900"], # color03
    ["#b58900", "#b58900"], # color04
    ["#268bd2", "#268bd2"], # color05
    ["#d33682", "#d33682"], # color06
    ["#2aa198", "#2aa198"]  # color15
    ]
colors = SolarizedDark

screens = [
    Screen(
        wallpaper="/home/luedemann/Documents/mystuff/logo_design/Logo_design.png",
        #wallpaper_mode="fill",
        bottom=bar.Bar(
            [
                widget.GroupBox(
                         fontsize = 13,
                         margin_y = 3,
                         margin_x = 4,
                         padding_y = 2,
                         padding_x = 3,
                         borderwidth = 3,
                         active = "#FFFFFF",
                         inactive = "#000050",
                         rounded = False,
                         highlight_color = "#000050",
                         highlight_method = "line",
                         this_current_screen_border = "#000050",
                         this_screen_border = "#000050",
                         other_current_screen_border = "#D50000",
                         other_screen_border = "#D50000",
                         ),
                widget.CurrentLayoutIcon(
                         foreground = "#FFFFFF",
                         padding = 2,
                         scale = 0.7
                         ),
                widget.CurrentLayout(
                         foreground = "#FFFFFF",
                         padding = 5
                         ),
                widget.TextBox(
                         text = '|',
                         font = "Ubuntu Mono",
                         foreground = "#FFFFFF",
                         padding = 2,
                         fontsize = 13
                         ),
                widget.WindowName(
                         foreground = "#FFFFFF",
                         max_chars = 40
                         ),
                #widget.Chord(
                #    chords_colors={
                #        "launch": ("#ff0000", "#ffffff"),
                #    },
                #    name_transform=lambda name: name.upper(),
                #),
                widget.Battery(
                         foreground = "#FFFFFF",
                         format = "{char} {percent:2.0%} {hour:d}:{min:02d}",
                         fmt = 'Bat: {}',
                         decorations=[
                             BorderDecoration(
                                 colour = "#000050",
                                 border_width = [0, 0, 2, 0],
                             )
                         ],
                    ),
                widget.Spacer(length = 8),
                widget.Backlight(
                         foreground = "#FFFFFF",
                         fmt = 'Light: {}',
                         backlight_name="intel_backlight",
                         decorations=[
                             BorderDecoration(
                                 colour = "#000050",
                                 border_width = [0, 0, 2, 0],
                             )
                         ],
                    ),
                widget.Spacer(length = 8),
                widget.Volume(
                         foreground = "#FFFFFF",
                         fmt = 'Vol: {}',
                         decorations=[
                             BorderDecoration(
                                 colour = "#000050",
                                 border_width = [0, 0, 2, 0],
                             )
                         ],
                         ),
                widget.Spacer(length = 8),
                widget.CPU(
                         format = 'CPU: {load_percent}%',
                         foreground = "#FFFFFF",
                         decorations=[
                             BorderDecoration(
                                 colour = "#000050",
                                 border_width = [0, 0, 2, 0],
                             )
                         ],
                         ),
                widget.Spacer(length = 8),
                widget.Memory(
                         foreground = "#FFFFFF",
                         mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal + " htop")},
                         format = '{MemUsed: .0f}{mm}',
                         fmt = 'Mem: {} used',
                         decorations=[
                             BorderDecoration(
                                 colour = "#000050",
                                 border_width = [0, 0, 2, 0],
                             )
                         ],
                         ),
                widget.Spacer(length = 8),
                widget.DF(
                         update_interval = 60,
                         foreground = "#FFFFFF",
                         mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(myTerm + ' -e df')},
                         partition = '/',
                         format = '{uf}{m} free',
                         fmt = 'Disk: {}',
                         visible_on_warn = False,
                         decorations=[
                             BorderDecoration(
                                 colour = "#000050",
                                 border_width = [0, 0, 2, 0],
                             )
                         ],
                         ),
                widget.Spacer(length = 8),
                widget.Clock(
                         foreground = "#FFFFFF",
                         format = "⏱  %a, %b %d - %H:%M",
                         decorations=[
                             BorderDecoration(
                                 colour = "#000050",
                                 border_width = [0, 0, 2, 0],
                             )
                             ],
                         ),
                widget.Spacer(length = 8),
                widget.Systray(padding = 3),
                widget.Spacer(length = 8),
            ],
            26,
        background="#D50000",
        border_width = [0,0,0,0],
        border_color= "#000050"
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
