# Static IPs

A static IP address is one that is permanently assigned to a router by an ISP. Usually, these are assigned to various
servers: web, FTP, and email. They're also useful for VoIP applications and weather monitoring stations. However, static
IPs are much more expensive than dynamic IPs, less private, and drastically more likely to be hacked.

## Enabling Static IP from Router

### Determine Default Gateway

Determine the default gateway for your router using the `ifconfig` command:

```shell
user@linux:~$ifconfig

wlp0s20f3: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.1.11  netmask 255.255.255.0  broadcast 192.168.1.255
        inet6 fe80::d67f:4c84:4aac:a7e7  prefixlen 64  scopeid 0x20<link>
        ether 3c:f0:11:38:60:bc  txqueuelen 1000  (Ethernet)
        RX packets 5753297  bytes 6239588011 (6.2 GB)
        RX errors 0  dropped 271470  overruns 0  frame 0
        TX packets 2304134  bytes 413138763 (413.1 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```

From this we can determine that the default gateway is `192.168.1.1` (it is for most routers), that the current IP
(which should be made static) is `192.168.1.11`, and that the network mask is `255.255.255.0`, meaning that valid IP
addresses for this router will be in the range `192.168.1.0` to `192.168.1.255`.

If your OS doesn't have the `ifconfig` command, then instead you can use `ip addr`:

```shell
user@linux:~$ip addr

1: wlp0s20f3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 3c:f0:11:38:60:bc brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.11/24 brd 192.168.1.255 scope global noprefixroute wlp0s20f3
       valid_lft forever preferred_lft forever
    inet6 2600:8801:1080:82::f1/128 scope global dynamic noprefixroute 
       valid_lft 596910sec preferred_lft 596910sec
    inet6 2600:8801:1080:82:97c3:ceb9:a9aa:a32c/64 scope global temporary dynamic 
       valid_lft 292sec preferred_lft 292sec
    inet6 2600:8801:1080:82:7481:a6d1:d838:654f/64 scope global dynamic mngtmpaddr noprefixroute 
       valid_lft 292sec preferred_lft 292sec
    inet6 fe80::cf7a:a9d5:285e:a104/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
```

### Determine DNS Servers

Determine the DNS servers that are used by your router by checking `/etc/resolv.conf`:

```shell
user@linux:~$cat /etc/resolv.conf

nameserver 127.0.0.53
nameserver 8.8.8.8
options edns0 trust-ad
```

Any IP addresses preceded by "nameserver" are DNS servers for the router.

### Update the System Network Preferences

#### Rasberry Pi

Use the above information to append the following to the bottom of the `/etc/dhcpcd.conf` file:

```
interface wlan0
static ip_address=192.168.1.11
static routers=192.168.1.1
static domain_name_servers=127.0.0.53 8.8.8.8
```

#### Debain/Ubuntu/Pop

The above information can be manually entered into a graphical interface for a particular ethernet or wireless
connection using the wireless settings for the OS.
