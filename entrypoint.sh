#!/bin/sh

file_path=$1
api_key=$2

sudo apt update && sudo apt upgrade -y
sudo apt install -y python3 python3-pip
pip install -r requirements.txt

touch analysis.txt
result=$(python3 main.py $1 $2)

echo "analysis=$result" >> $GITHUB_OUTPUT

