#!/usr/bin/env bash
#===============================================================================
# @author: Yu Ji
# @email: maple.jiyu@hotmail.com
# @create: July 13, 2019
# @update: July 14, 2019
#-------------------------------------------------------------------------------
import lib/git.bash

# colors

color::black() { printf "\[\e[0;30m\]"; }
color::red()   { printf "\[\e[0;31m\]"; }
color::green() { printf "\[\e[0;32m\]"; }
color::yellow(){ printf "\[\e[0;33m\]"; }
color::blue()  { printf "\[\e[0;34m\]"; }
color::purple(){ printf "\[\e[0;35m\]"; }
color::cyan()  { printf "\[\e[0;36m\]"; }
color::white() { printf "\[\e[0;37m\]"; }
color::orange(){ printf "\[\e[0;91m\]"; }

color::bold::black() { printf "\[\e[30;1m\]"; }
color::bold::red()   { printf "\[\e[31;1m\]"; }
color::bold::green() { printf "\[\e[32;1m\]"; }
color::bold::yellow(){ printf "\[\e[33;1m\]"; }
color::bold::blue()  { printf "\[\e[34;1m\]"; }
color::bold::purple(){ printf "\[\e[35;1m\]"; }
color::bold::cyan()  { printf "\[\e[36;1m\]"; }
color::bold::white() { printf "\[\e[37;1m\]"; }
color::bold::orange(){ printf "\[\e[91;1m\]"; }

color::underline::black() { printf "\[\e[30;4m\]"; }
color::underline::red()   { printf "\[\e[31;4m\]"; }
color::underline::green() { printf "\[\e[32;4m\]"; }
color::underline::yellow(){ printf "\[\e[33;4m\]"; }
color::underline::blue()  { printf "\[\e[34;4m\]"; }
color::underline::purple(){ printf "\[\e[35;4m\]"; }
color::underline::cyan()  { printf "\[\e[36;4m\]"; }
color::underline::white() { printf "\[\e[37;4m\]"; }
color::underline::orange(){ printf "\[\e[91;4m\]"; }

color::normal() { printf "\[\e[0m\]";  }
color::reset()  { printf "\[\e[39m\]"; }

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
