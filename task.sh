#!/bin/bash

backup_dir=~/new_place_for_backup/
log_dir=/home/$USER/PycharmProjects/task_jooble/test

#start cleaning using python
python3 /home/$USER/PycharmProjects/task_jooble/check_file.py --dir-path $log_dir

#if not exists dir we will create
if [ ! -d $backup_dir ]
then
    echo "Warning: Directory $backup_dir does not exists."
    mkdir $backup_dir
    echo "Directory $backup_dir created."
fi

# do backup
name_date=$(date +'%m-%d-%y')

tar zcfv "${name_date}_test.tar.gz" /home/$USER/PycharmProjects/task_jooble/test
mv *_test.tar.gz $backup_dir

#do file empty but dont acces.log
for filename in $log_dir/*; do
    if [[ $filename != *"access.log"* ]]
    then
        echo -n > $filename
    fi
done

# delete oldest backup
counter_of_backups="$(ls $backup_dir | wc -l)"

if [ $counter_of_backups -gt 10 ]
then
    rm $backup_dir"$(ls -t $backup_dir | tail -1)"
fi
