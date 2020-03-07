#sudo rm -r /boot/setup_scripts.sh 2>&1 >/dev/null 
echo "setting up files"
sudo rm -r ~/.custom_commands/

cd ~ && git clone https://github.com/lokomoti/.custom_commands.git 2>&1 >/dev/null 

sudo chmod +x ~/.custom_commands/*
source ~/.custom_commands/run.sh

# Add line to rc.local to automaticaly load custom commands on startup
sed -e '$i \source ~/.custom_commands/run.sh &\n' rc.local


~/.custom_commands/upgrade_pi.sh
