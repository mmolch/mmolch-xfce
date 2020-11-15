#!/bin/bash

COLOR_RED='\033[0;31m'
COLOR_GREEN='\033[1;32m'
COLOR_YELLOW='\033[1;33m'
COLOR_DEFAULT='\033[0m'

ROOT_INSTALL=0
THEMES_DIR="${HOME}/.themes"
ICONS_DIR="${HOME}/.icons"

error() {
    echo -e "\n${COLOR_RED}Uninstall failed.${COLOR_DEFAULT}"
    exit 1
}

if [ "x$USER" = "xroot" ]; then
    ROOT_INSTALL=1
    THEMES_DIR='/usr/share/themes'
    ICONS_DIR='/usr/share/icons'
fi

cat <<eof
The following directories will be removed:
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

echo -e "${COLOR_DEFAULT}Removing ${THEMES_DIR}/mmolch-xfce ...${COLOR_YELLOW}"
[ ! -d "${THEMES_DIR}/mmolch-xfce" ] || rm -rf "${THEMES_DIR}/mmolch-xfce" || error

echo -e "${COLOR_DEFAULT}Removing ${THEMES_DIR}/mmolch-xfce (xhdpi) ...${COLOR_YELLOW}"
[ ! -d "${THEMES_DIR}/mmolch-xfce (xhdpi)" ] || rm -rf "${THEMES_DIR}/mmolch-xfce (xhdpi)" || error

rmdir "${THEMES_DIR}" >/dev/null 2>&1

echo -e "${COLOR_DEFAULT}Removing ${ICONS_DIR}/mmolch-xfce ...${COLOR_YELLOW}"
[ ! -d "${ICONS_DIR}/mmolch-xfce" ] || rm -rf "${ICONS_DIR}/mmolch-xfce" || error

rmdir "${ICONS_DIR}" >/dev/null 2>&1

echo -e "\n${COLOR_GREEN}Finished.${COLOR_DEFAULT}"
