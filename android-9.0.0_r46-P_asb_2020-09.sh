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

safer-repopick -t P_asb_2020-09 -e 285881,285883,285884,285885,285886,285887,285896,285897,286071
safer-repopick 285881 -P android/
safer-repopick 285883 -P frameworks/av/
safer-repopick -c 20 285884 285885 285886 285887 -P frameworks/base/
safer-repopick 285896 285897 -P packages/apps/Settings
safer-repopick 286071 -P build/make/
