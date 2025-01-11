#!/usr/bin/env bash

set -e pipefail

function main() {
    script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
    cwd=$(pwd)
    cd $script_dir
    rc_repo_dir=$(git rev-parse --show-toplevel 2>/dev/null)
    cd ${cwd}
    echo "Installing rc repository from ${rc_repo_dir}"

    if [ $(uname -s) == "Linux" ]; then
	user_rc_dir=${HOME}/.config
    elif [ $(uname -s) == "Darwin" ]; then
	user_rc_dir=${HOME}/.zsh
    else
	echo "Error: uname -s is neither Linux or Darwin - undefined behavior"
	exit 1
    fi
    mkdir -pv ${user_rc_dir}
    ln -sfv ${rc_repo_dir}/shell_aliases ${user_rc_dir}/shell_aliases
    ln -sfv ${rc_repo_dir}/tmux.conf ${HOME}/.tmux.conf

    nvim_conf_dir=${HOME}/.config/nvim
    mkdir -p $nvim_conf_dir
    ln -sfv ${rc_repo_dir}/init.vim ${nvim_conf_dir}/init.vim
}

main "$@"
