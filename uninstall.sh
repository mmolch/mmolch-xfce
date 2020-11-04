#!/bin/bash

ROOT_INSTALL=0
THEMES_DIR="${HOME}/.themes"
ICONS_DIR="${HOME}/.icons"

not_installed() {
    echo "The theme doesn't seem to be installed"
    exit
}

if [ "x$USER" = "xroot" ]; then
    ROOT_INSTALL=1
    THEMES_DIR='/usr/share/themes'
    ICONS_DIR='/usr/share/icons'
fi

echo 'This will remove the following directories:'
echo "  ${THEMES_DIR}/mmolch-xfce"
echo "  ${THEMES_DIR}/mmolch-xfce (xhdpi)"
echo "  ${ICONS_DIR}/mmolch-xfce"

if [ ${ROOT_INSTALL} -eq 0 ]; then
    echo -e '\nIf you installed the theme for all users, run this script with root privilages'
else
    echo -e '\nIf you installed the theme only for you, run this script as user'
fi

echo -e 'Press Ctrl-C to abort or enter to continue'
read xxx

[ -d "${THEMES_DIR}/mmolch-xfce" ] && mkdir -p "${THEMES_DIR}/mmolch-xfce" 
[ -d "${THEMES_DIR}/mmolch-xfce (xhdpi)" ] && mkdir -p "${THEMES_DIR}/mmolch-xfce (xhdpi)"
[ -d "${ICONS_DIR}/mmolch-xfce" ] && mkdir -p "${ICONS_DIR}/mmolch-xfce"

echo 'Finished.'
