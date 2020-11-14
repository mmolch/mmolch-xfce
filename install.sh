#!/bin/bash

# arg1: Source directory
# arg2: Target directory
# example: install_directory source/files target/files
install_directory() {
    [ ! -d "${1}" ] && return # Source directory doesn't exist
    [ ! -d "${2}" ] && mkdir -m 0755 -p "${2}"
    [ ! -d "${2}" ] && return # Failed to create target directory

    # directories
    while IFS= read -r path; do
        [ -z "${path}" ] && continue
        mkdir -m 0755 -p "${2}/${path}"
    done <<<$(find "${1}" -type d -printf '%P\n')

    # files
    while IFS= read -r path; do
        [ -z "${path}" ] && continue
        install -m 0644 "${1}/${path}" "${2}/${path}"
    done <<<$(find "${1}" -type f -printf '%P\n')

    # symlinks
    while IFS= read -r path; do
        [ -z "${path}" ] && continue
        cp -PT "${1}/${path}" "${2}/${path}"
    done <<<$(find "${1}" -type l -printf '%P\n')
}

ScriptDir=$(readlink -f "${BASH_SOURCE%/*}")

ROOT_INSTALL=0
THEMES_DIR="${HOME}/.themes"
ICONS_DIR="${HOME}/.icons"

if [ "x$USER" = "xroot" ]; then
    ROOT_INSTALL=1
    THEMES_DIR='/usr/share/themes'
    ICONS_DIR='/usr/share/icons'
fi

cat <<eof
mmolch-xfce will be installed in the following directories:
  ${THEMES_DIR}
  ${ICONS_DIR}
eof

if [ ${ROOT_INSTALL} -eq 0 ]; then
    echo -e '\nIf you want to install the theme for all users, run this script with root privileges'
else
    echo -e '\nIf you want to install the theme only for you, run this script as user'
fi

echo -e 'Press Ctrl-C to abort or enter to continue'
read xxx

echo 'Installing theme ...'
[ ! -d "${THEMES_DIR}" ] && mkdir -p "${THEMES_DIR}"
install_directory "${ScriptDir}/themes/mmolch-xfce" "${THEMES_DIR}/mmolch-xfce"
install_directory "${ScriptDir}/themes/mmolch-xfce (xhdpi)" "${THEMES_DIR}/mmolch-xfce (xhdpi)"

echo 'Installing icons ...'
[ ! -d "${ICONS_DIR}" ] && mkdir -p "${ICONS_DIR}"
install_directory "${ScriptDir}/icons/mmolch-xfce" "${ICONS_DIR}/mmolch-xfce"

cat <<eof

Finished.

Some notes / recommendations for this theme:
  * Make sure that the breeze icon theme is installed (package breeze-icon-theme in Ubuntu)
  * Window Manager
    * Disable compositing (Client side window decorated windows and menus have round borders and shadows otherwise)
    * Font: Noto Sans Display Medium (font size 9)
  * Appearance
    * Button icons can be removed via Appearance -> Settings -> Show images on buttons
    * Font: Noto Sans Display Regular with a font size of 9 and full hinting
  * Panel
    * Height: 30px
    * Icon Size: 16px (Needs to be set separately in the Panel Preferences, Status Notifier Plugin and Notification Area)
    * Panel background: ${THEMES_DIR}/mmolch-xfce/panel/panel.png
  * Whisker Menu
    * Disable "Position categories next to panel button"
    * Enable "Position search entry next to panel putton"
    * Enable "Position commands next to search entry"
    * Set Application icon size and category icon size to "Very Small"

eof
