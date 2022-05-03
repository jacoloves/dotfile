#!/bin/sh

if [ "$#" -eq 0 ]; then
    tmux split-window -v
    tmux split-window -h
    tmux resize-pane -D 13
    tmux clock-mode
    tmux select-pane -t 0
fi
