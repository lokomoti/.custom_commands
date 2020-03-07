#!/bin/bash

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

spin()
{
  spinner="/|\\-/|\\-"
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

tput bold; echo "${green}Starting upgrade script${reset}"

# Start the Spinner:
spin &

# Make a note of its Process ID (PID):
SPIN_PID=$!

# Kill the spinner on any signal, including our own exit.
trap "kill -9 $SPIN_PID" `seq 0 15`

#sleep 5
sudo apt-get update 2>&1 >/dev/null

echo -en "\012"
tput bold; echo "${green}Upgrading${reset}"


#sleep 5
sudo apt-get dist-upgrade -y 2>&1 >/dev/null
echo -en "\012"
tput bold; echo "Finished ${reset}"
kill -9 $SPIN_PID
