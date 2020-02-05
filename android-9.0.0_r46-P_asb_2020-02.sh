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

safer-repopick -t P_asb_2020-02 -e 268163,268164,268165,268166,268167,268168,268176
safer-repopick 268163 268164 268165 268166 268167 268168 -P frameworks/base/
safer-repopick 268176 -P packages/apps/Settings
