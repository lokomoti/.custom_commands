#sudo rm -r /boot/setup_scripts.sh 2>&1 >/dev/null 
#echo "If file already present - deleting file"
#sudo rm -r ~/.custom_commands/

echo "Cloning repository"
cd ~ && git clone https://github.com/lokomoti/.custom_commands.git 2>&1 >/dev/null 

echo "Making executable and sourcing commands"
sudo chmod +x ~/.custom_commands/run.sh
sudo chmod +x ~/.custom_commands/*

echo "Adding line to rc.local for startup"

if 
  grep -Fq "~/.custom_commands/boot.sh &" /etc/rc.local
then 
  echo "line already present in rc.local file"
else 
  echo "adding line"
  # Add line to rc.local to automaticaly load custom commands on startup
  sudo sed -i -e '$i sudo ~/.custom_commands/boot.sh &\n' /etc/rc.local
fi

#sudo sed -i '/source ~/.custom_commands/run.sh &/d' ./etc/rc.local

source /home/pi/.custom_commands/run.sh

clear

sudo upgrade_pi
sudo remove_setup_file
