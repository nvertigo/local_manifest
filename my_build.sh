#!/bin/bash

# if you want to build without using ccache, comment
# the next 4 lines
export USE_CCACHE=1
export CCACHE_DIR=~/.ccache
export CCACHE_MAX_SIZE=50G
ccache -M $CCACHE_MAX_SIZE

# encapsulate the build's temp directory.
# This way it's easier to clean up afterwards
TMP=$(mktemp -dt)
TMPDIR=$TMP
TEMP=$TMP

export TMP TMPDIR TEMP

#make sure jack-server is restarted in TMP
prebuilts/sdk/tools/jack-admin stop-server

# we want all compiler messages in English
export LANGUAGE=C

# set up the environment (variables and functions)
unset JAVAC

# use prebuilt python-2.7 instead of system python
export PATH=/usr/local/src/los16/prebuilts/python/linux-x86/2.7.18/bin:$PATH

source build/envsetup.sh

# clean the out dir; comment out, if you want to do
# a dirty build
# make -j9 ARCH=arm clean

# fire up the building process and also log stdout
# and stderrout
breakfast oneplus3 2>&1 | tee breakfast.log && \
brunch oneplus3 2>&1 | tee make.log

prebuilts/sdk/tools/jack-admin stop-server

# remove all temp directories
rm -r ${TMP}
