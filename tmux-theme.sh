#### COLOUR

tm_icon="🙊"
tm_color_statusbar=colour129
tm_color_active=colour129
tm_color_inactive=colour241
tm_active_border_color=colour129

set -g status-left-length 32
set -g status-right-length 50
set -g status-interval 5

# default statusbar colors
# set-option -g status-bg colour0
set-option -g status-fg $tm_color_statusbar
set-option -g status-bg default
set-option -g status-style default

# default window title colors
set-window-option -g window-status-style bg=default,fg=$tm_color_inactive
#set -g window-status-format "#I #W"

# active window title colors
set-window-option -g window-status-current-style fg=$tm_color_active,bg=default
#set-window-option -g  window-status-current-format "#[bold]#I #W"

# pane border
set-option -g pane-border-style fg=$tm_color_inactive
set-option -g pane-active-border-style fg=$tm_active_border_color

# message text
set-option -g message-style fg=$tm_color_active,bg=default

# pane number display
set-option -g display-panes-active-colour $tm_color_active
set-option -g display-panes-colour $tm_color_inactive
