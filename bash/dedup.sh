#!/bin/bash
# ======================================================================================================================
#
# dedup - Removes duplicate lines from a text file
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

  echo -e "Usages:\tdedup <input file>"
  echo -e "\tdedup -h"
  exit $1
}

#
# Main execution function.
#
# `seen` is an associative-array to which `awk` will pass every line of the file as a String. If this is the first time
# that a line has been seen (meaning that it is not present in the array), `seen[$0]` will evaluate to `0`. The post-fix
# `++` operator will `seen[$0]`, thus maintaining a count of the number of times that this line has been seen, and
# return the previous value. The `!` (Logical Not) operator will treat the value of `seen[$0]` as a Boolean, and invert
# it. Thus, the first time that a line is seen, the expression `!seen[$0]++` will evaluate to `true`, but each time
# thereafter it will evaluate to `false`. The `awk` command prints only those lines for which the argument expression
# evaluates to `true`.
#
main() {
  awk '!seen[$0]++' $1
}

#-----------------------------------------------------------
# BEGIN
#-----------------------------------------------------------

if [[ $# -gt 1 ]]; then
  echo "dedup: Too many arguments"
  usage 1
elif [[ $# -eq 0 ]]; then
  echo "dedup: Missing input file"
  usage 1
elif [[ $1 == "-h" ]]; then
  usage 0
fi

main $1

#-----------------------------------------------------------
# END
#-----------------------------------------------------------
