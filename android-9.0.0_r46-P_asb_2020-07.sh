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

safer-repopick -t P_asb_2020-07 -e 280656
safer-repopick 280656 -P android/