#!/usr/bin/env bash

# The following directories are used as defaults by https://webinstall.dev/ (webi), but you can
# SET THESE TO ANY USEFUL FOR YOU DIRECTORY
export INSTALL_HOME="${HOME}/.local/opt"
export EXECUTION_DIR="${HOME}/.local/bin"

setup_path() {
    local new_path="$1"
    export PATH="${new_path}:${PATH}"
    if ! grep -q "export PATH=\"${new_path}:" ~/.bashrc; then
        echo "export PATH=\"${new_path}:\$PATH\"" >> ~/.bashrc
    fi
}
