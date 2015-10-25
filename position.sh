#!/bin/bash
# based on a script from http://invisible-island.net/xterm/xterm.faq.html
exec < /dev/tty
oldstty=$(/bin/stty -g)
/bin/stty raw -echo min 0
# on my system, the following line can be replaced by the line below it
echo -en "\033[6n" > /dev/tty
# tput u7 > /dev/tty    # when TERM=xterm (and relatives)
IFS=';' read -r -d R -a pos
/bin/stty $oldstty
# change from one-based to zero based so they work with: tput cup $row $col
row=$((${pos[0]:2} - 1))    # strip off the esc-[

echo "$row"
