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
printf "Updating apt...";
sudo apt-get update > /dev/null 2>&1 &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  printf "\b${sp:i++%${#sp}:1}"
done
printf "\n";
printf "Packages updated!\n";

printf "\n";
printf "Upgrading apt...";
sudo apt-get upgrade > /dev/null 2>&1 &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  printf "\b${sp:i++%${#sp}:1}"
done
printf "\n";
printf "Packages upgraded!\n";


printf "\n";
printf "Downloading Node...";
yes | sudo apt install nodejs > /dev/null 2>&1 &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  printf "\b${sp:i++%${#sp}:1}"
done
printf "\n";
printf "Node downloaded:";
node -v

printf "\n";
printf "Downloading NPM...";
yes | sudo apt install NPM > /dev/null 2>&1 &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  printf "\b${sp:i++%${#sp}:1}"
done
printf "\n";
printf "NPM installed: ";
npm -v

printf "\n";
printf "Installing PM2..";
sudo npm install pm2 -g > /dev/null 2>&1 &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  printf "\b${sp:i++%${#sp}:1}"
done
printf "\n";
printf "PM2 installed: ";
pm2 status



printf "\n";
printf "Creating User for Daemon..";
sudo adduser apollo --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
printf "apollo:Space123!" | sudo chpasswd
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  printf "\b${sp:i++%${#sp}:1}"
done
printf "\n";
printf "User updated\n";



printf "\n";
printf "Giving Apollo sudo perms..";
usermod -aG sudo apollo > /dev/null 2>&1 &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  printf "\b${sp:i++%${#sp}:1}"
done
printf "\n";
printf "Sudo attributed\n";



printf "Switching dir to apollo\n"
cd /home/apollo

printf "\n";
printf "Making Runner Dir..";
sudo mkdir actions-runner && cd actions-runner 2>&1 &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  printf "\b${sp:i++%${#sp}:1}"
done
printf "\n";
printf "Made Runner Dir\n";





printf "\n";
printf "Downloading Runner..";
sudo curl -o actions-runner-linux-x64-2.296.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.296.1/actions-runner-linux-x64-2.296.1.tar.gz 
sudo printf "bc943386c499508c1841bd046f78df4f22582325c5d8d9400de980cb3613ed3b  actions-runner-linux-x64-2.296.1.tar.gz" | shasum -a 256 -c
sudo tar xzf ./actions-runner-linux-x64-2.296.1.tar.gz
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  printf "\b${sp:i++%${#sp}:1}"
done
printf "\n";
printf "Downloaded Runner\n";

printf "Configuration completed! Switching User please resume manual config!";
sudo chmod -R a+rwx /home/apollo
sudo su apollo
exit 0
