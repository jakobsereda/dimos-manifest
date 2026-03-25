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

echo -e "MACHINE ?= \"stm32mp1\"\n" >> "${WORKSPACE}/build/conf/local.conf"

echo -e "# Set distro\nDISTRO ?= \"openstlinux-weston\"\n" >> "${WORKSPACE}/build/conf/local.conf"

echo -e "# Reduce load on host" >> "${WORKSPACE}/build/conf/local.conf"
echo -e "BB_NUMBER_THREAD = \"4\"" >> "${WORKSPACE}/build/conf/local.conf"
echo -e "PARALLEL_MAKE = \"-j 4\"\n" >> "${WORKSPACE}/build/conf/local.conf"

echo -e "# Accept STM EULA" >> "${WORKSPACE}/build/conf/local.conf"
echo -e "ACCEPT_EULA_stm32mp1 = \"1\"\n" >> "${WORKSPACE}/build/conf/local.conf"

echo -e "IMAGE_INSTALL:append = \" flutter-engine flutter-pi dimos-app \"\n" >> "${WORKSPACE}/build/conf/local.conf"

echo -e "DISTRO_FEATURES:append = \" opengl \"\n" >> "${WORKSPACE}/build/conf/local.conf"

