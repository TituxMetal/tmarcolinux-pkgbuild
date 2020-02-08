#!/bin/bash
# https://wiki.archlinux.org/index.php/DeveloperWiki:Building_in_a_Clean_Chroot

# 2. makepkg"
# 1. chroot"

CHOICE=1

search=tmarcolinux

tput setaf 2
echo "#############################################################################################"
echo "#########        Let us build the package "$(basename `pwd`)
echo "#############################################################################################"
tput sgr0

case $CHOICE in
  2 )
  makepkg --sign
  ;;

  1 )
  CHROOT=$HOME/Documents/archlinux-chroot
  arch-nspawn $CHROOT/root pacman -Syu
  makechrootpkg -c -r $CHROOT

  echo "Signing the package"
  echo "#############################################################################################"
  gpg --detach-sign $search-*.pkg.tar.xz
  ;;
esac

tput setaf 8
echo "#############################################################################################"
echo "###################                       build done                   ######################"
echo "#############################################################################################"
tput sgr0
