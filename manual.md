
Manual for building LineageOS 14.1 for vivo y67
| Step                | Task                                                                                                                 |
| :-------------------| :--------------------------------------------------------------------------------------------------------------------|
| 1.Init source       | repo init -u git://github.com/LineageOS/android.git -b cm-14.1                                                       |
| 2.download source   | repo sync                                                                                                            |
| 3.Init device files | git clone https://github.com/succerseng/android_device_vivo_y67.git device/vivo/y67                                  |
|                     | git clone https://github.com/succerseng/android_vendor_vivo_y67.git vendor/vivo/y67                                  |
| 4.Apply patches     | . device/vivo/y67/patches/install.sh                                                                                 |
| 5.Setup enviroment  | source build/envsetup.sh                                                                                             |
| 6.Start build       | lunch lineage_y67-userdebug && m otapackage -j16                                                                     |


