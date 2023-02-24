#!/bin/bash
# ==============================================================================
# macros
#
#   Reference for predefined bash macros, available to all scripts.
#
# ==============================================================================

# ==========================================================
# MAIN
# ==========================================================

# Exit when any command fails
set -e

# Keep track of the last executed command
trap 'LAST_COMMAND=$current_command; current_command=$BASH_COMMAND' DEBUG
# Echo an error message before exiting
trap 'echo "ERROR: \"$LAST_COMMAND\" failed with exit code $?."' EXIT

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
