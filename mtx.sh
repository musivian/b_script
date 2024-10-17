#!/bin/bash

# Removals
rm -rf .repo/local_manifests

# Initialize repo with specified manifest
repo init -u https://github.com/ProjectMatrixx/android.git -b 14.0 --git-lfs

# Clone local_manifests repository
git clone https://github.com/musivian/local_manifests --depth 1 -b main .repo/local_manifests

# Sync the repositories
/opt/crave/resync.sh

#customs
rm -rf frameworks/base
git clone https://github.com/musivian/android_frameworks_base.git -b 14.0 frameworks/base --depth=1

#Private Keys
rm -rf vendor/lineage-priv
git clone https://github.com/shravansayz/private_keys.git -b mat vendor/lineage-priv

export BUILD_USERNAME=ZN
export BUILD_HOSTNAME=crave

#build
source build/envsetup.sh
lunch lineage_sunny-ap2a-user
m installclean
m bacon
