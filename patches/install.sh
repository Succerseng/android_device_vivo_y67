echo $1
rootdirectory="$PWD"
# ---------------------------------

dirs="bionic"

for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo "Applying camera patches..."
	git apply $rootdirectory/device/vivo/y67/patches/$dir/camera_symbol.patch
	echo " "
done

dirs="build"

for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo "Applying OTA patches..."
	git apply $rootdirectory/device/vivo/y67/patches/$dir/fix_updater_Operation_not_permitted.patch
	echo " "
done

dirs="frameworks/base"

for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo "Applying wifi patches..."
	git apply $rootdirectory/device/vivo/y67/patches/$dir/fix_could_not_check_wifi_connection_status.patch
	echo ""
	echo "Applying fingerprint patches..."
	git apply $rootdirectory/device/vivo/y67/patches/$dir/remain_mcRegistry.patch
	echo " "
done

dirs="frameworks/av"

for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo "Applying camera patches..."
	git apply $rootdirectory/device/vivo/y67/patches/$dir/0009-add-mtk-color-format-support.patch
	echo " "
done

dirs="frameworks/native"

for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo "Applying graphic patches..."
	git apply $rootdirectory/device/vivo/y67/patches/$dir/frameworks_native_ui.patch
	echo " "
done

dirs="system/core"

for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo "Applying find OpenGL ES patches..."
	git apply $rootdirectory/device/vivo/y67/patches/$dir/0001-Remove-CAP_SYS_NICE-from-surfaceflinger.patch
	echo " "
done

dirs="system/sepolicy"

for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo "Applying sepolicy patches..."
	git apply --reject $rootdirectory/device/vivo/y67/patches/$dir/0003-Revert-back-to-policy-version-29.patch
	echo " "
done

# -----------------------------------
echo "Changing to build directory..."
cd $rootdirectory
