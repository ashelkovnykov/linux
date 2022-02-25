# Encrypting Files 

## Using GnuPG

GPG stands for GnuPG, which is the open-source implementation of the OpenPGP standard (PGP stands for "Pretty Good
Privacy").

### Encrypt Files

```shell
gpg --symmetric /path/to/file
```

### Decrypt Files

```shell
gpg -d /path/to/encrypted/file
```

### Encrypt with Custom Cipher

```shell
gpg --symmetric --cipher-algo AES256 /path/to/file
```
