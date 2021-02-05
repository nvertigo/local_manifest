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

safer-repopick -t P_asb_2021-02 -e 303324,303328,303329,303330,303331,303332,303336,303337,303338,303628,303629
safer-repopick 303324 -P android/
safer-repopick -c 30 303328 303329 303330 303331 303332 303628 -P frameworks/base/
safer-repopick 303336 303337 303338 -P packages/apps/Settings
safer-repopick 303629 -P build/make/
