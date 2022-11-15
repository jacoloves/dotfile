#!/bin/sh

# past ide-settings
#if [ "$#" -eq 0 ]; then
#    tmux split-window -v
#    tmux split-window -h
#    tmux resize-pane -D 14
#    tmux clock-mode
#    tmux select-pane -t 0
#fi

# current ide-settings
if [ "$#" -eq 0 ]; then
    tmux split-window -h
    tmux resize-pane -R 35
    tmux split-window -v
    tmux resize-pane -D 14
    tmux clock-mode
    tmux select-pane -t 0
fi
