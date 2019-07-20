#!/usr/bin/env bash

conda::env-name() {
    printf "$CONDA_DEFAULT_ENV"
}

conda::is-env() {
    if [ ! -z ${CONDA_SHLVL+x} ] && [ "${CONDA_SHLVL}" -gt "0" ]; then
        return 0
    else
        return 1
    fi
}
