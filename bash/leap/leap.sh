#!/usr/bin/env bash

# The following comments should help you get started:
# - Bash is flexible. You may use functions or write a "raw" script.
#
# - Complex code can be made easier to read by breaking it up
#   into functions, however this is sometimes overkill in bash.
#
# - You can find links about good style and other resources
#   for Bash in './README.md'. It came with this exercise.
#
#   Example:
#   # other functions here
#   # ...
#   # ...
#
#   main () {
#     # your main function code here
#   }
#
#   # call main with all of the positional arguments
#   main "$@"
#
# *** PLEASE REMOVE THESE COMMENTS BEFORE SUBMITTING YOUR SOLUTION ***

is_leap(){
  local YEAR=$1
  [[ $# -ne 1 || $(echo "${YEAR}" | sed -E 's/^[0-9]+$//g') == "${YEAR}" ]] && echo 'Usage: leap.sh <year>' && return 1
  [[ $(expr $YEAR % 400) -eq 0 ]] && echo true && return
  [[ $(expr $YEAR % 100) -eq 0 ]] && echo false && return
  [[ $(expr $YEAR % 4) -eq 0 ]] && echo true && return
  echo false
}

is_leap $@
