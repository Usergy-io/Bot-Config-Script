#!/bin/bash


printf "██████╗░░█████╗░████████╗  ██╗███╗░░██╗░██████╗████████╗░█████╗░██╗░░░░░██╗░░░░░███████╗██████╗░";
printf "██╔══██╗██╔══██╗╚══██╔══╝  ██║████╗░██║██╔════╝╚══██╔══╝██╔══██╗██║░░░░░██║░░░░░██╔════╝██╔══██╗";
printf "██████╦╝██║░░██║░░░██║░░░  ██║██╔██╗██║╚█████╗░░░░██║░░░███████║██║░░░░░██║░░░░░█████╗░░██████╔╝";
printf "██╔══██╗██║░░██║░░░██║░░░  ██║██║╚████║░╚═══██╗░░░██║░░░██╔══██║██║░░░░░██║░░░░░██╔══╝░░██╔══██╗";
printf "██████╦╝╚█████╔╝░░░██║░░░  ██║██║░╚███║██████╔╝░░░██║░░░██║░░██║███████╗███████╗███████╗██║░░██║";
printf "╚═════╝░░╚════╝░░░░╚═╝░░░  ╚═╝╚═╝░░╚══╝╚═════╝░░░░╚═╝░░░╚═╝░░╚═╝╚══════╝╚══════╝╚══════╝╚═╝░░╚═╝";

printf "\n";
printf "\n";
printf "\n";


printf "█▀▄ █▀▀ █░█ █▀▀ █░░ █▀█ █▀█ █▀▀ █▀▄   █▄▄ █▄█   █░█ █▀ █▀▀ █▀█ █▀▀ █▄█";
printf "█▄▀ ██▄ ▀▄▀ ██▄ █▄▄ █▄█ █▀▀ ██▄ █▄▀   █▄█ ░█░   █▄█ ▄█ ██▄ █▀▄ █▄█ ░█░";

printf "\n";
printf "\n";
printf "\n";

printf "This script will install all the packages and libraries neccesary for running unit bots.";
printf "Open a new runner in github each time you want to configure a bot.";

set -eu -o pipefail # fail on error and report it, debug all lines

sudo -n true
test $? -eq 0 || exit 1 "you should have sudo privilege to run this script"

printf "\n";

printf "Updating apt...";
sudo apt update
printf "\n";
printf "Packages updated!";
printf "\n";
printf "Installing NodeJS...";
printf "\n";
sudo apt install nodejs
printf "\n";
printf "NodeJS installed!";
printf "\n";
printf "Installing NPM...";
printf "\n";
sudo apt install npm 
printf "\n";
printf "NPM installed!";
printf "\n";
printf "Making Dir for Runner...";
printf "\n";
mkdir runner & cd runner 
printf "\n";
printf "Dir made!";
printf "\n";
printf "Downloading Runner...";
printf "\n";
curl -o actions-runner-linux-x64-2.296.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.296.1/actions-runner-linux-x64-2.296.1.tar.gz 
printf "\n";
printf "Runner downloaded!";
printf "\n";
printf "Validating Runner...";
printf "\n";
printf "bc943386c499508c1841bd046f78df4f22582325c5d8d9400de980cb3613ed3b  actions-runner-linux-x64-2.296.1.tar.gz" | shasum -a 256 -c
printf "\n";
printf "Runner validated!";
printf "Extracting Runner...";
printf "\n";
tar xzf ./actions-runner-linux-x64-2.296.1.tar.gz 
printf "\n";
printf "Runner extracted!";
printf "\n";
printf "Completed process, please proceed to activating runner!.";

exit 0

