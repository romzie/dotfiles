#! /bin/bash

screenshot_jpg=/tmp/screenshot.jpg
screenshot_png=/tmp/screenshot.png

Xresources=$HOME/.config/hapycolor_palettes/.hapycolor.Xresources

fg_color=$(cat $Xresources | grep "color7:" | awk -F ' ' '{print $2}')
bg_color=$(cat $Xresources | grep "color0:" | awk -F ' ' '{print $2}')
bg_color_alpha="$(cat $Xresources | grep "color0:" | awk -F ' ' '{print $2}')cc"
color1=$(cat $Xresources | grep "color1:" | awk -F ' ' '{print $2}')
color2=$(cat $Xresources | grep "color2:" | awk -F ' ' '{print $2}')
color3=$(cat $Xresources | grep "color3:" | awk -F ' ' '{print $2}')
color4=$(cat $Xresources | grep "color4:" | awk -F ' ' '{print $2}')

scrot -z -o $screenshot_jpg

convert -scale 20% -scale 500% $screenshot_jpg $screenshot_png

i3lock \
    --ignore-empty-password \
    --force-clock \
    \
    --ringver=$color3 \
    --wrongcolor=$bg_color \
    --ringwrongcolor=$color1 \
    --bshlcolor=$color2 \
    --separatorcolor=$color4 \
    --keyhlcolor=$color4 \
    \
    --timecolor="$fg_color" \
    --timestr="%H:%M" \
    --timepos="w - r +35 : h - r" \
    --time-align=2 \
    --timesize=48 \
    \
    --datecolor=$fg_color \
    --datestr="%A %d %B %Y" \
    --date-align=2 \
    --datesize=18 \
    \
    --veriftext="" \
    --wrongtext="" \
    --noinputtext="" \
    \
    --bar-color=$bg_color_alpha \
    --bar-indicator \
    --bar-base-width=24 \
    --bar-position="h/2+6" \
    \
    --image $screenshot_png \
