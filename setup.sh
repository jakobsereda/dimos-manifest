#!/bin/bash

WORKSPACE="$(pwd)"

source "${WORKSPACE}/layers/openembedded-core/oe-init-build-env"

for repo in "${WORKSPACE}/layers"
do
	bitbake-layers add-layer "${WORKSPACE}/layers/${repo}"
done

# TODO: append to local conf? this is a bad temp fix, the details should be in dimos layer...?

cat "test"
