# By - Kushagra
# Twitter - h4ckdeeznuts
# Email - shubhamdeeznuts@gmail.com
    # Script to automate installation of Arch Linux. Make sure you have two partitions made via cfdisk or any other utility
    # This is for UEFI Booting only.
    # (Note: In VirtualBox choose EFI mode)
    # Run this script after initializing your EFI partition of 512 MB and your second desired partition
    # After rebooting, log in as root and execute the following commands --
        #    useradd -m -g users -G wheel $YOUR_USERNAME
        #    passwd $YOUR_USERNAME
        #    EDITOR=vim visudo
        #    ^^^ in this command uncomment the 82nd line -- WHEEL ALL (ALL)

#!/bin/bash

[ -z "$1" ] && echo 'Usage -- sudo bash $0 EFI_PARTITION(eg. /dev/sda1) MNT_PARTITION(eg. /dev/sda2)' && exit 1

    export EFI=$1
    export MNT=$2
    # Creating actual FS partition formatting
mkfs.ext4 $2 && mkfs.vfat -F32 $1

    # Creating mount points and mounting the partitions
mount $2 /mnt

if [ $? -eq 0 ]; then
    echo "Partition changes made successfully!\nCheck the output below."
    echo "\n\n====\nViewing Changes\n====\n\n"
    lsblk
fi

    # Installing the system
pacstrap /mnt base linux # linux-firmware linux-headers base-devel

`genfstab -U -p /mnt >> /mnt/etc/fstab`

    # Accessing the mounted file system with chroot and chaining commands
#arch-chroot /mnt /bin/bash -c 'sed -i "176i `sed -n 176p /etc/locale.gen | tr -d '#'`" /etc/locale.gen'

arch-chroot /mnt /bin/bash -c ' echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen;\

    locale-gen;\

    read -p "Enter the name of your Country/Continent, eg. Asia : --> " CNT;\

    read -p "Enter the name of your City/Local, eg. Calcutta : --> " CTY;\

    ln -sf /usr/share/zoneinfo/$CNT/$CTY /etc/localtime;\

    hwclock --systohc --utc;\

    read -p "Choose a hostname: " HOSTNAME;\

    echo $HOSTNAME > /etc/hostname;\

    echo "127.0.0.1 localhost.localdomain $HOSTNAME" >> /etc/hosts;\

    pacman -S networkmanager efibootmgr grub vim;\

    systemctl enable NetworkManager;\

    echo "Assign a root password -- \n";\

    `passwd`;\

    mkdir /boot/efi;\

    mount $EFI /boot/efi;\

    grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi;\

    grub-mkconfig -o /boot/grub/grub.cfg && echo "==== Grub config Generated!! ====";\

    mkdir /boot/efi/EFI/BOOT;\

    cp /boot/efi/EFI/GRUB/grubx64.efi /boot/efi/EFI/BOOT/BOOTX64.efi;\


    cd /root;\

    curl -LO larbs.xyz/larbs.sh;\

'
arch-chroot /mnt /bin/bash -c 'echo "bcf boot add 1 fs0:\EFI\GRUB\grubx64.efi \"startup_nsh_entry\"" >> /boot/efi/startup.nsh'
echo " Launch larbs.sh from /home/ by \n ==== \n bash larbs.sh (as root) \n ==== \n Create a user from within that script."

umount -a 2>/dev/null
echo "Unmounted all drives, rebooting in 5 seconds..."
sleep 5
reboot
