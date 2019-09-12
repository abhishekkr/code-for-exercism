#!/usr/bin/env bash

resistorColorCode(){
  local color="${1}"
  case "${color}" in
    "black")
      echo 0
      ;;
    "brown")
      echo 1
      ;;
    "red")
      echo 2
      ;;
    "orange")
      echo 3
      ;;
    "yellow")
      echo 4
      ;;
    "green")
      echo 5
      ;;
    "blue")
      echo 6
      ;;
    "violet")
      echo 7
      ;;
    "grey")
      echo 8
      ;;
    "white")
      echo 9
      ;;
  esac
}

resistorColorCodeSum(){
  local code=""
  for name in $@ ; do
    local nextCode=$(resistorColorCode "${name}")
    [[ -z "${nextCode}" ]] && echo "invalid color" && exit 1
    code="${code}${nextCode}"
    [[ ${#code} -eq 2 ]] && break
  done
  echo $code
}

resistorColorCodeSum $@
