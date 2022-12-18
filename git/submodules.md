# Git Submodules

Git submodules are a way to include a project that is stored in git version control within another project that is also
stored in git version control.

## How do Submodules Work?

### Context: The git Object Store

Files managed by git are stored in the `.git/objects` directory. When a new project is created, this directory starts
off empty:

```
objects
├── info
└── pack
```

When a new file is added to git using `git add`, a compressed version of that file is copied to `.git/objects`, with its
hash result as the name:

```
objects
├── 9c
│   └── 0042144fc489d7b528ef186af49e78c2867f91 [43B]
├── info
└── pack
```

In addition to the files managed by git, the `.git/objects` directory also manages commits and the commit tree. After
committing the file above, `.git/objects` would look like this:

```
objects
├── 23
│   └── 262403a0b913d02219ead935dd1a85d3724a0d [139B]
├── 9c
│   └── 0042144fc489d7b528ef186af49e78c2867f91 [43B]
├── f1
│   └── 3a8c8331c76ac965c43b09d11ee2d72bb053c1 [55B]
├── info
└── pack
```

### Adding a Submodule

Adding a git submodule is done using the following command:

```
git submodule add [git project path or URL] [submodule name]
```

This command has the following effects:
1. Clone the project at the path to a directory with the given name
2. Creates the file `.gitmodules` (if it does not exist yet) to record the above-defined relationship
3. Records the commit for the submodule in the directory listing

### git Directory Listing

Unlike "tree objects" which record the file structure of a git project or "blob objects" which record the contents,
submodules are recorded as a special commit object. This can be confirmed after committing a submodule by checking the
directory structure of `.git/objects`:

```
objects
├── 00
│   └── b54ece7789a75ca80a0edb1e1b1e532a1833d8 [64B]
├── 23
│   └── 262403a0b913d02219ead935dd1a85d3724a0d [139B]
├── 9c
│   └── 0042144fc489d7b528ef186af49e78c2867f91 [43B]
├── f1
│   └── 3a8c8331c76ac965c43b09d11ee2d72bb053c1 [55B]
├── info
└── pack
```

and the directory listing (using `git ls-tree master`):

```
100644 blob 00b54ece7789a75ca80a0edb1e1b1e532a1833d8    .gitmodules
100644 blob 9c0042144fc489d7b528ef186af49e78c2867f91    README.txt
160000 commit 196bbbb2b7497fdc868fa61425959d23ff1c0fe5  submodule
```

### Updating a Submodule

Since git is tracking the contents of the submodule, not the contents, the submodule is updated by navigating into the
root directory of the submodule and updating the contents using git (e.g. `git pull`, `git rebase`, etc.). Once done,
returning to the root directory of the parent project and running `git add [submodule name]` will record the update to
the git state. After committing the changes, re-running `git ls-tree master` will show that the commit hash for the
submodule has changed:

```
100644 blob 00b54ece7789a75ca80a0edb1e1b1e532a1833d8    .gitmodules
100644 blob 9c0042144fc489d7b528ef186af49e78c2867f91    README.txt
160000 commit 43c26bf6df6a4efade8082f3a5473b807d07c161  submodule
```
