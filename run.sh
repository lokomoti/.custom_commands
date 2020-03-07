
function upgrade_pi()
{
  sudo ~/.custom_commands/upgrade_pi.sh
}

function remove_setup_file()
{
  clear
  echo "removing setup file..."
  sudo rm -r ~/setup_scripts.sh
}
