#!/bin/bash

echo "**************************************"

def=$1

# date definition
year=${def:0:4}
month=${def:4:2}
day=${def:6:2}
echo ${year}
echo ${month}
echo ${day}

# download files
wget -i ~/down.txt -P ~/rmrb -a ~/rmrb/rmrb_down.log
echo "`date '+%Y-%m-%d %H:%M:%S'` download files completed."

# merge pdf files
pdftk ~/rmrb/*.pdf cat output ~/rmrb${year}${month}${day}.pdf
echo "`date '+%Y-%m-%d %H:%M:%S'` merge files completed."

# upload file
#rclone copy ~/rmrb${year}${month}${day}.pdf axsay:rmrb/rmrb2021 --log-file ~/rmrb/rclone_rmrb.log --log-level INFO
# rclone sync wlyn:rmrb/rmrb2021 axsay:rmrb/rmrb2021 --log-file ~/rmrb/rclone_sync.log --log-level INFO
#echo "`date '+%Y-%m-%d %H:%M:%S'` upload file completed." >> ~/rmrb.log

# rm files
rm ~/rmrb/*.pdf
echo "`date '+%Y-%m-%d %H:%M:%S'` delete files completed."

