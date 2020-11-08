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

safer-repopick -t P_asb_2020-11 -e 291373,291377,291378,291379,291380,291381,291953
safer-repopick 291373 -P android/
safer-repopick -c 30 291377 291378 291379 291380 291381 -P frameworks/base/
safer-repopick 291953 -P build/make/
