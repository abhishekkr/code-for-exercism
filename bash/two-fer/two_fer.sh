#!/usr/bin/env bash

2fer(){
  local NAME="${1:-you}"
  
  echo "One for ${NAME}, one for me."
}

### the lines commented below let it handle multiple inputs, but not required by tests as of now
#while (( "$#" )); do
  2fer "${1}"
#  shift
#done
