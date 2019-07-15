#!/usr/bin/env bash
import lib/theme.bash

prompt_command() {
  PS1="\
$(color::purple)\u$(color::reset)\
 at $(color::cyan)\h$(color::reset)\
 in $(color::green)\w$(color::reset)\
\n\
$(theme::git-info "|$(color::yellow)" "$(color::reset)|" "$(color::green)✓" "$(color::red)✗")\
$(color::green)→$(color::reset) "
}

theme::prompt_command prompt_command
