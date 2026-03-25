#!/bin/bash

WORKSPACE="$(pwd)"

# TODO: sanity check correct installed packages
# check if repo is installed
# dpkg -l repo
# if [[ $? -ne 0 ]] ; then
# 	exit 1
# fi

echo -e "initializing yocto build environment...\n"
source "${WORKSPACE}/layers/openembedded-core/oe-init-build-env"

# TODO: add layers
# TODO: append to local conf? this is a bad temp fix, the details should be in dimos layer...?

cat "test"
