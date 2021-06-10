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

### Determine DNS Servers

Determine the DNS servers that are used by your router by checking `/etc/resolv.conf`:

```shell
user@linux:~$cat /etc/resolv.conf

nameserver 127.0.0.53
nameserver 8.8.8.8
options edns0 trust-ad
```

Any IP addresses preceded by "nameserver" are DNS servers for the router.

### Update the `/etc/dhcpcd.conf` File

Use the above information to append the following to the bottom of the `/etc/dhcpcd.conf` file:

```
interface wlan0
static ip_address=192.168.1.11
static routers=192.168.1.1
static domain_name_servers=127.0.0.53 8.8.8.8
```
