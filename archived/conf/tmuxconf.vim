set -g mouse on

set-window-option -g mode-keys vi
bind-key -T copy-mode-vi v send-keys -X begin-selection
bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'xclip -in -selection clipboard'

set-option -sg escape-time 10
set-option -g default-terminal "screen-256color"
