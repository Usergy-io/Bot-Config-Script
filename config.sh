#!/bin/bash
spinner() {
    local PROC="$1"
    local str="${2:-'Copyright of KatworX© Tech. Developed by Arjun Singh Kathait and Debugged by the ☆Stack Overflow Community☆'}"
    local delay="0.1"
    tput civis  # hide cursor
    printf "\033[1;34m"
    while [ -d /proc/$PROC ]; do
        printf '\033[s\033[u[ / ] %s\033[u' "$str"; sleep "$delay"
        printf '\033[s\033[u[ — ] %s\033[u' "$str"; sleep "$delay"
        printf '\033[s\033[u[ \ ] %s\033[u' "$str"; sleep "$delay"
        printf '\033[s\033[u[ | ] %s\033[u' "$str"; sleep "$delay"
    done
    printf '\033[s\033[u%*s\033[u\033[0m' $((${#str}+6)) " "  # return to normal
    tput cnorm  # restore cursor
    return 0
}

## simple example with sleep


echo "██████╗░░█████╗░████████╗  ██╗███╗░░██╗░██████╗████████╗░█████╗░██╗░░░░░██╗░░░░░███████╗██████╗░";
echo "██╔══██╗██╔══██╗╚══██╔══╝  ██║████╗░██║██╔════╝╚══██╔══╝██╔══██╗██║░░░░░██║░░░░░██╔════╝██╔══██╗";
echo "██████╦╝██║░░██║░░░██║░░░  ██║██╔██╗██║╚█████╗░░░░██║░░░███████║██║░░░░░██║░░░░░█████╗░░██████╔╝";
echo "██╔══██╗██║░░██║░░░██║░░░  ██║██║╚████║░╚═══██╗░░░██║░░░██╔══██║██║░░░░░██║░░░░░██╔══╝░░██╔══██╗";
echo "██████╦╝╚█████╔╝░░░██║░░░  ██║██║░╚███║██████╔╝░░░██║░░░██║░░██║███████╗███████╗███████╗██║░░██║";
echo "╚═════╝░░╚════╝░░░░╚═╝░░░  ╚═╝╚═╝░░╚══╝╚═════╝░░░░╚═╝░░░╚═╝░░╚═╝╚══════╝╚══════╝╚══════╝╚═╝░░╚═╝";

echo "\n";
echo "\n";
echo "\n";


echo "█▀▄ █▀▀ █░█ █▀▀ █░░ █▀█ █▀█ █▀▀ █▀▄   █▄▄ █▄█   █░█ █▀ █▀▀ █▀█ █▀▀ █▄█";
echo "█▄▀ ██▄ ▀▄▀ ██▄ █▄▄ █▄█ █▀▀ ██▄ █▄▀   █▄█ ░█░   █▄█ ▄█ ██▄ █▀▄ █▄█ ░█░";

echo "\n";
echo "\n";
echo "\n";

echo "This script will install all the packages and libraries neccesary for running unit bots.";
echo "It won't install the runner component from github actions! That is done manually due to security reasons!";

echo "\n";

sleep 5 &
pid=$!
frames="/ | \\ -"


function updateapt() {
    while kill -0 $pid 2&>1 > /dev/null;
    do
        for frame in $frames;
        do
            printf "\r$frame Updating packages..." 
            sleep 0.1
        done
    done
    sudo apt update &> /dev/null
    echo "\n";
    echo "\n";
    echo "Packages updated!";
}

function installNode() {
    while kill -0 $pid 2&>1 > /dev/null;
    do
        for frame in $frames;
        do
            printf "\r$frame Installing Node ..." 
            sleep 0.1
        done
    done
    sudo apt install nodejs &> /dev/null
    if which node > /dev/null
    then
        echo "\n";
        echo "\n";
        echo "Installed Node!";
        node -v
    else
        echo "\n";
        echo "\n";
        echo "Node installation failed!";
        echo "Please install node manually!";
        exit 1
    fi
}

function installNpm() {
    while kill -0 $pid 2&>1 > /dev/null;
    do
        for frame in $frames;
        do
            printf "\r$frame Installing NPM ..." 
            sleep 0.1
        done
    done
    sudo apt install npm &> /dev/null
    if which npm > /dev/null
    then
        echo "\n";
        echo "\n";
        echo "Installed NPM!";
    else
        echo "\n";
        echo "\n";
        echo "NPM installation failed!";
        echo "Please install NPM manually!";
        exit 1
    fi
}

function installPM2() {
    while kill -0 $pid 2&>1 > /dev/null;
    do
        for frame in $frames;
        do
            printf "\r$frame Installing PM2 ..." 
            sleep 0.1
        done
    done
    sudo npm install pm2 -g &> /dev/null
    if which pm2 > /dev/null
    then
        echo "\n";
        echo "\n";
        echo "Installed PM2!";
    else
        echo "\n";
        echo "\n";
        echo "PM2 installation failed!";
        echo "Please install PM2 manually!";
        exit 1
    fi
}


function installGit() {
    while kill -0 $pid 2&>1 > /dev/null;
    do
        for frame in $frames;
        do
            printf "\r$frame Installing Git ..." 
            sleep 0.1
        done
    done
    sudo apt install git &> /dev/null
    if which git > /dev/null
    then
        echo "\n";
        echo "\n";
        echo "Installed Git!";
    else
        echo "\n";
        echo "\n";
        echo "Git installation failed!";
        echo "Please install Git manually!";
        exit 1
    fi
}

function setupRunner() {
    while kill -0 $pid 2&>1 > /dev/null;
    do
        for frame in $frames;
        do
            printf "\r$frame Setting up runner ..." 
            sleep 0.1
        done
    done
    mkdir actions-runner && cd actions-runner 
    curl -o actions-runner-linux-x64-2.296.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.296.1/actions-runner-linux-x64-2.296.1.tar.gz &> /dev/null
    echo "bc943386c499508c1841bd046f78df4f22582325c5d8d9400de980cb3613ed3b  actions-runner-linux-x64-2.296.1.tar.gz" | shasum -a 256 -c
    tar xzf ./actions-runner-linux-x64-2.296.1.tar.gz
    echo "Enter Token: "
    read token
    ./config.sh --url https://github.com/Usergy-io/Unit-Bot --token AKXO3IVKD65QNQEKNVTQ5L3DC2KZE
    echo "Enter name: "
    read name
    ./config.sh --name $name
    echo "Enter labels: "
    read labels
    ./config.sh --labels $labels
    echo "Enter workdir: "
    read workdir
    ./config.sh --work $workdir
    echo "Enter runner group: "
    read group
    ./config.sh --runnergroup $group
    echo "Enter runner group: "
    read group
    ./config.sh --runnergroup $group
    echo "Enter runner group: "
    read group
    
    ./svc.sh install
    ./svc.sh start
    echo "Runner setup complete!";
}

updateapt &
installNode &
installNpm &
installPM2 &
installGit &
setupRunner &

wait 

echo "D0n3!";

