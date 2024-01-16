#!/bin/bash
set -e
. setdevkitpath.sh

export JDK_DEBUG_LEVEL=release

sudo apt update
sudo apt -y install autoconf python unzip zip

sudo chmod 777 extractndk.sh
sudo chmod 777 maketoolchain.sh

wget -nc -nv -O android-ndk-$NDK_VERSION-linux-x86_64.zip "https://dl.google.com/android/repository/android-ndk-$NDK_VERSION-linux-x86_64.zip"
./extractndk.sh
./maketoolchain.sh

# Some modifies to NDK to fix

sudo chmod 777 getlibs.sh
sudo chmod 777 buildlibs.sh
sudo chmod 777 clonejdk.sh
sudo chmod 777 buildjdk.sh
sudo chmod 777 removejdkdebuginfo.sh
sudo chmod 777 tarjdk.sh

./getlibs.sh
./buildlibs.sh
./clonejdk.sh
./buildjdk.sh
./removejdkdebuginfo.sh
./tarjdk.sh
