#!/bin/bash
#Scritp for CHRISTMAS 
trap "tput reset; tput cnorm; exit" 2
tput civis
lin=2
col=$(($(tput cols) / 2))
c=$((col-1))
est=$((c-2))
color=0
tput setaf 2; tput bold

# Tree
for ((i=1; i<60; i+=2)) 
{
    tput cup $lin $col
    for ((j=1; j<=i; j++))
    {
        echo -n \*
    }
    let lin++
    let col--
}

tput sgr0; tput setaf 3

# Trunk
for ((i=1; i<=6; i++))
{
    tput cup $((lin++)) $c
    echo 'mWmWm'
}
new_year=$(date +'%Y')
let new_year++
tput setaf 2; tput bold
tput cup $lin $((c - 10)); echo Удачного Хакинга
tput cup $((lin + 1)) $((c - 10)); echo И счастливого нового года $new_year @hacknocrime channel
let c++
k=1

# Lights and decorations
while true; do
    for ((i=1; i<=60; i++)) { 
        # Turn off the lights
        [ $k -gt 1 ] && {
            tput setaf 2; tput bold
            tput cup ${line[$[k-1]$i]} ${column[$[k-1]$i]}; echo \*
            unset line[$[k-1]$i]; unset column[$[k-1]$i]  # Array cleanup
        }

        li=$((RANDOM % 29 + 3))
        start=$((c-li+2))
        co=$((RANDOM % (li-2) * 2 + 1 + start))
        tput setaf $color; tput bold   # Switch colors
        tput cup $li $co
        echo o
        line[$k$i]=$li
        column[$k$i]=$co
        color=$(((color+1)%8))
        # Flashing text
        sh=1
        for l in 
        do
            tput cup $((lin+1)) $((c+sh))
            echo $l
            let sh++
            sleep 0.01
        done
    }
    k=$((k % 2 + 1))
done
