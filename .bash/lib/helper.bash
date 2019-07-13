#!/usr/bin/env bash
#===============================================================================
# @author: Yu Ji
# @email: maple.jiyu@hotmail.com
# @create: July 14, 2019
# @update: July 14, 2019
#-------------------------------------------------------------------------------

# Helper functions
#-------------------------------------------------------------------------------
# add sudo if required
function _require_sudo() {
  if [[ $EUID -ne 0 ]]; then
    echo sudo $@ 
  else
    echo $@ 
  fi
}

