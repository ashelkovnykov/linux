# Authenticating SSH Using Key Files

The most secure way to ssh into a machine or to use scp is by generating a cryptographic key-pair, and registering the
public key with the remote server.

## Generating New Keys

New ssh keys can be generated using the `ssh-keygen` command.

## Registering Keys on a Remote Server

To register an ssh key on a remote server, it needs to be added to the "authorized keys" file. The "authorized keys"
file is by default located at `~/.ssh/authorized_keys` for whichever user to which access is needed on the remote
server.

Where the system will search for the "authorized keys" file is set in `/etc/ssh/ssh_config`, using the
"AuthorizedKeysFile" option. The option may contain more than one location, separated by spaces. The option accepts the
following variables:
* "%h" is the home directory of the user being authenticated
* "%u" is the username of the user being authenticated

For example, "%h/.ssh/%u_auth_keys" would cause the system to search for the "authorized keys" file of user "eric" at
`/home/eric/.ssh/eric_auth_keys`.

### Format of the "Authorized Keys" File

The "authorized keys" file lists keys that are used authorized to authenticate the user, one per line. Empty lines and
lines that begin with the '#' character are ignored. Each line contains a public SSH key, which may be preceded by
options which control what can be done with that key. The full list of options and their descriptions is available
[here](https://www.ssh.com/academy/ssh/authorized_keys/openssh).
