#!/usr/bin/env bash

echo "INFO Installing Hexa..."
echo "Please the path you would like to install hexa to > "
read path
echo "INFO Installing hexa to" $path "..."
sudo apt install git
sudo apt install python3-pip
git clone https://github.com/Draxdo/ForsakenCoordinatedApplications.git
rsync -a ForsakenCoordinatedApplications/* $path/hexa
rm -rf ForsakenCoordinatedApplications
chmod +x $path/hexa/hexa.py
sudo mv $path/hexa/hexa.py /usr/bin/hexa.py
sudo sed -i '76i\path ="'$path'/hexa"' /usr/bin/hexa.py
sudo apt install g++
sudo apt install python3
pip3 install pyinstaller
g++ -o hexa $path/hexa/run.cpp
chmod +x hexa
sudo mv hexa /usr/bin/hexa
echo "INFO Performing cleanup..."
me="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
rm $me
rm $path/hexa/run.cpp
echo "INFO Successfully install hexa!"