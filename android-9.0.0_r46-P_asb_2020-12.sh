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

safer-repopick -t P_asb_2020-12 -e 295851,295852,295853,295857,296487,296488,296491
safer-repopick 295851 -P android/
safer-repopick -c 30 295852 295853 296488 -P frameworks/base/
safer-repopick 295857 -P system/media/
safer-repopick 296487 -P packages/apps/Settings/
safer-repopick 296491 -P build/make/
