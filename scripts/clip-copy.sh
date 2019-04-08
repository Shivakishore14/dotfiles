filename=~/config/clip-copy.data.conf

choices=$(awk '{print $1}' $filename)


choice=$(echo -e $choices | tr '[:space:]' '\n' | dmenu)

sub_choices=$(awk '/'"$choice"'/{print}' $filename | awk '{for (i=2; i<=NF;i++) {print $i} }' | awk -F ':' '{print $1}')

choice2=$(echo $sub_choices|tr '[:space:]' '\n'| dmenu)

data=$(awk '/'"$choice"'/{print}' $filename | sed -e 's/.*'"$choice2"'://' -e 's/ .*$//')

echo $data | xclip -selection c

notify-send -t 1000 -u low "copied" $data
