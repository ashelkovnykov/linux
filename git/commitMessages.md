# Git Commit Messages

This document is a guide for writing good git commit messages.

## Purpose of a Git Commit Message

A git commit message is meant to communicate context about changes to fellow developers. A diff tells developers _what_
changed, but a commit message tells developers _why_ it changed.

A well-cared-for commit log allows developers to maximize the efficiency of commands such as `blame`, `revert`, and
`log`. It becomes easy to understand why changes were made months or even years ago.

## Seven Rules of a Good Commit

1. Separate subject from body with a blank line
2. Limit the subject to 50 characters
3. Capitalize the subject line
4. Do not end the subject line with a period
5. Use the imperative mood in the subject line
6. Wrap the body at 72 characters
7. Use the body to explain what and why, not how

### Separate Subject From Body With a Blank Line

If the subject line and body of a commit run together, certain git commands can become confused.

### Limit The Subject to 50 Characters

50 characters keeps the length of the subject readable and forces the author to summarize his changes in the most
concise way.

### Capitalize The Subject Line

It just looks better and is closer to proper English grammar.

### Do Not End The Subject Line With a Period

Trailing punctuation is unnecessary for a subject line. In addition, with a 50-character limit, each character is
precious.

### Use The Imperative Mood in The Subject Line

The imperative mood is "spoken or written as if giving a command". Each of the seven rules is written in the imperative
mood. Every git commit message should produce a valid sentence when inserted into this template:
```
If applied, this commit will _________
```

### Wrap The Body at 72 Characters

72 characters is recommended so that git can indent the text while avoiding the industry standard 80-character wrap.

### Use The Body to Explain What and Why, Not How

Code is generally self-explanatory regarding how changes were made. The body of the commit message should instead
explain why the changes were made at all: the way the code worked before the change, the way it works after the change,
the other solutions available, and why was this solution chosen.

## Additional Commit Tips

* Bullet points are a common method for summarizing changes in the body
    * Typically, they start with a space, followed by a `*` or `-`, and then another space
    * However, conventions may vary (the most important element is consistency)
* If you use issue trackers, put references at the bottom of the body

## Example Projects with Good Commit Messages

* [The Linux kernel](https://github.com/torvalds/linux/commits/master)
* [Git itself](https://github.com/git/git/commits/master)
