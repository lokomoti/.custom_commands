#!/bin/bash

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

spin()
{
  #spinner="/|\\-/|\\-"
  while :
  do
    for i in `seq 0 10`
    do
      tput setaf 2; echo -n "." #"${spinner:$i:1}"
      #echo -en "\010"
      sleep 1
      tput sgr0
    done
    echo -en "\012"
  done
}

# Message
tput bold; echo "${green}Starting upgrade script${reset}"

# Start the Spinner:
spin &

# Make a note of its Process ID (PID):
SPIN_PID=$!

# Kill the spinner on any signal, including our own exit.
trap "kill -9 $SPIN_PID" `seq 0 15`

# Start update process
sudo apt-get update 2>&1 >/dev/null

# Message
echo -en "\012"
tput bold; echo "${green}Upgrading${reset}"

# Run upgrade pkg count
#upgrade_list=" "
#sudo apt list --upgradable 2>&1 >$upgrade_list
#echo $upgrade_list

# Run full upgrade
sudo apt-get dist-upgrade -y 2>&1 >/dev/null
sudo apt-get autoremove -y 2>&1 >/dev/null && sudo apt-get autoclean 2>&1 >/dev/null && sudo apt-get check 2>&1 >/dev/null

# Message
echo -en "\012"
tput bold; echo "Finished ${reset}"

# Kill progress function
kill -9 $SPIN_PID
