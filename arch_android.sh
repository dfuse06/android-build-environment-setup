#!/bin/sh

echo "  ___                             ___                                     ";
echo " -   -_,            ,,           -   -_,        |\                   |\   ";
echo "(  ~/||             ||          (  ~/||          \\               '   \\  ";
echo "(  / ||  ,._-_  _-_ ||/\\       (  / ||  \\/\\  / \\ ,._-_  /'\\ \\  / \\ ";
echo " \/==||   ||   ||   || ||        \/==||  || || || ||  ||   || || || || || ";
echo " /_ _||   ||   ||   || ||        /_ _||  || || || ||  ||   || || || || || ";
echo "(  - \\,  \\,  \\,/ \\ |/       (  - \\, \\ \\  \\/   \\,  \\,/  \\  \\/  ";
echo "                      _/                                                  ";
echo "                                                                          ";
echo "Install a Android build environment for Arch Linux.";

while true
do 
  PS3='Pick an option!:'
  options=( "Check for multilib" "Install packages" "Get Android SDK" "Install Java 7 and set Java 7 as default" "Install Java 8 and set Java 8 as default" "Symlink make-3.81 and python2" "Ccache" "Set Exports" "Find me on Google Plus" "Quit")
  select opt in "${options[@]}"
do
    case $opt in
    "Check for multilib")
        echo -n "Type Editor and remove the # from multilib-testing & multilib.>"
        read text
        sudo $text /etc/pacman.conf
        sudo pacman -Syyu
        clear 
        break;
        ;;
    "Install packages")
        echo "Getting packages.";
        yaourt -S --noconfirm git gnupg flex bison gperf sdl wxgtk squashfs-tools curl ncurses zlib schedtool perl-switch zip unzip libxslt python2-virtualenv bc gcc-multilib lib32-zlib lib32-libtinfo android-udev-git
        clear
        echo "Setting up to get ncurses5-compat-libs and installing.";
        sleep 2
        gpg --keyserver pgp.mit.edu --recv-keys C52048C0C0748FEE227D47A2702353E0F7E48EDB
        yaourt -S ncurses5-compat-libs
        clear 
        echo "Getting just a few more packages.";
        sleep 2
        yaourt -S --noconfirm lib32-readline make-3.81 pngcrush pngquant rsync
        sleep 2
        clear 
        echo "Settings up bin folder & repo.";
        mkdir ~/bin
        PATH=~/bin:$PATH
        curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
        chmod a+x ~/bin/repo
        echo "Done.";
        sleep 2
        clear 
        break;
        ;;
     "Get Android SDK")
        echo "Downloading Android-SDK.";
        yaourt -S --noconfirm android-sdk 
        yaourt -S --noconfirm android-sdk-platform-tools
        clear 
        break;
        ;;
     "Install Java 7 and set Java 7 as default")
        echo "Installing.";
        yaourt -S --noconfirm jdk7-openjdk
        sleep 2
        echo "Setting java 7 as default.";
        sudo archlinux-java set Java-7-openjdk
        sleep 2
        echo "Checking java 7"; 
        java -version
        echo "Done.";
        sleep 5
        clear 
        break;
        ;;
     "Install Java 8 and set Java 8 as default")
       echo "Installing.";
       yaourt -S --noconfirm jdk8-openjdk
       sleep 2
       echo "Setting java 8 as default.";
       sudo  archlinux-java set java-8-openjdk
       sleep 2 
       echo "Checking java 8"; 
       java -version
       echo "Done.";
       sleep 6
       clear 
       break;
       ;;
     "Symlink make-3.81 and python2")
       ln -s /usr/bin/make-3.81 ~/bin/make
       ln -s /usr/bin/make-3.81-config ~/bin/make-config
       ln -s /usr/bin/python2 ~/bin/python
       ln -s /usr/bin/python2-config ~/bin/python-config
       echo "Done.";
       sleep 1
       clear 
       break;
       ;;
     "Ccache")
       yaourt -S --noconfirm ccache
       mkdir .ccache
       echo -n "Type the amount you want to set.Example 50G >"
       read text
       ccache -M $text 1> /dev/null 2>&1
       clear 
       break;
       ;;
     "Set Exports")
      echo -n "Type Editor,copy & paste from my git.>"
      read text
      $text .bashrc && python -mwebbrowser https://github.com/dfuse06/manjaro-android-build-environment-setup
      source ~/.bashrc
      clear 
      break;
      ;;
     "Find me on Google Plus")
       python -mwebbrowser https://plus.google.com/+dustinwinings
       clear 
       break;
       ;;
     "Quit")
        clear
        exit 
        ;;
        *) echo invalid option;;
    esac
done
done
