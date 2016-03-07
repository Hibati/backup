sudo apt-get install xterm
mkdir -p ~/.config/autostart
sudo nano ~/.config/autostart/lxterm-autostart.desktop
[Desktop Entry]
Encoding=UTF-8
Name=Terminal autostart
Comment=Start a terminal and list directory
Exec=/usr/bin/lxterm -e 'ls -l | less'