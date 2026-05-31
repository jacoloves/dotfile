#!bin/sh

set -e

current_date=$(date '+%Y/%m/%d %H:%M:%S')

echo "$current_date [Start] Desktop Cleaner"

rm -rf $HOME/Desktop/*

if [ $? -eq 0 ]; then
  echo "$current_date [OK] Desktop cleaned successfully"
else
  echo "$current_date [NG] Failed to clean Desktop"
fi

echo "$current_date [END] Desktop Cleaner"
