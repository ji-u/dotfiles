#!/usr/bin/env bash

export TERM=xterm-256color

ui::color::available() {
    if [ $(tput colors 2>/dev/null || printf 0) -ge 16 ] && [ -t 1 ]; then
        return 1
    else
        return 0
    fi
}

ui::_color() {
    if ui::color::available; then
        echo "$1"
    fi
}
ui::color::default()        { ui::_color "\[\e[0m\]";    }
ui::color::black()          { ui::_color "\[\e[0;30m\]"; }
ui::color::red()            { ui::_color "\[\e[0;31m\]"; }
ui::color::green()          { ui::_color "\[\e[0;32m\]"; }
ui::color::yellow()         { ui::_color "\[\e[0;33m\]"; }
ui::color::blue()           { ui::_color "\[\e[0;34m\]"; }
ui::color::purple()         { ui::_color "\[\e[0;35m\]"; }
ui::color::cyan()           { ui::_color "\[\e[0;36m\]"; }
ui::color::light-cyan()     { ui::_color "\[\e[0;37m\]"; }

ui::color::dark-grey()      { ui::_color "\[\e[0;90m\]"; }
ui::color::light-red()      { ui::_color "\[\e[0;91m\]"; }
ui::color::light-green()    { ui::_color "\[\e[0;92m\]"; }
ui::color::light-yellow()   { ui::_color "\[\e[0;93m\]"; }
ui::color::light-blue()     { ui::_color "\[\e[0;94m\]"; }
ui::color::light-purple()   { ui::_color "\[\e[0;95m\]"; }
ui::color::light-cyan()     { ui::_color "\[\e[0;96m\]"; }
ui::color::white()          { ui::_color "\[\e[0;97m\]"; }

ui::font::bold()            { ui::_color "\[\e[1m\]"; }
ui::font::dim()             { ui::_color "\[\e[2m\]"; }
ui::font::italics()         { ui::_color "\[\e[3m\]"; }
ui::font::underline()       { ui::_color "\[\e[4m\]"; }
ui::font::blink()           { ui::_color "\[\e[5m\]"; }
ui::font::invert()          { ui::_color "\[\e[7m\]"; }
ui::font::invisible()       { ui::_color "\[\e[8m\]"; }

ui::font::no-bold()         { ui::_color "\[\e[21m\]"; }
ui::font::no-dim()          { ui::_color "\[\e[22m\]"; }
ui::font::no-italics()      { ui::_color "\[\e[23m\]"; }
ui::font::no-underline()    { ui::_color "\[\e[24m\]"; }
ui::font::no-blink()        { ui::_color "\[\e[25m\]"; }
ui::font::no-invert()       { ui::_color "\[\e[27m\]"; }
ui::font::no-invisible()    { ui::_color "\[\e[28m\]"; }

ui::powerline::available()  {
    if ui::color::available && test -z \${NO_UNICODE-} && (echo -e $'\u1F3B7' | grep -v F3B7) &> /dev/null; then
        return 1
    else
        return 0
    fi
}

ui::_powerline() {
    if ui::powerline::available; then
        echo -en "$1"
    else
        echo "$2"
    fi
}

ui::powerline::pointing-arrow()     { ui::_powerline "\u27a1"  "~";      }
ui::powerline::arrow-left()         { ui::_powerline "\ue0b2"  "<";      }
ui::powerline::arrow-right()        { ui::_powerline "\ue0b0"  ">";      }
ui::powerline::arrow-right-down()   { ui::_powerline "\u2198"  ">";      }
ui::powerline::arrow-down()         { ui::_powerline "\u2B07"  "_";      }
ui::powerline::plus-minus()         { ui::_powerline "\ue00b1" "+-";     }
ui::powerline::branch()             { ui::_powerline "\ue0a0"  "|}";     }
ui::powerline::refers-to()          { ui::_powerline "\u27a6"  "*";      }
ui::powerline::ok()                 { ui::_powerline "\u2714"  "+";      }
ui::powerline::fail()               { ui::_powerline "\u2718"  "x";      }
ui::powerline::lightning()          { ui::_powerline "\u26a1"  "!";      }
ui::powerline::cog()                { ui::_powerline "\u2699"  "{*}";    }
ui::powerline::heart()              { ui::_powerline "\u2764"  "<3";     }
ui::powerline::star()               { ui::_powerline "\u2b50"  "*";      }
ui::powerline::saxophone()          { ui::_powerline "\U1F3B7" "(YEAH)"; }
ui::powerline::thumbs-up()          { ui::_powerline "\U1F44D" "(OK)";   }

