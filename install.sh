#!/bin/bash

ensure_source () {
    if [ ! -d "/tmp/dev_tools" ]; then
        echo -en "\nPulling down soure directory..."
        git clone -q https://github.com/WilliamJohns/dev_tools.git /tmp/dev_tools
            echo "OK"
    else
        echo -en "\nMaking sure source repo is up to date..."
        git -C /tmp/dev_tools pull -q
        echo "OK"
    fi
}

install_nvim () {
    echo -en "\nInstalling nvim configuration..."
    mkdir -p ~/.config/nvim
    cp -r /tmp/dev_tools/nvim/* ~/.config/nvim/
    vim -c ":PlugInstall | :qa!"
    echo "OK"
}


ensure_source
if [ $# -ne 0	]; then
	for tool in "$@"
	do
        case $tool in
            nvim)
                install_nvim
                ;;
            *)
                echo -e "\n$tool not found, skipping"
                ;;
        esac
	done
else
    install_nvim
fi
