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
case $- in
  *i*) ;;
   *) return;;
esac

# Path to the bash configurations
HOME_DIR=~
eval HOME_DIR=$HOME_DIR
export BASH_CONF="${HOME_DIR}/.bash"
export BASH_THEME="default"

# uncheck mail when opening terminal
unset MAILCHECK

# install libs
source "${BASH_CONF}/lib/helper.bash"
source "${BASH_CONF}/lib/history.bash"

# install alias, plugins
for _file_type in "alias" "plugin" "completion"; do
  for _alias_file in $(sort <(compgen -G "${BASH_CONF}/${_file_type}/*.bash")); do
    if [ -e "$_alias_file" ]; then
      source "$_alias_file"
    fi
  done
done
unset _file_type
unset _alias_file

# load theme
if [[ ! -z "${BASH_THEME}" ]]; then
  source "${BASH_CONF}/lib/color.bash"
  source "${BASH_CONF}/lib/theme.bash"
  export LSCOLORS='Gxfxcxdxdxegedabagacad'
  source "${BASH_CONF}/theme/${BASH_THEME}.bash"
fi

