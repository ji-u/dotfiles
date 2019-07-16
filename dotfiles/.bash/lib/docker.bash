#!/usr/bin/env bash
docker::is-container() {
    if [ -f /.dockerenv ]; then
        return 0
    else
        return 1
    fi
}

docker::id() {
    cat /proc/self/cgroup | grep "docker" | sed s/\\//\\n/g | tail -1
}
