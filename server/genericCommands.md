# Server Tips

This file contains generic commands which you may need to run while administrating a server.

## Accessing `root` On Your VPS

`root` can be accessed on most VPSes using the following command:

```
sudo su -
```

## Backup Entire Pi Server OS

To backup the entire Pi OS, mount the micro SD containing the OS on another computer, and run the following command:

```shell
sudo dd if=[mount point] of=[backup path] bs=4M
```

For example:

```shell
sudo dd if=/dev/sdb of=~/backup/backup.img bs=4M
```

### Recover Pi OS

To recover the entire Pi OS from an image, simply reverse the above operation:
```shell
sudo dd if=~/backup/backup.img of=/dev/sdb bs=4M
```
