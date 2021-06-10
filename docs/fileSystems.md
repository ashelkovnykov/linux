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

A partition that lives inside of and is managed by an extended partition. Logical partitions are not directly accessible
by the BIOS and therefore cannot be used to hold boot files for an OS.

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

* File size and partition limits are so theoretically huge, that it's unlikely anyone will hit them
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

* File size and partition limits are so theoretically huge, that it's unlikely anyone will hit them
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

Partition | File System | Size
--- | --- | ---
boot | fat32 | 16GB
swap | swap | (MEM + sqrt(MEM))
root | ext4 | ~50GB
home | ext4 | Whatever is left, minus ~50GB (in case you need another root)

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
