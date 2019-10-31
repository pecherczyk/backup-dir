#!/bin/bash
#
# Simple backup script 
#

date=$(date +%F_%T)

printf "%s\n" "Enter source folder name in home directory";
read input_dir;

printf "%s\n" "Enter backup folder name in home directory";
read backup_dir;

mkdir -p ~/$backup_dir

for d in ~/$input_dir/*
do
  dir_name=$(echo $d | grep -Eo [^\/]*$)
  tar -cjvf ~/${backup_dir}/${date}_${dir_name}.tar.bz2 -C /home/lukasz/www/ ${dir_name}
done
