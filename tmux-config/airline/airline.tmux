#!/usr/bin/env bash
main() {
  # dracula colors
  gray='#44475a'
  lightgray='#5f6a8e'
  orange='#ffb86c'
  purple='#bd93f9'
  red='#ff5555'
  yellow='#f1fa8c'
  green='#50fa7b'
  white='#f8f8f2'
  black='#282a36'

  left_sep=''
  right_sep=''
  right_alt_sep=''
  block='█'

  tmux set-option -g pane-border-style "fg=$lightgray"
  tmux set-option -g pane-active-border-style "fg=$white"
  tmux set-option -g status on
  tmux set-option -g status-left-length 100
  tmux set-option -g status-right-length 100
  tmux set-option -g status-bg "$gray"
  tmux set-option -g status-left "#[bg=$purple,fg=$black,bold] #S #[fg=$purple,bg=$gray,nobold]$right_sep"
  tmux set-option -g status-left-style "none"
  tmux set-option -g status-right "#[fg=$lightgray,bg=$gray]$left_sep#[fg=$white,bg=$lightgray,bold] %m-%d %H:%M #[fg=$purple,bg=$lightgray,nobold]$left_sep$block"
  tmux set-window-option -g window-status-activity-style "fg=$white,bg=$lightgray"
  tmux set-window-option -g window-status-separator "#[fg=$white,bg=$gray]$right_alt_sep"
  tmux set-window-option -g window-status-format ' #I #W '
  tmux set-window-option -g window-status-style "fg=$white,bg=$gray"
  tmux set-window-option -g window-status-current-format \
    "#[fg=$gray,bg=$purple]$right_sep#[fg=$black,bg=$purple,bold] #I $right_alt_sep #W #[fg=$purple,bg=$gray,nobold]$right_sep"
  tmux set-window-option -g window-status-current-style "none"
}

main
