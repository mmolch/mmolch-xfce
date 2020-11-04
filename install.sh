#!/bin/bash

ScriptDir=$(readlink -f "${BASH_SOURCE%/*}")

ROOT_INSTALL=0
THEMES_DIR="${HOME}/.themes"
ICONS_DIR="${HOME}/.icons"

if [ "x$USER" = "xroot" ]; then
    ROOT_INSTALL=1
    THEMES_DIR='/usr/share/themes'
    ICONS_DIR='/usr/share/icons'
fi

echo "mmolch-xfce will be installed in the following directories:"
echo "  ${THEMES_DIR}"
echo "  ${ICONS_DIR}"


if [ ${ROOT_INSTALL} -eq 0 ]; then
    echo -e '\nIf you want to install the theme for all users, run this script with root privilages'
else
    echo -e '\nIf you want to install the theme only for you, run this script as user'
fi

echo -e 'Press Ctrl-C to abort or enter to continue'
read xxx

[ ! -d "${THEMES_DIR}" ] && mkdir -p "${THEMES_DIR}" 
[ ! -d "${ICONS_DIR}" ] && mkdir -p "${ICONS_DIR}"

echo 'Installing theme ...'
cp -r "${ScriptDir}/themes/mmolch-xfce" "${THEMES_DIR}/"
cp -r "${ScriptDir}/themes/mmolch-xfce (xhdpi)" "${THEMES_DIR}/"

echo 'Installing icons ...'
cp -r "${ScriptDir}/icons/mmolch-xfce" "${ICONS_DIR}/"

echo -e "\nFinished.\nPanel background location: ${THEMES_DIR}/mmolch-xfce/panel/panel.png"
