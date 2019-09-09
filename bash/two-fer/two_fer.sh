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

2fer(){
  local NAME="$@"
  [[ -z "${NAME}" ]] && NAME="you"
  
  echo "One for ${NAME}, one for me." >> /tmp/abc
  echo "One for ${NAME}, one for me."
}

[[ $# -eq 0 ]] && 2fer && exit 0
### the lines commented below let it handle multiple inputs, but not required by tests as of now
#while (( "$#" )); do
  2fer $1
#  shift
#done
