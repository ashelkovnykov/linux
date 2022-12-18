# Generic Commands

Below is a collection of useful Linux commands that may come up day-to-day.

## Check Amount of Physical Memory from Linux

The command to do this is `cat /proc/meminfo`.

## Copy first XX bytes of file

```shell
head -c XX file.in > file.out
```

## Copy last XX bytes of file

```shell
head -c -XX file.in > file.out
```

## Count number of lines in a file

```shell
wc -l file.in
```

## Detect Browser Version

### Vivaldi

```
Help > About
```

## Detect Linux Kernel Version

```shell
uname -r
```

## Detect Linux OS Version

```shell
cat /etc/os-release
```

### Debian

You can check the Debian version with the command:
```shell
cat /etc/debian_version
```

```
Ubuntu            Debian  
21.10  impish     bullseye/ sid   - 11
21.04  hirsute    bullseye/ sid   
20.10  groovy     bullseye/ sid
20.04  focal      bullseye/ sid
19.10  eoan       buster  / sid   - 10
19.04  disco      buster  / sid
18.10  cosmic     buster  / sid
18.04  bionic     buster  / sid
17.10  artful     stretch / sid   - 9
17.04  zesty      stretch / sid
16.10  yakkety    stretch / sid
16.04  xenial     stretch / sid
15.10  wily       jessie  / sid   - 8
15.04  vivid      jessie  / sid
14.10  utopic     jessie  / sid
14.04  trusty     jessie  / sid
13.10  saucy      wheezy  / sid   - 7
13.04  raring     wheezy  / sid
12.10  quantal    wheezy  / sid
12.04  precise    wheezy  / sid
11.10  oneiric    wheezy  / sid
11.04  natty      squeeze / sid   - 6
```

## Disabling Network Adapters

To disable/enable a network adapter such as `eth0` or `wlan0`, use the following commands:
```shell
sudo ifconfig eth0 down
sudo ifconfig eth0 up
```

## Run Command as Another User

The easiest way is to save the command as a bash script, and then run:
```shell
su -c '/path/to/bash/script' other-user
```

For a system user, the command is instead:
```shell
su -s /bin/bash -c '/path/to/bash/script' other-user
```
