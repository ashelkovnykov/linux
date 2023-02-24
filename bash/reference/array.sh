#!/bin/bash
# ==============================================================================
# array
#
#   Reference for using arrays in bash.
#
# ==============================================================================

# ==========================================================
# CONSTANTS
# ==========================================================

# define array
ARRAY=(
    1
    2
    3
)

# another way to define array
declare -a LIST=(
    "A"
    "B"
    "C"
)

# ==========================================================
# MAIN
# ==========================================================

# print length of array
echo "${#ARRAY[@]}"

# iterate over every element in array
for x in ARRAY; do
    echo "$x"
done

# iterate over every element in array (with index)
for i in ${!ARRAY[@]}; do
    echo "$i: ${ARRAY[$i]}"
done
