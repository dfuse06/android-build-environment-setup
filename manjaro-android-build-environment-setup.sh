#!/bin/sh

 CL_BLU="\033[34m"
 CL_RST="\033[0m"

echo -e ${CL_BLU}"██████████████████  ████████${CL_BLU}";
echo -e ${CL_BLU}"██████████████████  ████████${CL_BLU}";
echo -e ${CL_BLU}"██████████████████  ████████${CL_BLU}";
echo -e ${CL_BLU}"██████████████████  ████████${CL_BLU}";
echo -e ${CL_BLU}"████████            ████████${CL_BLU}";
echo -e ${CL_BLU}"████████  ████████  ████████${CL_BLU}";
echo -e ${CL_BLU}"████████  ████████  ████████${CL_BLU}";
echo -e ${CL_BLU}"████████  ████████  ████████${CL_BLU}";
echo -e ${CL_BLU}"████████  ████████  ████████${CL_BLU}";
echo -e ${CL_BLU}"████████  ████████  ████████${CL_BLU}";
echo -e ${CL_BLU}"████████  ████████  ████████${CL_BLU}";
echo -e ${CL_BLU}"████████  ████████  ████████${CL_BLU}";
echo -e ${CL_BLU}"████████  ████████  ████████${CL_BLU}";
echo -e ${CL_BLU}"████████  ████████  ████████${CL_RST}";


echo "Install a Android build environment for Manjaro.";

while true
do 
  PS3='Pick an option!:'
  options=("Install packages" "Get Android SDK" "Install Java 7 and set Java 7 as default" "Install Java 8 and set Java 8 as default" "Symlink make-3.81 and python2" "Add your exports" "Find me on Google Plus" "Quit")
  select opt in "${options[@]}"
do
    case $opt in
    "Install packages")
        echo "Getting packages.";
        yaourt -S --noconfirm git gnupg flex bison gperf sdl wxgtk squashfs-tools curl ncurses zlib schedtool perl-switch zip unzip libxslt python2-virtualenv bc gcc-multilib lib32-zlib lib32-libtinfo
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
     "Get Android SDk")
        echo "Downloading Android-SDK.";
        cd ~/
        wget http://www.mediafire.com/file/y2ccf55b5myavf5/tools_r25.2.3-linux.zip
        sleep 2
        echo "Installing my zip file..."
        mkdir android-sdk
        unzip tools_r25.2.3-linux.zip -d ~/android-sdk
        sleep 2
        echo "To install other SDK tools, use the sdkmanager.....Wait I will bring you there.";
        sleep 4
        cd ~/android-sdk/tools/
        android
        cd ~/
        echo "Done.";
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
     "Add your exports")
        echo "export LANG=C" >> .bashrc
        echo "export PATH=~/bin:$PATH" >> .bashrc
        echo "export PATH=$PATH:~/android-sdk/tools/" >> .bashrc
        echo "export PATH=$PATH:~/android-sdk/platform-tools/" >> .bashrc
        echo "export USE_CCACHE=1" >> .bashrc
        echo "export CCACHE_DIR=~/.ccache" >> .bashrc
        echo "export JAVA_HOME=/usr/lib/jvm/java" >> .bashrc
        source ~/.bashrc
        sleep 4
        echo "Done.";
        clear 
        break;
        ;;
     "Find me on Google Plus")
       python -mwebbrowser https://plus.google.com/+dustinwinings
       clear 
       break;
       ;;
     "Quit")
        exit 
        ;;
        *) echo invalid option;;
    esac
done
done
