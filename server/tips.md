# Server Tips

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

## Disabling Network Adapters

To disable/enable a network adapter such as `eth0` or `wlan0`, use the following commands:
```shell
sudo ifconfig eth0 down
sudo ifconfig eth0 up
```

## Keep an Empty, 8GB File on Your Server

If the disk fills up completely on a Linux server, it becomes difficult for many processes to function. In particular,
copy and delete commands will either fail or take a very long time as the files thrash between disk and memory.

Ideally, a server would never fill its disk completely, but it could happen due to a bug or design flaw. When it does,
having an 8GB file to delete buys time and space to resolve the issue. With the size of modern hard drives, 8GB is an
insignificant amount of storage, but it's a crucial amount if/when a server fills up.

The following command can be used to generate a file of the desired size:

```shell
dd if=/dev/zero of=garbage.can bs=1M count=8192
```

## Determine Which Ports are Open on Your Server

If you forget which ports are open on your server, you can use a portscanner tool such as [this one](https://spyse.com/tools/port-scanner) (though a
terminal-based one would be more secure) to determine which ports are open.

## Accessing `root` On Your VPS

`root` can be accessed on most VPSes using the following command:

```
sudo su -
```

