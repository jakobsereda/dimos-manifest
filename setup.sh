#!/bin/bash

WORKSPACE="$(pwd)"

source "${WORKSPACE}/layers/openembedded-core/oe-init-build-env"

declare -a layers=(
	"${WORKSPACE}/layers/meta-openembedded/meta-oe"
 	"${WORKSPACE}/layers/meta-openembedded/meta-python"
 	"${WORKSPACE}/layers/meta-openembedded/meta-networking"
 	"${WORKSPACE}/layers/meta-openembedded/meta-gnome"
 	"${WORKSPACE}/layers/meta-openembedded/meta-webserver"
 	"${WORKSPACE}/layers/meta-openembedded/meta-multimedia"
 	"${WORKSPACE}/layers/meta-clang"
 	"${WORKSPACE}/layers/meta-flutter"
 	"${WORKSPACE}/layers/meta-st-stm32mp"
 	"${WORKSPACE}/layers/meta-st-openstlinux"
 	"${WORKSPACE}/layers/meta-flutter/meta-flutter-apps"
 	"${WORKSPACE}/layers/meta-dimos"
)

for layer in "${layers[@]}" ; do
	bitbake-layers add-layer "$layer"
done

# TODO: append to local conf? this is a bad temp fix, the details should be in dimos layer...?

cat "test"
