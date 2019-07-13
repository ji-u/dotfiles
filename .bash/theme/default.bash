#!/usr/bin/env bash

function prompt_command() {
  PS1="\
${purple}\u${reset_color} \
at ${cyan}\h${reset_color} \
in ${green}\w${reset_color} \
${green}→${reset_color} "
}

safe_append_prompt_command prompt_command
