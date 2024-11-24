fullscreen_status=$(hyprctl clients | grep -A 10 "Window" | grep "fullscreen:" | awk '{print $2}')
if [ "$XDG_SESSION_TYPE" = "wayland" && "$fullscreen_status" != "yes" ]; then
    if command -v hyprctl >/dev/null 2>&1; then
        hyprctl dispatch fullscreen
    elif command -v swaymsg >/dev/null 2>&1; then
        swaymsg fullscreen
    else
        echo "No Wayland-compatible fullscreen tool found."
        exit 1
    fi
elif [ "$fullscreen_status" != "yes" ]; then
    if command -v wmctrl >/dev/null 2>&1; then
        wmctrl -r :ACTIVE: -b add,fullscreen
    else
        echo "wmctrl not found. Install wmctrl for X11 support."
        exit 1
    fi
fi

width=$(tput cols)
height=$(tput lines)

clear

printf "╔%*s╗\n" $((width - 2)) '' | tr ' ' '-'
for ((i=14; i<height; i++)); do
    printf "║%*s║\n" $((width-2)) ''
done
printf "╚%*s╝\n" $((width-2)) '' | tr ' ' '-'

printf "╔%*s╗\n" $((width - 2)) '' | tr ' ' '-'
for ((i=1; i<10; i++)); do
    printf "║%*s║\n" $((width-2)) ''
done
printf "╚%*s╝\n" $((width-2)) '' | tr ' ' '-'

content_x=$((height-11))
content_y=$((1))
tput cup "$content_x" "$content_y"

liker=$(cat currentlevel)
if [[ "$liker" =~ ^-?[0-9] ]]; then
	echo "loaded"
	((content_x+=1))
	tput cup "$content_x" "$content_y"
	read -p "> " com
else
	echo "The currentlevel was modified. You just lost your progress :(\n> "
	touch currentlevel
	echo "1-0" > currentlevel
	chmod 444 currentlevel
	liker=$(cat currentlevel)
	((content_x+=1))
	tput cup "$content_x" "$content_y"
	read -p "> " com
fi

parts=$(cat ./main.sh | grep -o "partiul-*(*)*" | wc -l)
((parts-=1))

partiul-1-0(){
	echo "1-0"
}

"partiul-${liker}"
