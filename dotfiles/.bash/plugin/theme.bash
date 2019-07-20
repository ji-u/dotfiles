#!/usr/bin/env bash
#===============================================================================
# @author: Yu Ji
# @email: maple.jiyu@hotmail.com
# @create: July 13, 2019
# @update: July 20, 2019
#-------------------------------------------------------------------------------
import lib/git.bash
import lib/docker.bash
import lib/ui.bash
import lib/conda.bash

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

theme::docker-info() {
    local info=${1:-"(λ $(docker::id))"}
	if docker::is-container; then
		printf "$info"
	fi
}

theme::conda-info() {
    local info=${1:-"($(conda::env-name))"}
    if conda::is-env; then
        printf "$info"
    fi
}
