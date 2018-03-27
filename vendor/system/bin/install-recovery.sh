#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 41132032 d8401349a0a6a6d6a544859e0a09e08add6e24cc 33785856 24649b738992c2fa4bacdbabed8aef11c4391a6c
fi
if ! applypatch -c EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY:41132032:d8401349a0a6a6d6a544859e0a09e08add6e24cc; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/155a0000.ufs/by-name/BOOT:33785856:24649b738992c2fa4bacdbabed8aef11c4391a6c EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY d8401349a0a6a6d6a544859e0a09e08add6e24cc 41132032 24649b738992c2fa4bacdbabed8aef11c4391a6c:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
