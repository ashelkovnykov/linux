# Git Tips

## Checking Out Pull Requests Locally

To check out a pull request locally, run the following command:
```
git fetch [remote] pull/[ID]/head:[branch]
```

For example, to check out [this](https://github.com/ashelkovnykov/offline-wallet-generator/pull/3) request to a local
fork in a branch named "pullr", the command would be:
```
git fetch origin pull/3/head:pullr
```

## Pushing to Multiple Remotes

By adding a second URL to `origin` in `.git/config`, git will push to both URLs.

```
[remote "origin"]
    url = git@github.com:[user]/[project].git
    url = ssh://[your own server]:/[path]/[to]/[project].git
    fetch = +refs/heads/*:refs/remotes/origin/*
```

Note: git will only pull from the first URL.

## Generating Patches

The git command to generate a patch is `git format-patch`. The most useful options for it are:
```
--stdout              print patches to standard out
-o, --output-directory <dir>
                      store resulting files in <dir>
```

### Usage

```
git format-patch [branch OR revision]
```

By default, `git format-patch` will output one patch for every commit on the path between the current branch and the
input branch/revision to the current directory. Adding the `-o` option allows the user to specify a new or different
directory to which the patches should be output. Other options can also be used to control the naming convention for the
produced patch files. To squash all changes into a single patch, the following command is recommended:

```
git format-patch [branch or revision] --stdout > [patch file] 
```

## Applying Patches

The git command to apply a patch to the current branch is `git apply`. The most useful options for it are:
```
--no-add              ignore additions made by the patch
--stat                instead of applying the patch, output diffstat for the input
--summary             instead of applying the patch, output a summary for the input
--check               instead of applying the patch, see if the patch is applicable
--apply               also apply the patch (use with --stat/--summary/--check)
-3, --3way            attempt three-way merge if a patch does not apply
--ignore-whitespace   ignore changes in whitespace when finding context
```

### Usage

```
git apply [patch file]
```
