#!/bin/bash

echo "**************************************" >> ~/rmrb.log

def=$(date '+%Y%m%d')

# date definition
year=${def:0:4}
month=${def:4:2}
day=${def:6:2}

# download files
wget -i ~/down.txt -P ~/rmrb -a ~/rmrb/rmrb_down.log
echo "`date '+%Y-%m-%d %H:%M:%S'` download files completed." >> ~/rmrb.log

# merge pdf files
# only after installed pdftk
pdftk ~/rmrb/*.pdf cat output ~/rmrb${year}${month}${day}.pdf
echo "`date '+%Y-%m-%d %H:%M:%S'` merge files completed." >> ~/rmrb.log

# upload file
# only after configured rclone
rclone copy ~/rmrb${year}${month}${day}.pdf wlyn:rmrb/rmrb2020 --log-file ~/rmrb/rclone_rmrb.log --log-level INFO
rclone sync wlyn:rmrb/rmrb2020 axsay:rmrb/rmrb2020 --log-file ~/rmrb/rclone_sync.log --log-level INFO
echo "`date '+%Y-%m-%d %H:%M:%S'` upload file completed." >> ~/rmrb.log

# rm files
rm ~/rmrb/*.pdf
echo "`date '+%Y-%m-%d %H:%M:%S'` delete files completed." >> ~/rmrb.log
