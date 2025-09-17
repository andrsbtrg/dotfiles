# wn=$(nmcli dev wifi list | fzf)
# ssid="$(echo $wn | awk '{print $2}')"
# read -e -p "Password: " pw
# nmcli dev wifi connect "$ssid" password $pw
nmtui
