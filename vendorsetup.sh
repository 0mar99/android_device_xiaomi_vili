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

# Firmware
echo 'Cloning firmware'
git clone --depth=1 https://gitlab.com/0mar99/vili-firmware.git -b global vendor/xiaomi/vili-firmware

# Display HAL (for Dolby Vision)
echo 'Cloning custom display HAL'
rm -rf hardware/qcom-caf/sm8350/display
git clone https://github.com/0mar99/android_hardware_qcom_display.git -b lineage-21.0-caf-sm8350 hardware/qcom-caf/sm8350/display

# Additional patches
echo 'Adding additional patches'
cd frameworks/av && git fetch https://github.com/0mar99/derp_frameworks_av.git && git cherry-pick b934b77202164329ed3abae523dd732dc37db4ab^..890e86b4aae143e97890670fc6769e40ff9f305a
cd ../..

echo 'delete vendorsetup.sh from device tree once this is done'
