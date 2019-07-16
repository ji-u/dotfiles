#!/usr/bin/env bash
import lib/ui.bash
import plugin/theme.bash

prompt_command() {
  local git_info="$(theme::git-info "\
|\
$(ui::color::yellow)$(git::branch)$(ui::color::default)\
$(theme::git-status "$(ui::color::green)$(ui::powerline::ok)" "$(ui::color::red)$(ui::powerline::fail)")$(ui::color::default)\
|")"

  PS1="\
$(ui::color::purple)\u$(ui::color::default)\
 at $(ui::color::cyan)\h$(ui::color::default)\
 in $(ui::color::green)\w$(ui::color::default)\
\n\
${git_info}\
$(ui::color::green)$(ui::powerline::pointing-arrow)$(ui::color::default) "
}

theme::prompt_command prompt_command
