# mmolch-xfce
An elegant light theme for xfce, based on Yaru Blue Light, contains xfwm4, xfce-notify4, cursor, gtk2+3 themes and an icon theme that contains a lot of Yaru icons and some custom ones, but ultimately depends on breeze (so make sure that the breeze icon theme is installed, e.g. package breeze-icon-theme in Ubuntu). This theme is **optimized for no compositing**, so I recommend to disable it in *Window Manager Tweaks -> Compositor* for the best experience.

## Prerequisites
  * xfce 4.14
  * Breeze icon theme is installed (package breeze-icon-theme in Ubuntu)

## Install
To install the theme, run the script *install.sh* either as user or with elevated privileges depending on whether you want to install the theme into your home directory or into /usr.

## Uninstall
To uninstall the theme, run the script *uninstall.sh* either as user or with elevated privileges depending on whether you want to remove the theme from your home directory or from /usr.

## Some notes / recommendations for this theme
  * Make sure that the breeze icon theme is installed (package breeze-icon-theme in Ubuntu)
  * Window Manager
    * Disable compositing (Client side window decorated windows and menus have round borders and shadows otherwise)
    * Font: Noto Sans Display Medium (font size 9)
  * Appearance
    * Button icons can be removed via *Appearance -> Settings -> Show images on buttons*
    * Font: *Noto Sans Display Regular* (font size of 9, full hinting)
  * Panel
    * Height: 30px
    * Icon Size: 16px (Needs to be set separately for the *Panel Preferences*, *Status Notifier Plugin* and *Notification Area*)
    * The path to the panel background image is shown during the installation
  * Whisker Menu
    * Disable *Position categories next to panel button*
    * Enable *Position search entry next to panel putton*
    * Enable *Position commands next to search entry*
    * Set Application icon size and category icon size to *Very Small*


## Thanks
I want to sincerely thank all the amazing people who are working on Adwaita, Breeze, Yaru and the other themes that are used by this theme directly or indirectly.