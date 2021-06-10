#!/usr/bin/env bash

set -e
set -o pipefail

echo
echo "This will remove \`Dotfiles Light\` are you sure? (Y/n)"
read -r CHOISE

if [[ ${CHOISE} =~ ^[nN]$ ]]; then
    echo "Canceled.."
    return 1
fi

unlink "${HOME}/.profile" && echo "unlinked ${HOME}/.profile"
unlink "${HOME}/.bashrc" && echo "unlinked ${HOME}/.bashrc"
unlink "${HOME}/.inputrc" && echo "unlinked ${HOME}/.inputrc"
echo
echo "\`Dotfiles Light\` uninstalled. Folder still stays. You can keep/delete it."
echo "Restart your terminal..."
