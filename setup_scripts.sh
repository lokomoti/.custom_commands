sudo rm -r /boot/setup_scripts.sh 2>&1 >/dev/null 
echo "setting up files"
cd ~ && git clone https://github.com/lokomoti/.custom_commands.git 2>&1 >/dev/null 
sudo chmod +x ~/.custom_commands/*

~/.custom_commands/run.sh
