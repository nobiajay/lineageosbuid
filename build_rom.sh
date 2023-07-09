# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/LineageOS/android.git -b lineage-20.0 --git-lfs -g default,-mips,-darwin,-notdefault
git clone https://github.com/phhgsi/local_manifest.git --depth 1 -b main .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
source build/envsetup.sh
lunch lineage_CPH2381-userdebug
export KBUILD_BUILD_USER=ajaysingh
export KBUILD_BUILD_HOST=ajayphhgsi
export BUILD_USERNAME=ajaysingh
export BUILD_HOSTNAME=ajayphhgsi
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export TZ=Asia/Dhaka #put before last build command
make bacon