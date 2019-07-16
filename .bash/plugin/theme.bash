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

theme::git-status() {
    local clean_char=${1:-'✓'}
    local dirty_char=${2:-'✗'}
    if git::is-repo; then
        if [ "$(git::status)" = "clean" ]; then
            printf "$clean_char"
        else
            printf "$dirty_char"
        fi
    fi
}

theme::git-info() {
    local info=${1:-"|$(git::branch) $(theme::git-status)|"}

    if git::is-repo; then
        printf "$info"
    fi
}
