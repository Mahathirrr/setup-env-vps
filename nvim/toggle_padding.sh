#!/bin/bash

if [ "$1" = "remove" ]; then
    kitty @ set-window-padding width=0
elif [ "$1" = "restore" ]; then
    kitty @ set-window-padding width=25
fi
