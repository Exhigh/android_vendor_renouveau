#!/bin/bash
# Root method chooser for the Renouveau ROM
# Specify colors utilized in the terminal
    red=$(tput setaf 1)             #  red
    grn=$(tput setaf 2)             #  green
    ylw=$(tput setaf 3)             #  yellow
    blu=$(tput setaf 4)             #  blue
    ppl=$(tput setaf 5)             #  purple
    cya=$(tput setaf 6)             #  cyan
    txtbld=$(tput bold)             #  Bold
    bldred=${txtbld}$(tput setaf 1) #  red
    bldgrn=${txtbld}$(tput setaf 2) #  green
    bldylw=${txtbld}$(tput setaf 3) #  yellow
    bldblu=${txtbld}$(tput setaf 4) #  blue
    bldppl=${txtbld}$(tput setaf 5) #  purple
    bldcya=${txtbld}$(tput setaf 6) #  cyan
    txtrst=$(tput sgr0)             #  Reset
    rev=$(tput rev)                 #  Reverse color
    pplrev=${rev}$(tput setaf 5)
    cyarev=${rev}$(tput setaf 6)
    ylwrev=${rev}$(tput setaf 3)
    blurev=${rev}$(tput setaf 4)
    normal='tput sgr0'

echo -e "";
echo -e "";
echo -e ${blu}"              GGGGGGGGGGGGG       OOOOOOOOO       TTTTTTTTTTTTTTTTTTTTTTT"${txtrst};
echo -e ${blu}"           GGG::::::::::::G     OO:::::::::OO     T:::::::::::::::::::::T"${txtrst};
echo -e ${blu}"         GG:::::::::::::::G   OO:::::::::::::OO   T:::::::::::::::::::::T"${txtrst};
echo -e ${grn}"        G:::::GGGGGGGG::::G  O:::::::OOO:::::::O  T:::::TT:::::::TT:::::T"${txtrst};
echo -e ${grn}"       G:::::G       GGGGGG  O::::::O   O::::::O  TTTTTT  T:::::T  TTTTTT"${txtrst};
echo -e ${ylw}"      G:::::G                O:::::O     O:::::O          T:::::T        "${txtrst};
echo -e ${ylw}"      G:::::G                O:::::O     O:::::O          T:::::T        "${txtrst};
echo -e ${ylw}"      G:::::G    GGGGGGGGGG  O:::::O     O:::::O          T:::::T        "${txtrst};
echo -e ${red}"      G:::::G    G::::::::G  O:::::O     O:::::O          T:::::T        "${txtrst};
echo -e ${red}"      G:::::G    GGGGG::::G  O:::::O     O:::::O          T:::::T        "${txtrst};
echo -e ${red}"      G:::::G        G::::G  O:::::O     O:::::O          T:::::T        "${txtrst};
echo -e ${ppl}"       G:::::G       G::::G  O::::::O   O::::::O          T:::::T        "${txtrst};
echo -e ${ppl}"        G:::::GGGGGGGG::::G  O:::::::OOO:::::::O        TT:::::::TT      "${txtrst};
echo -e ${ppl}"         GG:::::::::::::::G   OO:::::::::::::OO         T:::::::::T      "${txtrst};
echo -e "           GGG::::::GGG:::G     OO:::::::::OO           T:::::::::T      ";
echo -e "              GGGGGG   GGGG       OOOOOOOOO             TTTTTTTTTTT  ";
echo -e "";
echo -e "";
echo -e "   88888  88888 888888 8   8 88888  88888  88888 888888 88888 88888 888888 ";
echo -e ${grn}"   8   8  8     8      8   8 8   8  8   8  8     8    8   8   8     8    8 "${txtrst};
echo -e ${ylw}"   8eee8e 8eeee 8eeeee 8e  8 8eee8e 8eee8e 8eeee 8e       8e  8eeee 8e   8 "${txtrst};
echo -e ${red}"   88   8 88        88 88  8 88   8 88   8 88    88       88  88    88   8 "${txtrst};
echo -e ${blu}"   88   8 88    e   88 88  8 88   8 88   8 88    88   e   88  88    88   8 "${txtrst};
echo -e ${ppl}"   88   8 88eee 8eee88 88ee8 88   8 88   8 88eee 88eee8   88  88eee 88eee8 "${txtrst};
echo -e "";
echo -e "";
echo -e "";
echo -e "";
echo -e ${ylw}" √ Successfully built! "${txtrst};
echo -e "";
echo -e ${blu}" 〉 Powered by ANDROID™ 9.0"${txtrst};
echo -e "";
echo -e ${red}" 〉 Enjoy Renouveau! // #GETRENEWED "${txtrst};
echo -e "";
filename=$(ls -1t $OUT/Renouveau*.zip | head -1) #get the latest release
echo "{ \"response\": [ { \"datetime\": $(grep ro\.build\.date\.utc $OUT/system/build.prop | cut -d= -f2), \"filename\": \"$(basename $filename)\", \"id\": \"$((sha256sum $filename) | cut -d ' ' -f1)\", \"romtype\": \"$RENOUVEAU_BUILDTYPE\", \"size\": $(stat -c%s $filename), \"url\": \"https://github.com/RenouveauOS/android_device_$(grep ro\.product\.manufacturer $OUT/system/build.prop | cut -d= -f2)_$RENOUVEAU_BUILD/releases/download/v$(grep ro\.renouveau\.build\.version= $OUT/system/build.prop | cut -d= -f2)-$(grep renouveau\.ota\.version $OUT/system/build.prop | cut -d= -f2)-$RENOUVEAU_BUILDTYPE/$(grep ro\.renouveau\.version $OUT/system/build.prop | cut -d= -f2).zip\", \"version\": \"$(grep ro\.renouveau\.build\.version= $OUT/system/build.prop | cut -d= -f2)\"  }]}" | tee $OUT/$RENOUVEAU_BUILD.json
