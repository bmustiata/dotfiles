# we need to run this as sudo into the folder where the byobu
# scripts are defined

# color format for byoubu is:
# [optional] format: b - bold, u - underline
#            background-color: ~/.byobu/color.tmux
#            foreground-color:

sed -ie 's/color b w k/color b W/g' ip_address
sed -ie 's/color b M W/color b b W/g' disk_io
sed -ie 's/color M W/color b W/g' disk_io
sed -ie 's/color b M W/color b b W/g' network
sed -ie 's/color M W/color b W/g' network
sed -ie 's/color b m W/color b b w/g' disk
sed -ie 's/color m W/color b w/g' disk
sed -ie 's/color u W k/color b b Y/g' session
sed -ie 's/color b c W/color b b w/g' cpu_freq
sed -ie 's/color c W/color b W/g' cpu_freq
sed -ie 's/color Y k/color b W/g' load_average
sed -ie 's/color Y k/color b W/g' load_average
sed -ie 's/color b r W/color b b Y/g' updates_available
sed -ie 's/color r W/color b Y/g' updates_available
sed -ie 's/color b y w/color b b W/g' processes
sed -ie 's/color y w/color b W/g' processes
sed -ie 's/color w b/color b w/g' uptime
sed -ie 's/color y k/color b R/g' apport
sed -ie 's/color invert/color b W/g' time_utc
sed -ie 's/color b g W/color b b W/g' memory
sed -ie 's/color g W/color b W/g' memory
sed -ie 's/color g "/color b "/g' memory
sed -ie 's/color b g "/color b b "/g' memory
sed -ie 's/color b G k/color b b w/g' swap
sed -ie 's/color G k/color b G/g' swap
sed -ie 's/color W b/color b G/g' network
sed -ie 's/color b R W/color b b R/g' reboot_required
sed -ie 's/color k G/color b G/g' reboot_required
sed -ie 's/color b k R/color b b R/g' reboot_required
