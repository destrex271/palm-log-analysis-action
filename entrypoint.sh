#!/bin/sh

echo "$1"

# while getopts a:f: flag
# do
#     case "${flag}" in
#         a) api_key=${OPTARG};;
#         f) filename=${OPTARG};;
#     esac
# done
#
# echo "$filename"
# echo "$api_key"
#
echo "HI<<$EOF" >> $GITHUB_OUTPUT

# python test.py ${filename}
