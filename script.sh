#!/bin/bash

welcome() {
  gum style --bold --foreground 212 "Welcome"
}

messageToChangeBackground() {
  echo -n $(gum style --bold --foreground 212 "Paste the path/to/your/file: ")
}

installFeh() {
  sudo apt install feh > 2/dev/null 2>&1

  if [ $? -eq 0 ]; then
    echo true
  else
    echo false
   fi
}

isFehInstalled() {
  if apt list --installed 2>/dev/null | grep -q "^feh/"; then
    echo true
  else 
    echo $(installFeh)
  fi
}

changeBackground() {
  pathToBackground=""
  read pathToBackground
  
  feh --bg-scale "$HOME/$pathToBackground" > /dev/null 2>&1

  if [ $? -eq 0 ]; then
    echo true
  else
    echo false
  fi
}

welcome

fehInstalled=$(isFehInstalled)

if (( fehInstalled != true )); then
  echo "error while trying to install feh"
  exit
fi

messageToChangeBackground
wasBackgroundChanged=$(changeBackground)

if (( wasBackgroundChanged == false )); then
  gum style --bold --foreground 212 "Error while trying to change the background, check the log to see further informations"
else
  gum style --bold --foreground 212 "Background Changed, thanks for using wallman"
fi

exit
