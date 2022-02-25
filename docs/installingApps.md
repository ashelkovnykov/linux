# Installing New Applications

## `apt` Commands

```
sudo apt list                   list all available packages
sudo apt list --installed       list installed packages
sudo apt update                 check for latest versions of all isntalled packages
sudo apt upgrade                upgrade to the latest versions of all installed packages
```

## Installing Manually

1. Download file
2. Verify sha256 checksum: `sha256sum /path/to/file`
3. Unzip file
4. Move unzipped folder to a specific directory for manually installed tools (e.g. `~/apps/`)
5. Create a symbolic link in `/usr/local/bin` pointing to the binary for the new app:
`sudo ln -s ~/apps/[app name]/bin/[binary name] /usr/local/bin/[binary name]`
