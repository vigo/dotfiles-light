#!/usr/bin/env bash

set -e
set -o pipefail

backup_files=(
    .profile
    .bashrc
)

for file in ${backup_files[@]}; do
    if [[ -f ${HOME}/${file} ]]; then
        mv ${HOME}/${file} ${HOME}/.${file}_old && echo "${HOME}/${file} found and moved as: ${HOME}/${file}_old"
    fi
done

dotfiles_path="${HOME}/Dotfiles"

for rc_file in ${dotfiles_path}/rc/*; do
    if [[ ! -f ${HOME}/.${rc_file} ]]; then
        ln -s ${rc_file} ${HOME}/.$(basename ${rc_file}) &&
        echo "${HOME}/.$(basename ${rc_file}) linked..."
    fi
done

ln -s ${dotfiles_path}/profile ${HOME}/.profile && echo "${HOME}/.profile linked..."
echo
echo "Install completed... Restart your terminal"