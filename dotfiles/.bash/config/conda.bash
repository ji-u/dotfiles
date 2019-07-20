#!/usr/bin/env bash

# test if conda command exists
_find_conda() {
    if ! type conda &>/dev/null; then
        local path
        for path in "" "/usr/local"; do
            if [ -f "${path}/anaconda3/bin/conda" ]; then
                path="${path}/anaconda3"
                break
            elif [ -f "${path}/anaconda2/bin/conda" ]; then
                path="${path}/anaconda2"
                break
            elif [ -f "${path}/anaconda/bin/conda" ]; then
                path="${path}/anaconda"
                break
            else
                return
            fi
        done
        if [ -f "${path}/etc/profile.d/conda.sh" ]; then
            source "${path}/etc/profile.d/conda.sh"
        fi
    fi
}
_find_conda
unset -f _find_conda
