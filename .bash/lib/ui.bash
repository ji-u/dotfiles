#!/usr/bin/env bash

ui::color::available() {
    return [ $(tput colors 2>/dev/null || printf 0) -ge 16 ] && [ -t 1 ]
}

ui::color::default()        { printf \$'\033[0m';    }
ui::color::black()          { printf \$'\033[0;30m'; }
ui::color::red()            { printf \$'\033[0;31m'; }
ui::color::green()          { printf \$'\033[0;32m'; }
ui::color::yellow()         { printf \$'\033[0;33m'; }
ui::color::blue()           { printf \$'\033[0;34m'; }
ui::color::magenta()        { printf \$'\033[0;35m'; }
ui::color::cyan()           { printf \$'\033[0;36m'; }
ui::color::light-cyan()     { printf \$'\033[0;37m'; }

ui::color::dark-grey()      { printf \$'\033[0;90m'; }
ui::color::light-red()      { printf \$'\033[0;91m'; }
ui::color::light-green()    { printf \$'\033[0;92m'; }
ui::color::light-yellow()   { printf \$'\033[0;93m'; }
ui::color::light-blue()     { printf \$'\033[0;94m'; }
ui::color::light-megenta()  { printf \$'\033[0;95m'; }
ui::color::light-cyan()     { printf \$'\033[0;96m'; }
ui::color::white()          { printf \$'\033[0;97m'; }

