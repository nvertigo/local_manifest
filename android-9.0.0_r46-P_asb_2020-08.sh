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

safer-repopick -t P_asb_2020-08 -e 282398,282399,282400,282401,282402,282403,282404,282405,282406,282407,282519
safer-repopick 282398 282399 282400 -P frameworks/av/
safer-repopick 282401 282402 282403 282404 282405 282406 -P frameworks/base/
safer-repopick 282407 -P packages/apps/Settings
safer-repopick 282519 -P build/make/
