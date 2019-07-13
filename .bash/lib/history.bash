#!/usr/bin/env bash
#===============================================================================
# @author: Yu Ji
# @email: maple.jiyu@hotmail.com
# @create: July 14, 2019
# @update: July 14, 2019

# Bash history handling
#-------------------------------------------------------------------------------
# append to bash_history if terminal quits
shopt -s histappend

# erase duplicates
export HISTCONTROL=${HISTCONTROL:-ignorespace:erasedups}

# set history size
export HISTSIZE=${HISTSIZE:-5000}

