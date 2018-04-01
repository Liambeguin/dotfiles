#!/bin/sh
echo "remap capslock to ctrl"
gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']"
echo "focus on window on mouseover"
gsettings set org.gnome.desktop.wm.preferences focus-mode 'mouse'
echo "allow resize of window using Super+rightclick and drag"
gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true

echo "set workspace nav using ctrl+alt+hjkl"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up \
	"['<Primary><Alt><Meta>k', '<Control><Alt>Up']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down \
	"['<Primary><Alt><Meta>j', '<Control><Alt>Down']"

echo "set workspace movements using ctrl+alt+shift+hjkl"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up \
	"['<Primary><Shift><Alt>k', '<Control><Shift><Alt>Up']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down \
	"['<Primary><Shift><Alt>j', '<Control><Shift><Alt>Down']"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-right \
	"['<Primary><Shift><Alt>l']"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-left \
	"['<Primary><Shift><Alt>h']"
