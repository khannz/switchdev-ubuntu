#!/bin/sh
echo -n "I: Tuning fstab... "
mkdir -p $PROJECT_PATH/mnt/onie-boot
echo "# |fs              |mount point    |type   |options                    |dump    |pass
   LABEL=NOSU       /               ext4    relatime,errors=remount-ro  0        1
   LABEL=ONIE-BOOT  /mnt/onie-boot  auto    defaults                    0        0
" > $PROJECT_PATH/etc/fstab
printf "\e[92mDONE\e[0m\n"
