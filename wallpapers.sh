#!/bin/bash

# This script can be used to automatically install collection of wallpapers

# The dirs variables
DIR=`pwd`
WDIR="$HOME/Pictures/wallpapers"
JAP=""
HIR=""
LAND=""
WAL="$DIR/wallpapers"

# The actual functions for the script execution
install_jap() {
        echo -e "\n[*] Installing japanese style wallpapers..."
            if [[ -d "$JAP" ]] then
                cp -rf $DIR/wallpapers/japan/* "$JAP"
            else
                mkdir -p "$JAP"
                cp -rf $DIR/wallpapers/japan/* "$JAP"
            fi
}

install_land() {
        echo -e "\n[*] Installing landscape style wallpapers..."
            if [[ -d "$LAND" ]] then
                cp -rf $DIR/wallpapers/landscape/* "$LAND"
            else
                mkdir -p "$LAND"
                cp -rf $DIR/wallpapers/landscape/* "$LAND"
            fi
}

install_hires() {
        echo -e "\n[*] Installing High-Resolution wallpapers..."
            if [[ -d "$HIR" ]] then
                cp -rf $DIR/wallpapers/hi-res/* "$HIR"
            else
                mkdir -p "$HIR"
                cp -rf $DIR/wallpapers/hi-res/* "$HIR"
            fi
}

# make tarball
make_tar() {
	tar -czf $WAL $WDIR
		echo -e "\n[*] Making a backup of the wallpapers into a tarball..."
}

# finish install function
finish_install() {
            echo -e "\n[*] The installation process is now finished, exiting the script..."
                exit 1
            fi
# main
main() {
        clear
        cat <<- EOF
                [*] Installing configurations...
		
                [*] `whoami`, choose your style -
                [1] Japanese style
                [2] Landscape style
                [3] High-Resolution wallpapers
                    [!] Do notice that the High-Resolution wallpapers are heavy, verify you have enough disk space
	
	EOF
        
        read -p "[?] `whoami`, select the correct option : "
        
        if [[ $REPLY == "1" ]]; then 
                install_jap
        elif [[ $REPLY == "2" ]]; then
                install_land
        elif [[ $REPLY == "3" ]]; then
                install_hires
        else
            echo -e "\n Incorrect option! Choose a valid style..."
            exit 1
        fi
}

main

# tar ball the style into the $STYLE dir. Purposedly for backup only.
backup() {
        clear <<- EOF
                    [*] Making a tar ball...
                    
                    [*] `whoami`, do you want to have a tar package with the style you have choosen -
                    [1] Yes
                    [2] No
                    
EOF

        read -p "[?] `whoami`, select an option : "
        
        if [[ $REPLY == "1" ]]; then
                make_tar
        elif [[ $REPLY == "2" ]]; then
                finish_install
        else
            echo -e "\n Incorrec option! Choose a valid option..."
            exit 1
        fi
}

backup
