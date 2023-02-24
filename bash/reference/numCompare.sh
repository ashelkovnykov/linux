#!/bin/bash
# ==============================================================================
# numCompare
#
#   Reference for comparing integers in bash.
#
# ==============================================================================

# ==========================================================
# MAIN
# ==========================================================

if [[ $# -gt 2 ]]; then
    echo "numCompare: Too many arguments"
    usage 1
elif [[ $# -lt 2 ]]; then
    if [[ $# -eq 1 && $1 == "-h" ]]; then
        usage 0
    else
        echo "numCompare: Missing input(s)"
        usage 1
    fi
fi

if [[ $1 -eq $2 ]]; then
    echo "$1 is equal to $2"
fi

if [[ $1 -ne $2 ]]; then
    echo "$1 is not equal to $2"
fi

if [[ $1 -gt $2 ]]; then
    echo "$1 is greater than $2"
fi

if [[ $1 -lt $2 ]]; then
    echo "$1 is less than $2"
fi

if [[ $1 -ge $2 ]]; then
    echo "$1 is greater than or equal to $2"
fi

if [[ $1 -le $2 ]]; then
    echo "$1 is less than or equal to $2"
fi

if [ $1 -le $2 ] && [ $1 -ge $2 ]; then
    echo "$1 is equal to $2"
fi

if [ $1 -lt $2 ] || [ $1 -gt $2 ]; then
    echo "$1 is not equal to $2"
fi
