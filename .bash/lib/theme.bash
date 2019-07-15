#!/usr/bin/env bash
#===============================================================================
# @author: Yu Ji
# @email: maple.jiyu@hotmail.com
# @create: July 13, 2019
# @update: July 14, 2019
#-------------------------------------------------------------------------------
import lib/git.bash
import lib/ui.bash

# theme
theme::prompt_command() {
  local prompt_re="\<${1}\>"

  if [[ ${PROMPT_COMMAND} =~ ${prompt_re} ]]; then
    return
  elif [[ -z ${PROMPT_COMMAND} ]]; then
    PROMPT_COMMAND="${1}"
  else
    PROMPT_COMMAND="${1};${PROMPT_COMMAND}"
  fi
}

theme::git-info() {
    local prefix=${1:-'|'}
    local suffix=${2:-'|'}
    local clean_char=${3:-'✓'}
    local dirty_char=${4:-'✗'}

    if git::is-repo; then
        local status_char
        if [ "$(git::status)" = "clean" ]; then
            status_char="$clean_char"
        else
            status_char="$dirty_char"
        fi
        printf "${prefix}$(git::ref)${status_char}${suffix}"
    fi
}
