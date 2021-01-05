#!/bin/bash

BUILD_ROOT=/usr/local/src/los16
LOCAL_MANIFEST=my_tmp/local_manifest

export BUILD_ROOT LOCAL_MANIFEST

cd ${BUILD_ROOT}

source build/envsetup.sh

# safer repopick:
# checks for the return value of repopick and waits for
# user input to continue.

safer-repopick() {
    repopick $*
    if [ "$?" -gt "0" ] ; then
      read -p "$0 $*: ENTER to continue"
    fi
}

safer-repopick -t P_asb_2021-01 -e 300213,300216,300217,300218,300219,300220,300221,300222,300223,300224,300225,300226,300227,300230,300231,300853
safer-repopick 300213 -P android/
safer-repopick 300216 300217 -P frameworks/av/
safer-repopick -c 30 300218 300219 300220 300221 300222 300223 300224 300225 300226 300227 -P frameworks/base/
safer-repopick 300230 300231 -P packages/apps/PackageInstaller/
safer-repopick 300853 -P build/make/
