#!/bin/bash

ROOT_INSTALL=0
THEMES_DIR="${HOME}/.themes"
ICONS_DIR="${HOME}/.icons"

if [ "x$USER" = "xroot" ]; then
    ROOT_INSTALL=1
    THEMES_DIR='/usr/share/themes'
    ICONS_DIR='/usr/share/icons'
fi

cat <<eof
This will remove the following directories:
  ${THEMES_DIR}/mmolch-xfce
  ${THEMES_DIR}/mmolch-xfce (xhdpi)
  ${ICONS_DIR}/mmolch-xfce
eof

if [ ${ROOT_INSTALL} -eq 0 ]; then
    echo -e '\nIf you installed the theme for all users, run this script with root privileges'
else
    echo -e '\nIf you installed the theme only for you, run this script as user'
fi

echo 'Press Ctrl-C to abort or enter to continue'
read xxx

[ -d "${THEMES_DIR}/mmolch-xfce" ] && rm -rf "${THEMES_DIR}/mmolch-xfce" 
[ -d "${THEMES_DIR}/mmolch-xfce (xhdpi)" ] && rm -rf "${THEMES_DIR}/mmolch-xfce (xhdpi)"
[ -d "${ICONS_DIR}/mmolch-xfce" ] && rm -rf "${ICONS_DIR}/mmolch-xfce"

echo 'Finished.'

