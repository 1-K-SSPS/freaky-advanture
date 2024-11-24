liker=$((cat currentlevel) / 5 * 12896 % 9)

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

content_x=$((height / 2))
content_y=$((width / 2 - 10))
tput cup "$content_x" "$content_y"
