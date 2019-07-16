#!/usr/bin/env bash

shopt -s histappend
export HISTCONTROL=${HISTCONTROL:-ignorespace:erasedups}
export HISTSIZE=${HISTSIZE:-5000}
