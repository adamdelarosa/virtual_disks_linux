#!/bin/bash


#Create dir for mount:
sudo mkdir /mnt/data01
sudo mkdir /mnt/data02

#Create the disk files:
fallocate -l 100m active-mount_01.img
fallocate -l 100m active-mount_02.img

#Making dd to disks:
dd if=/dev/zero of=active-mount_01.img bs=1M count=100
dd if=/dev/zero of=active-mount_02.img bs=1M count=100

#Format the drives:
yes | mkfs -t  ext3 active-mount_01.img
yes | mkfs -t  ext3 active-mount_02.img

#Mount the drives:
sudo mount -t auto -o loop active-mount_01.img /mnt/data01/
sudo mount -t auto -o loop active-mount_02.img /mnt/data02/  

#Echo folders and mounts:
echo "Mount folders: "
mount | grep mnt

