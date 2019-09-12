#!/usr/bin/env bash

2fer(){
  local NAME="${1:-you}"
  
  echo "One for ${NAME}, one for me."
}

[[ $# -eq 0 ]] && 2fer && exit 0
### the lines commented below let it handle multiple inputs, but not required by tests as of now
#while (( "$#" )); do
  2fer "${1}"
#  shift
#done
