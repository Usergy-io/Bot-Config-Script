#!/bin/bash
# Shows a spinner while another command is running. Randomly picks one of 12 spinner styles.
# @args command to run (with any parameters) while showing a spinner. 
#       E.g. ‹spinner sleep 10›

function shutdown() {
  tput cnorm # reset cursor
}
trap shutdown EXIT

function cursorBack() {
  echo -en "\033[$1D"
}

function spinner() {
  # make sure we use non-unicode character type locale 
  # (that way it works for any locale as long as the font supports the characters)
  local LC_CTYPE=C

  local pid=$1 # Process Id of the previous running command

  case $(($RANDOM % 12)) in
  0)
    local spin='⠁⠂⠄⡀⢀⠠⠐⠈'
    local charwidth=3
    ;;
  1)
    local spin='-\|/'
    local charwidth=1
    ;;
  2)
    local spin="▁▂▃▄▅▆▇█▇▆▅▄▃▂▁"
    local charwidth=3
    ;;
  3)
    local spin="▉▊▋▌▍▎▏▎▍▌▋▊▉"
    local charwidth=3
    ;;
  4)
    local spin='←↖↑↗→↘↓↙'
    local charwidth=3
    ;;
  5)
    local spin='▖▘▝▗'
    local charwidth=3
    ;;
  6)
    local spin='┤┘┴└├┌┬┐'
    local charwidth=3
    ;;
  7)
    local spin='◢◣◤◥'
    local charwidth=3
    ;;
  8)
    local spin='◰◳◲◱'
    local charwidth=3
    ;;
  9)
    local spin='◴◷◶◵'
    local charwidth=3
    ;;
  10)
    local spin='◐◓◑◒'
    local charwidth=3
    ;;
  11)
    local spin='⣾⣽⣻⢿⡿⣟⣯⣷'
    local charwidth=3
    ;;
  esac

  local i=0
  tput civis # cursor invisible
  while kill -0 $pid 2>/dev/null; do
    local i=$(((i + $charwidth) % ${#spin}))
    printf "%s" "${spin:$i:$charwidth}"

    cursorBack 1
    sleep .1
  done
  tput cnorm
  wait $pid # capture exit code
  return $?
}

("$@") &

spinner $!


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
echo "Open a new runner in github each time you want to configure a bot.";

echo "\n";

function updateapt() {
    echo "Updating apt...";
    spinner sudo apt update &> /dev/null
    echo "\n";
    echo "\n";
    echo "Packages updated!";
}

function installNode() {
    echo "Installing NodeJS...";
    spinner sudo apt install nodejs &> /dev/null
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
    echo "Installing NPM...";
    spinner sudo apt install npm &> /dev/null
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
    echo "Installing PM2...";
    spinner sudo npm install pm2 -g &> /dev/null
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

function installRunner(){
    echo "Installing unit-runner...";
    mkdir actions-runner && cd actions-runner
    curl -o actions-runner-linux-x64-2.296.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.296.1/actions-runner-linux-x64-2.296.1.tar.gz &> /dev/null
    echo "Runner Download:";
    echo "bc943386c499508c1841bd046f78df4f22582325c5d8d9400de980cb3613ed3b  actions-runner-linux-x64-2.296.1.tar.gz" | shasum -a 256 -c
    tar xzf ./actions-runner-linux-x64-2.296.1.tar.gz
    echo "\n";
    echo "\n";
    echo "Installed unit-runner! Please continue with config!";
}

updateapt &
wait 

installNode &
wait

installNpm &
wait 

installPM2 &
wait

installRunner &
wait 

echo "D0n3!";

