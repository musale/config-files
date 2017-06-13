set $mod Mod4

# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below.
font pango:System San Francisco Display 8


# start a terminal
bindsym $mod+Return exec i3-sensible-terminal
# bindsym $mod+Return exec gnome-terminal

# kill focused window
bindsym $mod+Shift+q kill

# start dmenu (a program launcher)
bindsym $mod+d exec dmenu_run
# There also is the (new) i3-dmenu-desktop which only displays applications
# shipping a .desktop file. It is a wrapper around dmenu, so you need that
# installed.
# bindsym $mod+d exec --no-startup-id i3-dmenu-desktop

# change focus
bindsym $mod+j focus left
bindsym $mod+k focus down
bindsym $mod+l focus up
bindsym $mod+semicolon focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+j move left
bindsym $mod+Shift+k move down
bindsym $mod+Shift+l move up
bindsym $mod+Shift+semicolon move right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# split in horizontal orientation
bindsym $mod+h split h

# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
#bindsym $mod+d focus child
#

set $wp1 "1:  "
set $wp2 "2:  "
set $wp3 "3:  "
set $wp4 "4:  "
set $wp5 "5:  "
set $wp6 "6:  "
set $wp7 "7:  "
set $wp8 "8:  "
set $wp9 "9:  "
set $wp10 "10:  "

# switch to workspace
bindsym $mod+1 workspace $wp1
bindsym $mod+2 workspace $wp2
bindsym $mod+3 workspace $wp3
bindsym $mod+4 workspace $wp4
bindsym $mod+5 workspace $wp5
bindsym $mod+6 workspace $wp6
bindsym $mod+7 workspace $wp7
bindsym $mod+8 workspace $wp8
bindsym $mod+9 workspace $wp9
bindsym $mod+0 workspace $wp10

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace $wp1
bindsym $mod+Shift+2 move container to workspace $wp2
bindsym $mod+Shift+3 move container to workspace $wp3
bindsym $mod+Shift+4 move container to workspace $wp4
bindsym $mod+Shift+5 move container to workspace $wp5
bindsym $mod+Shift+6 move container to workspace $wp6
bindsym $mod+Shift+7 move container to workspace $wp7
bindsym $mod+Shift+8 move container to workspace $wp8
bindsym $mod+Shift+9 move container to workspace $wp9
bindsym $mod+Shift+0 move container to workspace $wp10

# open my programs
bindsym $mod+Shift+a exec atom
bindsym $mod+Shift+n exec thunar
bindsym $mod+Shift+g exec google-chrome-stable
# bindsym $mod+Shift+s exec LANG=en_US.UTF-8 LC_CTYPE=en_US.UTF-8 subl

# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym j resize shrink width 10 px or 10 ppt
        bindsym k resize grow height 10 px or 10 ppt
        bindsym l resize shrink height 10 px or 10 ppt
        bindsym semicolon resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape
        bindsym Return mode "default"
        bindsym Escape mode "default"
}

bindsym $mod+r mode "resize"

bar {
      colors{
            background #000000
	    statusline #ffffff
	    separator #666666

	    focused_workspace #008fff #007fff #ffffff
	    active_workspace   #333333 #5f676a #ffffff
	    inactive_workspace #333333 #222222 #888888
	    urgent_workspace   #aa0000 #990000 #ffffff
      }
      status_command i3status -c ~/.config/i3/i3status.conf
font xft:Cousine, FontAwesome 9
}


# Pulse Audio controls
# bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume 0 +5% #increase sound volume
# bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume 0 -5% #decrease sound volume
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute 0 toggle # mute sound
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume 0 +5% && killall -SIGUSR1 i3status
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume 0 -5% && killall -SIGUSR1 i3status

# Sreen brightness controls
bindsym XF86MonBrightnessUp exec xbacklight -inc 5 # increase screen brightness
bindsym XF86MonBrightnessDown exec xbacklight -dec 5 # decrease screen brightness

# Touchpad controls
# bindsym XF86TouchpadToggle exec ~/.config/i3/toggletouchpad.sh # toggle touchpad

# Media player controls
bindsym XF86AudioPlay exec playerctl play
bindsym XF86AudioPause exec playerctl pause
bindsym XF86AudioNext exec playerctl next
bindsym XF86AudioPrev exec playerctl previous

# exec --no-startup-id feh --randomize --bg-fill ~/Pictures/Wallpapers/*
