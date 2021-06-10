#!/bin/bash
# ======================================================================================================================
#
# prepend - Prepends input text to the beginning of an input file in-place.
#
# ======================================================================================================================

#-----------------------------------------------------------
# Functions
#-----------------------------------------------------------

#
# Print script usage
#
usage() {
  if [[ $1 -ne 0 ]]; then
    # Add newline between error message and usage
    echo ""
  fi

  echo -e "Usages:\tprepend <text> <file>"
  echo -e "\tprepend -h"
  exit $1
}

#
# Main execution function.
#
# The input to the `sed` command means the following: `-i` means perform any changes in-place; `.old` tells `sed` to
# save a backup of the input file (before making changes) with the extension ".old" added to the end; `;` is a delimiter
# between inputs; the first field in the string `s;^;$1;` is the command (in this case `s`, meaning "substitution"); the
# second field in the string `s;^;$1;` is the text to replace (in this case `^`, meaning the start of file); the third
# field in the string `s;^;$1;` is the new text (in this case `$1`, the first argument); `$2` is the file on which to
# perform the command, given by the second argument.
#
main() {
  sed -i.old "s;^;$1;" $2
}

#-----------------------------------------------------------
# BEGIN
#-----------------------------------------------------------

if [[ $1 == "-h" ]]; then
  usage 0
fi

if [[ $# -gt 2 ]]; then
  echo "prepend: Too many arguments"
  usage 1
elif [[ $# -lt 2 ]]; then
  echo "dedup: Missing input(s)"
  usage 1
fi

main "$@"

#-----------------------------------------------------------
# END
#-----------------------------------------------------------
