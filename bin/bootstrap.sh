#!/usr/bin/env bash
set -eu

resolve_link() {
  local the_link=$1
  local ls_res=
  local link_target=
  while [ -h "$the_link" ] ; do
    ls_res="$(ls -ld "$the_link")"
    link_target=$(expr "$ls_res" : '.*-> \(.*\)$')
    if [[ "$link_target" =~ ^/ ]] ; then
      the_link="$link_target"
    else
      the_link="$(dirname "$the_link")/$link_target"
    fi
  done
  printf '%s' "$the_link"
}

this_file="${BASH_SOURCE[0]}"
if ! [ -e "$this_file" ] ; then
  this_file="$(type -p "$this_file")"
fi
if ! [ -e "$this_file" ] ; then
  echo "Failed to resolve file."
  exit 1
fi
if ! [[ "$this_file" =~ ^/ ]] ; then
  this_file="$(pwd)/$this_file"
fi
this_file="$(resolve_link "$this_file")"
this_dir="$(dirname "$this_file")"

proj_root="${this_dir}/.."
cmake -S . -DOpenCV_DIR="${proj_root}/../opencv/build" -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -B build
