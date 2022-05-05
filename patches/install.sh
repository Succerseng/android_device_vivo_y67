echo $1
rootdirectory="$PWD"
# ---------------------------------

dirs="build"

for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo "Applying OTA patches..."
	git apply $rootdirectory/device/vivo/y67/patches/$dir/fix_updater_Operation_not_permitted.patch >> /dev/null 2&>1
	echo " "
done

dirs="frameworks/base"

for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo "Applying wifi patches..."
	git apply $rootdirectory/device/vivo/y67/patches/$dir/fix_could_not_check_wifi_connection_status.patch >> /dev/null 2&>1
	echo ""
	echo "Applying fingerprint patches..."
	git apply $rootdirectory/device/vivo/y67/patches/$dir/remain_mcRegistry.patch >> /dev/null 2&>1
	echo " "
done

dirs="frameworks/av"

for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo "Applying camera patches..."
	git apply $rootdirectory/device/vivo/y67/patches/$dir/0009-add-mtk-color-format-support.patch >> /dev/null 2&>1
	git apply $rootdirectory/device/vivo/y67/patches/$dir/frameworks_av.patch >> /dev/null 2&>1
	echo " "
done

dirs="system/core"

for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo "Applying symbol patches..."
	git apply $rootdirectory/device/vivo/y67/patches/$dir/load_LD_SHIM_LIBS.patch >> /dev/null 2&>1
	echo " "
done

dirs="system/sepolicy"

for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo "Applying sepolicy patches..."
	git apply $rootdirectory/device/vivo/y67/patches/$dir/sepolicy_temporary_amend.patch >> /dev/null 2&>1
	echo " "
done

# -----------------------------------
echo "Changing to build directory..."
cd $rootdirectory
