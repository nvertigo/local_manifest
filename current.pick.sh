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

# Sounds: Squashed cleanup of sound files
safer-repopick 236765 -P frameworks/base -f

# SDCLANG-6: fix declaration
safer-repopick 219760 -P system/nfc/

# pie-msim-ringtones
safer-repopick -t pie-msim-ringtones -e 233633,233634,237209 -f
safer-repopick 233633 -P frameworks/base/ -f
safer-repopick 233634 -P packages/apps/Settings/ -f
safer-repopick 237209 -P vendor/lineage/

# p-display-shrink
safer-repopick 231827 -P frameworks/base/
safer-repopick 231847 -P frameworks/base/
safer-repopick 231848 -P frameworks/base/
safer-repopick 231851 -P frameworks/base/
safer-repopick 231852 -P frameworks/base/
safer-repopick 237500 -P packages/apps/Settings
safer-repopick 231828

# pie-onehandmode-tile
safer-repopick 251522 -P frameworks/base/
safer-repopick 251523 -P lineage-sdk/

# swipe_screenshot
safer-repopick 247884 -P packages/apps/Settings
safer-repopick 247885 -P lineage-sdk/
safer-repopick 247886 -P frameworks/base/

# Dialer: Add autorecord feature
safer-repopick 251235

# APNs: add IMS APNs for Airtel [IN]
safer-repopick 242686 -P vendor/lineage/

# button-shrink
safer-repopick 264101 -P frameworks/base/
safer-repopick 264102 -P lineage-sdk/
safer-repopick 264103 -P packages/apps/LineageParts/

# Added policy based firewall in the security tab.
repopick 265237 -P frameworks/base/
repopick 265238 -P packages/apps/LineageParts/
repopick 265239 -P packages/apps/Settings

# Longshot
${LOCAL_MANIFEST}/current.pick.git.sh
