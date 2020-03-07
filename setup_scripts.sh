echo "setting up files"
cd ~ && git clone https://github.com/lokomoti/.custom_commands.git 2>&1 >/dev/null 
sudo chmod +x ~/.custom_commands/upgrade_pi.sh 

~/.custom_commands/upgrade_pi.sh
