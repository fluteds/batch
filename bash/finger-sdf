#!/usr/pkg/bin/bash
finger "$1@sdf.org"
finger $1
uinfo $1
echo -n "http://" && url $1
echo Current host is $(hostname)
[ "$(who | awk '{print $1}' | grep -w "$1")" ] && echo "User is online $1 $(who | grep -w "$1" | awk '{print $6}')"
w | grep $1

hosts=("otaku" "faeroes" "iceland" "rie" "sdf" "ryo" "sverige")

command="echo "----" && hostname && w | grep $1"

eval "$(ssh-agent -s)"
ssh-add
for host in "${hosts[@]}"
do
  ssh -A "$host" "$command"
done