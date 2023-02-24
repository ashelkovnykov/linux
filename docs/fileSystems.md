# File Systems

File systems specify how data is stored on hard-drives and what kind of information can be attached to files.

## Partitions

A "partition" is a portion of the storage available on a hard disk or external drive that is logically separated for a
particular purpose (e.g. installing the OS) and uses a particular file system (e.g. ext4). Linux has a system limit of
16 partitions per disk. Typically, hard drives allow up to 4 "primary partitions", one of which may be an "extended
partition" which is a wrapper for many more "logical partitions".

The Linux naming convention for partitions is `/dev/sd[x][n]`, where:
* `x` is a letter of the alphabet representing the drive (drive names are assigned in alphabetical order)
* `n` is a number corresponding to the partitions position on the disk
* `dev` is a directory in root which holds files associated with the drives and devices attached to the system

### Primary Partition

A partition directly corresponding to an area on disk, defined in terms of first and last disk sector. The storage of a
primary partition is directly accessible by the BIOS and therefore can be used to hold boot files for an OS.

### Extended Partition

A primary partition used to hold logical partitions.

### Logical Partition

A partition stored within and managed by an extended partition. Logical partitions are not directly accessible by the
BIOS and therefore cannot be used to hold boot files for an OS.

## File System Types

### FAT32

The "File Allocation Table 32" (FAT32) file system is the oldest Windows file system. It was introduced with Windows 95
to replace the FAT16 file system introduced for MS-DOS.

#### Advantages

FAT32 is the de-facto standard for most storage media: it's supported by everything.

#### Disadvantages

* 4GB file size limit
* 8TB partition size limit

### NTFS

The "NT File System" (NTFS) is a modern file system used as the default for Windows. It was originally introduced for
Windows XP.

#### Advantages

* File size and partition limits are theoretically so huge that it's unlikely anyone will hit them
* File permissions
* Change journal for crash-recovery
* Shadow copies
* Encryption
* Disk quota limits
* Hard links

#### Disadvantages

NTFS has poor compatibility with non-Windows operating systems: Mac OS and most Linux distributions can only read from,
not write to, NTFS; the Sony Playstation and XBox 360 don't support NTFS at all.

### exFAT

The "Extended File Allocation Table" (exFAT) file system was introduced in 2006 with updates to Windows Vista. It's
optimized for flash drives and designed to be lightweight like FAT32, but without the advanced features and overhead of
NTFS.

#### Advantages

* File size and partition limits are theoretically so huge that it's unlikely anyone will hit them
* Compatible with Mac OS, Linux, and Sony Playstation

#### Disadvantages

* Limited features for use with flash drives
* Unsuitable for anything other than storage media

### ext2

TODO

### ext3

TODO

### ext4

TODO

### swap

TODO

## Linux Partitions Recommended Settings

| Partition | File System | Size                                                          |
|-----------|-------------|---------------------------------------------------------------|
| boot      | fat32       | 500MB                                                         |
| swap      | swap        | (MEM + sqrt(MEM))                                             |
| root      | ext4        | ~32GB                                                         |
| home      | ext4        | Whatever is left, minus ~32GB (in case you need another root) |

## Utilities

The following commands are useful for working with file systems and partitions.

### fdisk

The most commonly used command to check partition information for disks.

`sudo fdisk -l`

### parted

Command to list partitions and their size, file system, type, and flags.

`sudo parted -l`

### blkid

Prints device UUID and LABEL attributes.

`sudo blkid`

## Mounting Drives

To automatically mount a partition to a specific location, an entry must be added to the `/etc/fstab` file. An example
entry looks like the following:

```
/dev/sdb1 /storage/disk2p1 ext4 defaults 0 0
```

In order, the fields of the entry are as follows:

```
[device] [mounting directory] [file system] [options] [dump] [fsck]
```

These fields have the following meanings:
1. Device: the name of the physical device
2. Mounting Directory: the directory to which the device is mounted
3. File System: the type of the file system for the device (e.g. ext2, ext3, swap, etc.)
4. Options: mounting options and settings
5. Dump: priority option for the `dump` backup utility (if 0, then no backup; if non-zero, value represents order of backup)
6. fsck: priority option for the `fsck` file system check utility (if 0, then no check; if non-zero, value represents order of check)

### Using UUID and Label for `/etc/fstab`

The example `/etc/fstab` entry above works:

```
/dev/sdb1 /storage/disk2p1 ext4 defaults 0 0
```

However, there is a potential problem with adding entries like this one. `/dev/sdb1` is the first partition of the
second hard drive in the computer. Likewise, `/dev/sda1` is the first partition of the first hard drive, `/dev/sda2` is
the second partition of the first hard drive, and `/dev/sdb2` is the second partition of the second hard drive. However,
there is no guarantee that `/dev/sdb1` will always be `/dev/sdb1`. If the hard drives are reordered on the motherboard,
their device names will change, and the drives will be mounted to the wrong points, possibly resulting in data loss
and/or corruption.

The solution to this potential problem is to use device UUIDs or LABELs instead of device names. UUIDs are unique
identifiers generated by the system for each device and partition. Even between different systems, the probability of
duplicate UUIDs is almost zero. LABELs are short names that can be configured by the user when he formats a partition.
LABELs are helpful, but may not be unique between multiple systems.

#### Finding the UUID and LABEL of a Partition

To find the UUID of a drive (and the LABEL, if one exists) use the following command:

```shell
sudo blkid | grep -v loop
```

#### Mounting Partitions Using UUID or LABEL

To mount a drive partition using the UUID or LABEL instead of the device name, modify the above example `/etc/fstab`
entry as follows:

```
UUID=bd5808de-29e9-4ba4-ae80-343d1a227cc8 /storage/disk2p1 ext4 defaults 0 0
LABEL=home /storage/disk2p1 ext4 defaults 0 0
```

### Tips

* `mount` does not assign permissions to the drive; permissions are controlled by the bits on the directory within the
  file system after it's mounted
