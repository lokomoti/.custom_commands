#!/bin/bash

function upgrade_pi() {
  sudo ./upgrade_pi.sh
}

function remove_setup_file() {
  clear
  echo "removing setup file..."
  sudo rm -r ~/setup_scripts.sh
}
