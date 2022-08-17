# Test Task Jooble 
## This scripts can do smart backup whit deleting old data

You need enter the ```crontab -e```  and append to the end of the file ```00 00 * * * /bin/bash /path/to/task.sh```
that we can do backup and delete data for everyone '''*.log''' file except access.log every 24 hours. 

After add to this file ```*/15 * * * * /bin/bash /path/to/task.sh``` that we can do backup and delete data for access.log every 15 min.
In check_file.py we change the "$md5hash_of_record-date$username", where record-date(ddmmyyyy) , username — "2-3symbols@domain.name" to the "*****".
And delete the string what has "192.168.0.100" or "127.0.0.1".

In task.sh we run check_file.py and do backup with deleting old data.

In drop_15_access.sh we separately delete the data of access.log
