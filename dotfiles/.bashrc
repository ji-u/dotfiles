#!/usr/bin/env bash
#===============================================================================
# @author: Yu Ji
# @email: maple.jiyu@hotmail.com
# @create: July 13, 2019
# @update: July 14, 2019
#-------------------------------------------------------------------------------

# Basic config
#-------------------------------------------------------------------------------
# If not running interactively, don't do anything
BASH_THEME=default

# basic functionality
source "$(cd "$(dirname "${BASH_SOURCE[0]}")">/dev/null 2>&1 && pwd)/.bash/functional.bash"
import config
import alias
import plugin
import theme/"$BASH_THEME".bash
