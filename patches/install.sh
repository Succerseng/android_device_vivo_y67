echo $1
rootdirectory="$PWD"
# ---------------------------------

dirs="build"

for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo "Applying $dir patches..."
	git apply $rootdirectory/device/vivo/y67/patches/$dir/*.patch >> /dev/null 2&>1
	echo " "
done

dirs="frameworks/base"

for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo "Applying $dir patches..."
	git apply $rootdirectory/device/vivo/y67/patches/$dir/*.patch >> /dev/null 2&>1
	echo " "
done

dirs="system/core"

for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo "Applying $dir patches..."
	git apply $rootdirectory/device/vivo/y67/patches/$dir/*.patch >> /dev/null 2&>1
	echo " "
done

dirs="system/sepolicy"

for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo "Applying $dir patches..."
	git apply $rootdirectory/device/vivo/y67/patches/$dir/*.patch >> /dev/null 2&>1
	echo " "
done

# -----------------------------------
echo "Changing to build directory..."
cd $rootdirectory
