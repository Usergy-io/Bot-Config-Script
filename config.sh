#!/bin/bash


printf "██████╗░░█████╗░████████╗  ██╗███╗░░██╗░██████╗████████╗░█████╗░██╗░░░░░██╗░░░░░███████╗██████╗░\n";
printf "██╔══██╗██╔══██╗╚══██╔══╝  ██║████╗░██║██╔════╝╚══██╔══╝██╔══██╗██║░░░░░██║░░░░░██╔════╝██╔══██╗\n";
printf "██████╦╝██║░░██║░░░██║░░░  ██║██╔██╗██║╚█████╗░░░░██║░░░███████║██║░░░░░██║░░░░░█████╗░░██████╔╝\n";
printf "██╔══██╗██║░░██║░░░██║░░░  ██║██║╚████║░╚═══██╗░░░██║░░░██╔══██║██║░░░░░██║░░░░░██╔══╝░░██╔══██╗\n";
printf "██████╦╝╚█████╔╝░░░██║░░░  ██║██║░╚███║██████╔╝░░░██║░░░██║░░██║███████╗███████╗███████╗██║░░██║\n";
printf "╚═════╝░░╚════╝░░░░╚═╝░░░  ╚═╝╚═╝░░╚══╝╚═════╝░░░░╚═╝░░░╚═╝░░╚═╝╚══════╝╚══════╝╚══════╝╚═╝░░╚═╝\n";

printf "\n";
printf "\n";
printf "\n";


printf "█▀▄ █▀▀ █░█ █▀▀ █░░ █▀█ █▀█ █▀▀ █▀▄   █▄▄ █▄█   █░█ █▀ █▀▀ █▀█ █▀▀ █▄█\n";
printf "█▄▀ ██▄ ▀▄▀ ██▄ █▄▄ █▄█ █▀▀ ██▄ █▄▀   █▄█ ░█░   █▄█ ▄█ ██▄ █▀▄ █▄█ ░█░\n";

printf "\n";
printf "\n";
printf "\n";

printf "This script will install all the packages and libraries neccesary for running unit bots.\n";
printf "Open a new runner in github each time you want to configure a bot.\n";

set -eu -o pipefail # fail on error and report it, debug all lines

sudo -n true
test $? -eq 0 || exit 1 "you should have sudo privilege to run this script\n"

printf "\n";

printf "Updating apt...\n";
sudo apt update
printf "\n";
printf "Packages updated!\n";
printf "\n";
printf "Installing NodeJS...\n";
printf "\n";
sudo apt install nodejs
printf "\n";
printf "NodeJS installed!\n";
printf "\n";
printf "Installing NPM...\n";
printf "\n";
sudo apt install npm 
printf "\n";
printf "NPM installed!\n";
printf "\n";
printf "Making Dir for Runner...\n";
printf "\n";
mkdir runner & cd runner 
printf "\n";
printf "Dir made!\n";
printf "\n";
printf "Downloading Runner...\n";
printf "\n";
curl -o actions-runner-linux-x64-2.296.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.296.1/actions-runner-linux-x64-2.296.1.tar.gz 
printf "\n";
printf "Runner downloaded!\n";
printf "\n";
printf "Validating Runner...\n";
printf "\n";
printf "bc943386c499508c1841bd046f78df4f22582325c5d8d9400de980cb3613ed3b  actions-runner-linux-x64-2.296.1.tar.gz" | shasum -a 256 -c
printf "\n";
printf "Runner validated!\n";
printf "Extracting Runner...\n";
printf "\n";
tar xzf ./actions-runner-linux-x64-2.296.1.tar.gz 
printf "\n";
printf "Runner extracted!\n";
printf "\n";
printf "Completed process, please proceed to activating runner!.\n";

exit 0

