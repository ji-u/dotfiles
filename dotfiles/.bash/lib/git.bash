#!/usr/bin/env bash

git::branch() {
    git symbolic-ref -q --short HEAD 2> /dev/null || return 1
}

git::tag() {
    git describe --tags --exact-match 2> /dev/null
}

git::commit-description() {
    git describe --contains --all 2> /dev/null
}

git::short-sha() {
    git rev-parse --short HEAD
}

git::ref() {
    git::branch || git::tag || git::commit-description || git::short-sha
}

git::status() {
    local git_status='clean'
    if [[ -n "$(git status --porcelain 2> /dev/null | tail -n1)" ]]; then
        git_status='dirty'
    fi
    printf "$git_status"
}

git::is-repo() {
    if [[ -f .git/HEAD ]] && which git &> /dev/null; then
        return 0
    elif which git &> /dev/null && [[ -n "$(git rev-parse --is-inside-work-tree 2> /dev/null)" ]]; then
        return 0
    fi
    return 1
}
