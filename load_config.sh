#!/usr/bin/env bash

IFS="="
while read -r name value
do
actual=${value//\"/}

if [ ! -z "$name" ]; then 
  if [[ ! ${name:0:1} == '#' ]]; then 
    # echo "Setting  $name to $actual "
    #Load config files into environment variables
    export "${name}=${value}"
  fi
fi
done < conf

