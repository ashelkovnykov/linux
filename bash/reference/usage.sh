#!/bin/bash
# ==============================================================================
# usage
#
#   Reference for bash script usage functions.
#
# ==============================================================================

# ==========================================================
# FUNCTIONS
# ==========================================================

usage_a() {
    echo 'This is one way to show usage' >&2
    echo $'\tif you need tabs, add a \'$\' before the string' >&2
    echo -e "\t\talternate way to get escaped characters" >&2
}

usage_b() {
    cat >&2 <<EOF
This is another way to show usage.

    Note
        that
            it
        preserves
    spacing.
EOF
}

usage_c() {
    cat >&2 <<EOF
Usage text norms:
    - Text without brackets or braces
        mandatory; must be typed as shown
    - <Text inside angle brackets>
        placeholder for mandatory value; must be replaced by user input
    - {Text inside braces}
        set of required items; exactly one of the items must be selected
    - [Text inside square brackets]
        optional item; may or may not be included
    - | in {} or []
        separator between exclusive items
    - ...
        items can be repeated
    - [options] is usually a special case; it's implied that all of the options
      are optional, and they're summarized in a separate section at the bottom
      of the usage text

    script [options] <singular arg> {a|b|c|<singular arg>} [<repeated arg> ...] start

    script which takes a mandatory argument followed by either a, b, c, or a
    second user-supplied argument, an optional list of one or more user-supplied
    arguments, and the exact argument "start". All of these arguments may be
    preceded by one or more options.

    options:
        -a, --all           Regular option; note that it has a long-form and short-form name
        -b, --both {a|b}    Option must be followed by an argument; in this case, a or b
        -c, --custom <arg>  Option must be followed by a user-supplied argument
EOF
}

# ==========================================================
# MAIN
# ==========================================================

usage_a
usage_b
usage_c
