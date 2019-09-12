#!/usr/bin/env bash

## can be simply `echo $@ | rev`

reverse(){
  local txt="$@"
  local txt_length=${#txt}
  local xtx=""
  for ((idx=0 ; idx < $txt_length ; idx++))
  do
    xtx="${txt:$idx:1}${xtx}"
  done
  echo "${xtx}"
}

reverse $@
