#!/bin/bash

BUILD_ROOT=/usr/local/src/los16
LOCAL_MANIFEST=my_tmp/local_manifest

export BUILD_ROOT LOCAL_MANIFEST

# use prebuilt python-2.7 instead of system python
export PATH=/usr/local/src/los16/prebuilts/python/linux-x86/2.7.18/bin:$PATH

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

safer-repopick -t P_asb_2021-03 -e 304997,304998,304999,305006,305009
safer-repopick 304997 -P android/
safer-repopick 304998 304999 -P art/
safer-repopick -c 30 305006 -P frameworks/base/
safer-repopick 305009 -P build/make/
