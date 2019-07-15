#!/usr/bin/env bash
import lib/theme.bash
import lib/ui.bash

prompt_command() {
  PS1="\
$(ui::color::purple)\u$(ui::color::default)\
 at $(ui::color::cyan)\h$(ui::color::default)\
 in $(ui::color::green)\w$(ui::color::default)\
\n\
$(theme::git-info "|$(ui::color::yellow)" "$(ui::color::default)|" "$(ui::color::green)✓" "$(ui::color::red)✗")\
$(ui::color::green)→$(ui::color::default) "
}

theme::prompt_command prompt_command
