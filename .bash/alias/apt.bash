#!/bin/bash

# Apt alias for ubuntu and debian
if [ -x $(which apt) ]; then
  alias aptsearch='apt-cache search'
  alias aptinstall="$(_require_sudo apt-get install -V)"
  alias aptupdate="$(_require_sudo apt-get update)"
  alias aptupgrade="$(_require_sudo apt-get update) && $(_require_sudo apt-get autoremove)"
  alias aptrm="$(_require_sudo apt-get remove)"
  alias aptpurge="$(_require_sudo apt-get remove --purge)"
fi
