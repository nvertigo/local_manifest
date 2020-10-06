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

safer-repopick -t P_asb-2020-10 -e 288750,288771,288772,288773,288774,288780,288898
safer-repopick -c 30 288750 288771 288772 288773 288774 -P frameworks/base/
safer-repopick 288780 -P packages/apps/Settings/
safer-repopick 288898 -P build/make/
