
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

echo "Updating apt...";
sudo apt update &> /dev/null
echo "\n";
echo "Packages updated!";
echo "\n";
echo "Installing NodeJS...";
echo "\n";
sudo apt install nodejs &> /dev/null
echo "\n";
echo "NodeJS installed!";
echo "\n";
echo "Installing NPM...";
echo "\n";
sudo apt install npm &> /dev/null
echo "\n";
echo "NPM installed!";
echo "\n";
echo "Making Dir for Runner...";
echo "\n";
mkdir runner & cd runner &> /dev/null
echo "\n";
echo "Dir made!";
echo "\n";
echo "Downloading Runner...";
echo "\n";
curl -o actions-runner-linux-x64-2.296.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.296.1/actions-runner-linux-x64-2.296.1.tar.gz &> /dev/null
echo "\n";
echo "Runner downloaded!";
echo "\n";
echo "Validating Runner...";
echo "\n";
echo "bc943386c499508c1841bd046f78df4f22582325c5d8d9400de980cb3613ed3b  actions-runner-linux-x64-2.296.1.tar.gz" | shasum -a 256 -c
echo "\n";
echo "Runner validated!";
echo "Extracting Runner...";
echo "\n";
tar xzf ./actions-runner-linux-x64-2.296.1.tar.gz &> /dev/null
echo "\n";
echo "Runner extracted!";
echo "\n";
echo "Completed process, please proceed to activating runner!.";

exit 0

