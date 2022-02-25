#!/bin/bash
# ======================================================================================================================
#
# general  - Example script demonstrating common and useful bash commands.
#
# ======================================================================================================================

#-----------------------------------------------------------
# Functions
#-----------------------------------------------------------

#
# Main execution function.
#
main() {
  # Exit when any command fails
  set -e

  # Keep track of the last executed command
  trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
  # Echo an error message before exiting
  trap 'echo "ERROR: \"${last_command}\" failed with exit code $?."' EXIT

  # Print number of input parameters
  echo $#
  # Print all input parameters
  echo $@
  # Print process ID
  echo $$
  # Print username of user running the script
  echo $USER
  # Print hostname of the machine running the script
  echo $HOSTNAME
  # Print number of seconds elapsed since the script began
  echo $SECONDS
  # Print a random integer
  echo $RANDOM
  # Print the line number of the current command
  echo $LINENO
  # Print the exit status of the most recently executed command
  echo $?

  # Shift input parameters "left"
  shift 1

  # Dummy command to purposely cause error
  cat /tmp/i-dont-exist.txt

  # Exit with the given code (0 means no error)
  exit 0
}

#-----------------------------------------------------------
# BEGIN
#-----------------------------------------------------------

main $@

#-----------------------------------------------------------
# END
#-----------------------------------------------------------
