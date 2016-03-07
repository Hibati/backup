#!bin/bash

ruby /home/pi/Desktop/scanCh.rb
while read line; do
	echo "$line"
	sudo lxterm -e '/home/pi/Desktop/ts -b 435345 -I '$line' | less' &
done </home/pi/Desktop/myfile.txt




