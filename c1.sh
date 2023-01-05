#!/bin/bash
pidList=$(screen -ls | awk '/[0-9]{3,}\./ {print strtonum($1)}')
for pid in ${pidList[@]};
do
    #echo $pid;
    name=$(screen -ls | grep $pid | awk '{print $1}' | cut -d. -f 2)
    if pstree $pid | grep python
    then
        echo "Worker $name is working";
    else
        echo "Worker $name is not working";
        #/usr/bin/screen -SX $pid quit;
	      echo $name;
	      screen -r $name -X stuff 'python Launcher.py -m 0xF06a22d8C0ce9cF562623b9A69f968D0d2A32F74 -l 3'`echo -ne '\015'`
    fi
done
