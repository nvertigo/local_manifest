#!/bin/bash

cd ${BUILD_ROOT}

patch -p1 <${LOCAL_MANIFEST}/display-caf-8996.diff
patch -p1 <${LOCAL_MANIFEST}/media-caf-8996.diff
