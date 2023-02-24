#!/bin/bash
# ==============================================================================
# strCompare
#
#   Reference for comparing strings in bash.
#
# ==============================================================================

# ==========================================================
# VARIABLES
# ==========================================================

REGEX=0

# ==========================================================
# FUNCTIONS
# ==========================================================

# Print script usage
usage() {
  if [[ $1 -ne 0 ]]; then
    # Add newline between error message and usage
    echo ""
  fi

  echo -e "Usages:\tstrCompare [-r] <string1> <string2>"
  echo -e "\tstrCompare -h"
  echo ""
  echo "Commands:"
  echo -e " -h:\tDisplay usage info"
  echo -e " -r:\tCheck if string1 matches the regex expression in string2"
  echo ""

  exit $1
}

# Check if the string in $1 matches the regex in $2
regex() {
  if [[ $1 =~ $2 ]]; then
    echo "\"$1\" matches regex \"$2\""
  else
    echo "\"$1\" does not match regex \"$2\""
  fi
}

# Compare two strings to each other
compare() {
  if [[ $1 == $2 ]]; then
    echo "\"$1\" and \"$2\" are identical"
  fi

  if [[ $1 != $2 ]]; then
    echo "\"$1\" and \"$2\" are not identical"
  fi

  if [[ $1 > $2 ]]; then
    echo "\"$1\" comes after \"$2\" (lexicographically)"
  fi

  if [[ $1 < $2 ]]; then
    echo "\"$1\" comes before \"$2\" (lexicographically)"
  fi

  if [[ -z $1 ]]; then
    echo "\"$1\" has length 0"
  fi

  if [[ -n $1 ]]; then
    echo "\"$1\" has non-zero length"
  fi
}

# Main execution function.
main() {
  if [[ $REGEX -ne 0 ]]; then
    regex $1 $2
  else
    compare $1 $2
  fi
}

# ==========================================================
# MAIN
# ==========================================================

if [[ $1 == "-h" ]]; then
  usage 0
elif [[ $1 == "-r" ]]; then
  REGEX=1
  shift 1
fi

if [[ $# -gt 2 ]]; then
  echo "strCompare: Too many arguments"
  usage 1
elif [[ $# -lt 2 ]]; then
  echo "strCompare: Missing input(s)"
  usage 1
fi

main $1 $2
