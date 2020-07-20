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
mkdir /$HOME/Desktop/latest_kext
cd /$HOME/Desktop/latest_kext
git clone https://github.com/acidanthera/Lilu
git clone https://github.com/acidanthera/VirtualSMC
git clone https://github.com/acidanthera/AirportBrcmFixup
git clone https://github.com/acidanthera/AppleALC
git clone https://github.com/acidanthera/WhateverGreen
git clone https://github.com/Mieze/IntelMausiEthernet
git clone https://github.com/Mieze/RTL8111_driver_for_OS_X
git clone https://github.com/Mieze/AtherosE2200Ethernet
git clone https://github.com/Mieze/RealtekRTL8100
git clone https://github.com/osy86/ThunderboltReset
git clone https://github.com/acidanthera/DebugEnhancer
git clone https://github.com/Mieze/LucyRTL8125Ethernet
git clone https://github.com/acidanthera/VoodooInput
git clone https://github.com/acidanthera/VoodooPS2

echo "--------- Copy compiled Lilu to friends ---------"
xcodebuild -project ./Lilu/Lilu.xcodeproj -configuration Debug clean build ARCHS=x86_64 ONLY_ACTIVE_ARCH=YES CONFIGURATION_BUILD_DIR=/$HOME/Desktop/latest_kext/Release
xcodebuild -project ./VoodooInput/VoodooInput.xcodeproj -configuration Debug clean build ARCHS=x86_64 ONLY_ACTIVE_ARCH=YES CONFIGURATION_BUILD_DIR=/$HOME/Desktop/latest_kext/Release
cd /$HOME/Desktop/latest_kext
cp -r ./Release/Lilu.kext ./WhateverGreen
cp -r ./Release/Lilu.kext ./AppleALC
cp -r ./Release/Lilu.kext ./AirportBrcmFixup
cp -r ./Release/Lilu.kext ./VirtualSMC
cp -r ./Release/Lilu.kext ./ThunderboltReset
cp -r ./Release/Lilu.kext ./DebugEnhancer
cp -r ./Release/VoodooInput.kext ./VoodooPS2

mkdir /$HOME/Desktop/latest_kext/Release
cd /$HOME/Desktop/latest_kext/Release

echo "--------- Building for each repository ---------"
cd /$HOME/Desktop/latest_kext/AirportBrcmFixup/
xcodebuild CONFIGURATION_BUILD_DIR=/$HOME/Desktop/latest_kext/Release
cd /$HOME/Desktop/latest_kext/WhateverGreen/
xcodebuild CONFIGURATION_BUILD_DIR=/$HOME/Desktop/latest_kext/Release
cd /$HOME/Desktop/latest_kext/AppleALC/
xcodebuild CONFIGURATION_BUILD_DIR=/$HOME/Desktop/latest_kext/Release
cd /$HOME/Desktop/latest_kext/VirtualSMC/
xcodebuild CONFIGURATION_BUILD_DIR=/$HOME/Desktop/latest_kext/Release
cd /$HOME/Desktop/latest_kext/IntelMausiEthernet/
xcodebuild CONFIGURATION_BUILD_DIR=/$HOME/Desktop/latest_kext/Release
cd /$HOME/Desktop/latest_kext/RTL8111_driver_for_OS_X/
xcodebuild CONFIGURATION_BUILD_DIR=/$HOME/Desktop/latest_kext/Release
cd /$HOME/Desktop/latest_kext/AtherosE2200Ethernet/
xcodebuild CONFIGURATION_BUILD_DIR=/$HOME/Desktop/latest_kext/Release
cd /$HOME/Desktop/latest_kext/RealtekRTL8100/
xcodebuild CONFIGURATION_BUILD_DIR=/$HOME/Desktop/latest_kext/Release
cd /$HOME/Desktop/latest_kext/ThunderboltReset/
xcodebuild CONFIGURATION_BUILD_DIR=/$HOME/Desktop/latest_kext/Release
cd /$HOME/Desktop/latest_kext/DebugEnhancer/
xcodebuild CONFIGURATION_BUILD_DIR=/$HOME/Desktop/latest_kext/Release
cd /$HOME/Desktop/latest_kext/VoodooInput/
xcodebuild CONFIGURATION_BUILD_DIR=/$HOME/Desktop/latest_kext/Release
cd /$HOME/Desktop/latest_kext/VoodooPS2/
xcodebuild CONFIGURATION_BUILD_DIR=/$HOME/Desktop/latest_kext/Release

echo "--------- Now u can see at your desktop ---------"
