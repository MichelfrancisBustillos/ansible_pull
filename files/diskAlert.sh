#!/bin/sh
# Purpose: Monitor Linux disk space and send an email alert to $ADMIN
ALERT=90 # alert level
ADMIN="zivi56cb8u@pomail.net" # dev/sysadmin email ID

# Use POSIX output to ensure mountpoint is in the last column, then
# read Use% and MountedOn. Skip common removable/media mount locations.
df -P -h | awk 'NR>1 && $1!~/tmpfs|cdrom/ {print $5 " " $6}' | while read -r usep mountpoint;
do
  case "$mountpoint" in
    /mnt*|/media*|/run/media*)
      # ignore mounted removable or media drives
      continue
      ;;
  esac

  usep_num=$(echo "$usep" | tr -d '%')
  if [ "$usep_num" -ge "$ALERT" ]; then
    echo "Running out of space \"$mountpoint ($usep_num%)\" on $(hostname) as on $(date)" |
    mail -s "Alert: Almost out of disk space $usep" "$ADMIN"
  fi
done