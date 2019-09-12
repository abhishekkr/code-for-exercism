#!/usr/bin/env bash

greet(){
  local MSG="$@"

  echo "${MSG}"
}

greet "Hello, World!"
