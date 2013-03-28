#!/usr/bin/env bash

function rl {
  local TARGET_FILE=$1
  cd "$(dirname "$TARGET_FILE")"
  TARGET_FILE=$(basename "$TARGET_FILE")
  while [ -L "$TARGET_FILE" ]
  do
    TARGET_FILE=$(readlink "$TARGET_FILE")
    cd "$(dirname "$TARGET_FILE")"
    TARGET_FILE=$(basename "$TARGET_FILE")
  done
  echo "$(pwd -P)/$TARGET_FILE"
}
SELF="$(rl "$0")"
cd "$(dirname "$SELF")/../../../tahu-linux"
rm -rf .pulse .pulse-cookie
ln -s "$HOME/.pulse"
ln -s "$HOME/.pulse-cookie"
echo "$USER" > .user
if [ "$(ls -lhand .|cut -d ' ' -f 3)" = "0" ]
then
  cp .ssh/id_rsa /tmp
  chmod 0600 /tmp/id_rsa
  export SSH_KEY=/tmp/id_rsa
fi
xhost local:root
bash --login -i -c "/usr/bin/env -i /bin/bash --rcfile ./Desktop/DOTFILES/.cygwinrc"
rm -f /tmp/id_rsa
