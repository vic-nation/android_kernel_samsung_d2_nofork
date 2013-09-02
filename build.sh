#!/bin/bash
make distclean
export CROSS_COMPILE=/home/john/platforms/cm-10.2/prebuilts/gcc/linux-x86/arm/arm-eabi-4.7/bin/arm-eabi-
export ARCH=arm

# sed -i s/CONFIG_LOCALVERSION=\".*\"/CONFIG_LOCALVERSION=\"-interloper-${1}\"/ .config
# make gogh_extracted_defconfig
make cyanogen_goghspr_defconfig
#export KCONFIG_VARIANT=goghspr_defconfig
#make gogh_extracted_defconfig
make modules
make -j16 zImage 2>&1 | tee ~/logs/oudhs_d2.txt
#make -j16 zImage 2>&1 | tee ~/logs/oudhs_extracted_d2_exp.txt

[ -d modules ] || mkdir -p modules
find -name '*.ko' -exec cp -av {} modules/ \;
geany ~/logs/oudhs_d2.txt
#geany ~/logs/oudhs_extracted_d2_exp.txt
exit 1


