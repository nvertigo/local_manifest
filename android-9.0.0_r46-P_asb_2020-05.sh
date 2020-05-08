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

safer-repopick -t P_asb_2020-05 -e 275016,275017,275019,275020,275021,275022,275023,275024,275025,275027
safer-repopick 275016 275017 -P frameworks/av/
safer-repopick 275019 275020 275021 275022 275023 275024 275025 -P frameworks/base/
safer-repopick 275027 -P packages/apps/Settings
