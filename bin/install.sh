#!/usr/bin/env bash

set -e pipefail

function main() {
    script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
    cwd=$(pwd)
    cd $script_dir
    rc_repo_dir=$(git rev-parse --show-toplevel 2>/dev/null)
    cd ${cwd}
    echo "Installing rc repository from ${rc_repo_dir}"

    user_rc_dir=${HOME}/.zsh
    mkdir -pv ${user_rc_dir}
    ln -sfv ${rc_repo_dir}/shell_aliases ${user_rc_dir}/shell_aliases
}

main "$@"
