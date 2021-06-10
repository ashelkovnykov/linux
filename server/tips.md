# Server Tips

## Keep an Empty, 8GB File on Your Server

If the disk fills up completely on a Linux server, it becomes difficult for many processes to function. In particular,
copy and delete commands will either fail or take a very long time as the files thrash between disk and memory.

Ideally, a server would never fill its disk completely, but it could happen due to a bug or design flaw. When it does,
having an 8GB file to delete buys time and space to resolve the issue. With the size of modern hard drives, 8GB is an
insignificant amount of storage, but it's a crucial amount if/when a server fills up.
