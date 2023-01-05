#!/bin/bash
pidList=$(screen -ls | awk '/[0-9]{3,}\./ {print strtonum($1)}')
for pid in ${pidList[@]};
do
    name=$(screen -ls | grep $pid | awk '{print $1}' | cut -d. -f 2)
    truncate -s 0 log.txt
    sleep 5
    screen -X -S $name hardcopy log.txt
    if tail -n5 log.txt | grep 'Safety Sleep' || tail -n8 log.txt | grep '[Init] Current Config' || tail -n5 log.txt | grep 'Init Worker Master' || tail -n5 log.txt | grep 'Init Version Check' || tail -n5 log.txt | grep 'Claiming Master' || tail -n5 log.txt | grep 'stakeChecking' || tail -n5 log.txt | grep 'Could not read ConfigRegistry' || tail -n3 log.txt | grep 'sub routine initialized' || tail -n5 log.txt | grep 'Network seems to have stopped block production'   
    then
        echo "Restart worker $name. Worker Stuck";
        screen -r $name -X stuff $'\003'
        screen -r $name -X stuff $'\003'
        screen -r $name -X stuff $'\003'
        screen -r $name -X stuff $'\003'
        screen -r $name -X stuff $'\003'
        screen -r $name -X stuff $'\003'
        screen -r $name -X stuff $'\003'
        screen -r $name -X stuff $'\003'
        screen -r $name -X stuff $'\003'
        screen -r $name -X stuff $'\003'
        screen -r $name -X stuff $'\003'
        screen -r $name -X stuff $'\003'
        sleep 15
        screen -r $name -X stuff 'python Launcher.py -m 0xF06a22d8C0ce9cF562623b9A69f968D0d2A32F74 -l 3'`echo -ne '\015'`
    else
        echo "Worker $name running perfectly";
    fi
    
        
done
