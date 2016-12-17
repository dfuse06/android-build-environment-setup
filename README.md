<img src="https://raw.github.com/dfuse06/manjaro-android-build-environment-setup.git/master/Screenshot.png">

# manjaro-android-build-environment-setup

This is a hepler I made for Manjaro to set up an Android build environment.

You're gonna have to add your own exports 

Type mousepad .bashrc 

Then copy and pasted these there. 

export LANG=C
export PATH=~/bin:$PATH
export PATH=$PATH:~/android-sdk/tools
export PATH=$PATH:~/android-sdk/platform-tools/
export USE_CCACHE=1
export CCACHE_DIR=~/.ccache
export JAVA_HOME=/usr/lib/jvm/java

Then type 

source ~/.bashrc

Done!
