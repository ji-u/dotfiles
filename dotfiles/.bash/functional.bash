#!/usr/bin/env bash
#==============================================================================
# @author: Yu Ji
# @create: July 15, 2019
#==============================================================================
# import functionality
alias import=functional::import
unset __v__imported_files
declare -g __v__sys_path="$(eval printf ~)/.bash"
declare -ag __v__imported_files
functional::import() {
    local path
    for path in "$@"; do
        functional::_import "$path"
    done
}
functional::_import() {
    local path=$1
    shift
    functional::_import_local "$path" "$@" || \
    functional::_import_sys "$path" "$@"
}
functional::_import_local() {
    local path=$1
    shift
    local local_path="$( cd "${BASH_SOURCE[1]%/*}" && pwd )"
    functional::source "${local_path}/${path}" "$@"
}
functional::_import_sys() {
    local path=$1
    shift
    functional::source "${__v__sys_path}/${path}" "$@"
}
functional::source() {
    local path="$1"
    shift
    if [ -d "$path" ]; then
        local file
        for file in "$path"/*.bash; do
            functional::_source "$file" "$@"
        done
    else
        functional::_source "$path" "$@"
    fi
}
functional::_source() {
    local path=$1
    shift
    path="$(os::path::abspath "$path")"
    if functional::contains "$path" "${__v__imported_files[@]}"; then
        return 0
    fi
    __v__imported_files+=( "$path" )
    builtin source "$path" "$@" || functional::throw "Unable to load $path"
}
os::path::abspath() {
    local path="$1"
    printf "$(realpath "$path")"
}
functional::contains() {
    local element
    for element in "${@:2}"; do
        [[ "$element" == "$1" ]] && return 0
    done
    return 1
}
functional::throw() {
    eval 'cat <<< "Exception: $e ($*)" 1>&2; read -s;'
}

# clean global namespace
alias clean=functional::clean
functional::clean() {
    local line
    compgen -A function | grep '::' | while read -r line; do
        unset -f "$line"
    done
    compgen -A variable | grep '^__v__' | while read -r line; do
        unset "$line"
    done
    unalias import
    unalias clean
}

