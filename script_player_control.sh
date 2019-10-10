#!/bin/bash


# exemplo usando somento cmus and vlc #

cmus_player_exist=$(ps aux | grep -io "cmus" | cut -d$'\n' -f2)
vlc_player_exist=$(ps aux | grep -io "vlc" | cut -d$'\n' -f2)


echo "CMuS: $cmus_player_exist"
echo "VLC: $vlc_player_exist"


function execute_case(){

	case $1 in 
	"--prev")
		cmus-remote -p
		playerctl previous
		;;
	"--next")
		cmus-remote -n 
		playerctl next
		;;
	"--player")
		cmus-remote --pause
		playerctl play-pause
		;;
	esac

}





if [[ -n $cmus_player_exist && -n $vlc_player_exist ]]; then 
	echo "ambos os players estão rodando"
elif  [[ -n $cmus_player_exist ]]; then
	echo "só o cmus está rodando"
elif [[ -n $vlc_player_exist ]]; then
	echo "só o vlc está rodando"
else
	echo "ambos os players não estão em execução"
fi