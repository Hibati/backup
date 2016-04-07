#!bin/bash
sudo ./ble_scan
ruby ts.rb

while read line; do
    echo "$line"
    sudo lxterminal -e '/home/pi/Desktop/ts2 '$line' | less' &
    sleep 10
done < /home/pi/Desktop/ble_params.txt