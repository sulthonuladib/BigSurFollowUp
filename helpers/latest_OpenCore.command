#!/bin/bash

clear

echo "Checking xcode command line tools"
if type xcode-select >&- && xpath=$( xcode-select --print-path ) &&
    test -d "${xpath}" && test -x "${xpath}" ; then
    "already installled"
else
    echo "installing command line tools" &&
    xcode-select --install
fi

echo "--------- Cloning from github repository ---------"
git clone https://github.com/acidanthera/OpenCorePkg ~/Desktop/OpenCoreRepo

echo "--------- Building OpenCore ---------"
cd ~/Desktop/OpenCoreRepo
./build_oc.tool

echo "Now u can see at your desktop"
