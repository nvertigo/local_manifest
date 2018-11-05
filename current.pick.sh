#!/bin/bash

BUILD_ROOT=/usr/local/src/los15

cd ${BUILD_ROOT}

source build/envsetup.sh

#tristate button & Gallery2
repopick 215212 -f

#trust vendor patch
repopick 213836
repopick -f 217171

#battery customisation
repopick 220407 220422
repopick https://review.lineageos.org/#/c/LineageOS/android_packages_apps_LineageParts/+/221756/3 -P packages/apps/LineageParts
repopick https://review.lineageos.org/#/c/LineageOS/android_frameworks_base/+/221716/18 -P frameworks/base/
repopick 219299 -P packages/apps/Settings/

#libdisplayconfig: Depend on vendor.display.config@1.0_vendor
repopick 232229 -P hardware/qcom/display-caf/msm8996/
repopick 232228 -P hardware/qcom/display-caf/sdm845/
repopick 232227 -P hardware/qcom/display-caf/msm8998/

#Merge tag 'LA.UM.6.6.r1-09900-89xx.0' 
repopick 232913 -P hardware/qcom/audio-caf/msm8996/
repopick 232914 -P hardware/qcom/display-caf/msm8996/
repopick 232916 -P hardware/qcom/media-caf/msm8996/