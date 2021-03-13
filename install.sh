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

setup_nvim () {
    echo -en "\nSetting up NVIM..."
    mkdir -p ~/.config/nvim
    cp -r /tmp/dev_tools/nvim/* ~/.config/nvim/
    vim -c ":PlugInstall | :qa!"
    echo "OK"
}

setup_bashrc () {
    echo -en "\nSetting up .bashrc..."
    cp -r /tmp/dev_tools/.bashrc ~/
    touch ~/.credentials
    echo "OK"
}

ensure_source
if [ $# -ne 0	]; then
	for tool in "$@"
	do
        case $tool in
            nvim)
                setup_nvim
                ;;
            bashrc)
                setup_bashrc
                ;;
            *)
                echo -e "\n$tool not found, skipping"
                ;;
        esac
	done
else
    setup_nvim
    setup_bashrc
fi

