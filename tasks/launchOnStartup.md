# Launching a Program on Startup

This document describes how to launch a system service at boot using `systemd`.

## Creating the Service Unit File

Each program started by `systemd` has a definition file called a "service unit file". This file contains information 
about where `systemd` can locate the program, how it should launch the program, and how it should govern its behaviour.

The service unit file also defines the name for the program as a service. Each service name must be unique. The full
list of existing service names can be queried using the following command:
```shell
sudo systemctl list-unit-files --type=service
```

The service unit files are stored in `/etc/systemd/system/`. Below is an example of a service unit file:
```
[Unit]
Description=VPN daemon
Wants=network.target
After=network-online.target
After=NetworkManager.service
After=systemd-resolved.service
StartLimitBurst=5
StartLimitIntervalSec=20

[Service]
Restart=always
RestartSec=1
ExecStart=/opt/VPN/resources/vpn-daemon -v --disable-stdout-timestamps

[Install]
WantedBy=multi-user.target
```

The full lists of [unit](https://www.freedesktop.org/software/systemd/man/systemd.unit.html) and
[service](https://www.freedesktop.org/software/systemd/man/systemd.service.html) settings and their meanings are linked
here.

### Tips

* It's a good idea to strictly control the permissions of service unit files.
* It's possible to check for syntax errors in a service unit file before launching it using the command `systemctl status [service name]`

## Starting the Service on Boot

Any time a new service file is added or an existing service file is edited, `systemd` needs to reload the file
definition. This is done with the following command:
```shell
sudo systemctl daemon-reload
```

To launch a service at startup, it needs to be enabled:
```shell
sudo systemctl enable [service name]
```

## Starting the Service Immediately

To start the service now, use the following command:
```shell
sudo systemctl start [service name]
```

## Verifying the Service

To verify whether a service is running correctly, use the following command:
```shell
sudo systemctl status [service name]
```

## Stopping the Service Immediately

To stop a running service immediately, use the following command:
```shell
sudo systemctl stop [service name]
```

## Disabling the Service at Startup

To stop a service from launching at startup, it needs to be disabled:
```shell
sudo systemctl disable [service name]
```
