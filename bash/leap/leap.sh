#!/usr/bin/env bash

is_leap(){
  local YEAR="${1}"
  [[ $# -ne 1 || $(echo "${YEAR}" | sed -E 's/^[0-9]+$//g') == "${YEAR}" ]] && echo 'Usage: leap.sh <year>' && return 1
  [[ $(expr $YEAR % 400) -eq 0 ]] && echo true && return
  [[ $(expr $YEAR % 100) -eq 0 ]] && echo false && return
  [[ $(expr $YEAR % 4) -eq 0 ]] && echo true && return
  echo false
}

is_leap $@
