echo 'Cloning stuff needed to build for vili'

# Device common
echo 'Cloning common device tree'
git clone https://github.com/0mar99/android_device_xiaomi_sm8350-common.git -b derp device/xiaomi/sm8350-common

# Kernel
echo 'Cloning kernel'
git clone https://github.com/0mar99/android_kernel_xiaomi_sm8350.git --recursive -b lineage-21 kernel/xiaomi/sm8350

# Hardware Xiaomi
echo 'Cloning hardware xiaomi'
rm -rf hardware/xiaomi
git clone https://github.com/0mar99/android_hardware_xiaomi.git -b lineage-21 hardware/xiaomi

# Vendor
echo 'Cloning vendor tree'
git clone https://github.com/0mar99/proprietary_vendor_xiaomi_vili.git -b lineage-21 vendor/xiaomi/vili

# Vendor common
echo 'Cloning common vendor tree'
git clone https://github.com/0mar99/proprietary_vendor_xiaomi_sm8350-common.git -b lineage-21 vendor/xiaomi/sm8350-common

# Leica camera
echo 'Cloning Leica camera'
git clone https://gitlab.com/0mar99/proprietary_vendor_xiaomi_camera.git -b leica vendor/xiaomi/camera

# Firmware
echo 'Cloning firmware'
git clone --depth=1 https://gitlab.com/0mar99/vili-firmware.git -b global vendor/xiaomi/vili-firmware

# Leica patch
echo 'Adding Leica camera patch'
cd frameworks/base
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/14/Leicamera/0001-Add-backwards-compatible-CaptureResultExtras-constructor.patch
patch -p1 <0001-Add-backwards-compatible-CaptureResultExtras-constructor.patch
cd ../..

# Audio
echo 'Adding audio-app support'
cd system/core
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/14/Audio-app-main/0001-Add-audio-app-support.patch
patch -p1 <0001-Add-audio-app-support.patch
cd ../..

# VoNR
echo 'Enabling VoNR by default'
cd frameworks/base
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/14/VoNR/0001-Enable-VoNR-by-default.patch
patch -p1 <0001-Enable-VoNR-by-default.patch
cd ../..

echo 'delete vendorsetup.sh from device tree once this is done'
