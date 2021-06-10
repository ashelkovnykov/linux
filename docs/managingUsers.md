# Managing Users

One of the primary responsibilities of a systems administrator is managing the user accounts for the system, as well as
their groups and permissions.

## Adding Users

New users are created using the `useradd` command (note that using this command requires write access to
`/etc/passwd`). Unless explicitly overriden by the command, `useradd` will use the default settings found in
`/etc/default/useradd`.

### Examples

Create new user with default options:
```shell
sudo useradd new-user
```

Create new user with home directory in a different location:
```shell
sudo useradd -m -d /home/accounts/new-user new-user
```

Create new user with an expiry date:
```shell
sudo useradd -e 2022-12-25 new-user
```

Create new user with group membership:
```shell
sudo useradd -g admin new-user
```

## Changing a User's Password

The `passwd` command is used to set a user's password (note that using this command requires write access to
`/etc/passwd`).

```shell
sudo passwd new-user
```

### `/etc/passwd`

The `/etc/passwd` file contains multiple entries like the one below, one for each user:
```
some-user:x:1009:1010:Walter Melon:/home/some-user:/bin/bash
```

This is a colon-delimited, ordered list of the following fields:
1. Username
2. Encrypted password
3. User ID
4. User's group ID
5. Full name of user
6. User's home directory
7. User's login shell

#### Password Field

If an account has a password, the second field of the `/etc/passwd` entry for that account will always be just "x". In
older versions of Linux, this would not be so, but nowadays the encrypted passwords are stored in `/etc/shadow`.

## Adjusting User Login Settings

The user login process is governed by several settings located in `/etc/login.defs`:

* PASS_MAX_DAYS: The number of days before a password expires
* PASS_MIN_DAYS: The minimum number of days before a password can be changed
* PASS_WARN_AGE: The number of days in advance that a password expiry warning will be issued
* LOGIN_RETRIES: The maximum number of login attempts before failure
* LOGIN_TIMEOUT: The amount of time allowed to elapse for a login attempt before failure
* DEFAULT_HOME: Whether or not users can login without a home folder

## Managing User Groups

### View All Groups for System

To view all of the groups that exist on a system, their numerical IDs, and which users are members of the group, run the
following command:

```shell
getent group
```

The above command can also be used to list the aforementioned information for only a particular group:

```shell
getent group sudo
```

### Creating a New Group

The `groupadd` command creates new groups (note that using this command requires write access to `/etc/passwd`).

```shell
sudo groupadd new-group
```

### View Groups of Which User is Member

To view the group memberships of a user, run the following command:

```shell
sudo groups some-user
```

If the numerical group IDs are required, run the following command instead:

```shell
sudo id some-user
```

### Change a User's Primary Group

Users can be members of multiple groups. However, one of the groups is always considered the user's primary group: the
files and folders that the user creates will be assigned to the primary group. To change a user's primary group, run the
following command:

```shell
sudo usermod -g some-group some-user
```

### Add a User to a Secondary Group

Users can be members of any number of secondary groups. To add a user to a new secondary group, run the following
command:

```shell
sudo usermod -a -G some-group some-user
```

### Remove a User From a Group

Removing a user from a group is done by re-specifying his group memberships and leaving out the groups of which he
should no longer be a member. The command to do this is very similar to the command to add a user to a group, only
excluding the `-a` option, which means "append" and signals that the groups listed are not meant to replace the existing
groups.

```shell
sudo usermod -G group-to-keep-1,group-to-keep-2,... some-user
```

## Deleting Users

To properly delete a user account as a systems administrator requires a number of steps. However, some of the steps may
be skipped depending on the particulars of the system.

The worst-case scenario for a sysadmin is that a user account needs to be deleted because the owner is being fired for
malicious behaviour. The user is currently logged in, and unaware that he is about to be escorted from the premises.

### Check Login Status

The `who` command will list all active sessions.

### Review User Processes

If the user is logged in, the next step is to check what processes he is running. This can be done using either the `ps`
or `top` commands:

```shell
ps -u bad-user
top -U bad-user
```

The goal is to kill all of the malicious user's processes. The purpose of this step is to first double-check whether
this will affect other users.

### Lock Account

The `passwd` command can be used to lock the malicious user's account:

```shell
sudo passwd -l bad-user
```

### Kill Processes

The `pkill` command will find and kill all of the malicious user's processes. This process will log the user out, which
is why the preceding step is to lock his password: so that he cannot log back in.

```shell
sudo pkill -KILL -u bad-user
```

### Archive Home Directory

In a situation as described above, it's likely that access to the malicious user's files will later be needed as part of
an investigation or legal proceeding. For that reason, it would be wise to backup those files.

```shell
sudo tar cfvz bad-user_2021-12-25.tar.gz /home/bad-user
```

### Remove `cron` Jobs

If a malicious user knows that he is about to be removed, he may schedule malicious jobs in advance. Alternatively, he
may schedule them every week and disable them the day before if he hasn't been caught yet, as a sort of dead-hand.
Scheduled `cron` jobs live in `/var/spool/cron/crontabs/[username]`: if this directory is non-empty, then the user has
`cron` jobs scheduled. They can be removed with the `crontab` command:

```shell
sudo crontab -r -u bad-user
```

### Delete User Account

The final step is to delete the account of the malicious user. Depending on the particular Linux distribution, one of
two commands will do this:

```shell
# Debain-based distributions
sudo deluser --remove-home bad-user

# All other distros
sudo userdel --remove bad-user
```
