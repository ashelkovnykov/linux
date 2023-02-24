## Difference between `${}` and `$()`

`$(command)` is modern syntax for `` `command` ``, which is command substitution
("run the command and put its output here").

`${var}` is just a disambiguation mechanism. If you have the variables `VAR` and
`VARTEXT`, then something like this is needed to correctly print the value of
`VAR` followed by "TEXT":
```shell
echo "${VAR}TEXT"
```

## Difference between `$0` and `$BASH_SOURCE[0]`

```
$ cat outer.sh
#!/usr/bin/env bash
./middle.sh
```
```
$ cat middle.sh
#!/usr/bin/env bash
./inner.sh
```
```
$ cat inner.sh
#!/usr/bin/env bash
echo "\$0 = '$0'"
echo "\${BASH_SOURCE[0]} = '${BASH_SOURCE[0]}'"
echo "\${BASH_SOURCE[1]} = '${BASH_SOURCE[1]}'"
echo "\${BASH_SOURCE[2]} = '${BASH_SOURCE[2]}'"
```
```
$ ./outer.sh
$0 = './inner.sh'
$BASH_SOURCE[0] = './inner.sh'
$BASH_SOURCE[1] = ''
$BASH_SOURCE[2] = ''
```

On the other hand:

```
$ cat outer.sh
#!/usr/bin/env bash
source ./middle.sh
```
```
$ cat middle.sh
#!/usr/bin/env bash
source ./inner.sh
```
```
$ cat inner.sh
#!/usr/bin/env bash
echo "\$0 = '$0'"
echo "\${BASH_SOURCE[0]} = '${BASH_SOURCE[0]}'"
echo "\${BASH_SOURCE[1]} = '${BASH_SOURCE[1]}'"
echo "\${BASH_SOURCE[2]} = '${BASH_SOURCE[2]}'"
```
```
$ ./outer.sh
$0 = './outer.sh'
$BASH_SOURCE[0] = './inner.sh'
$BASH_SOURCE[1] = './middle.sh'
$BASH_SOURCE[2] = './outer.sh'
```
