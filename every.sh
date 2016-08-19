#!/bin/sh

# Usage: every <timespec> <command>
# timespec is something that GNU `date` understands
# Examples:
# every 3min echo foo
# every '1 hour 34 mins' date

verbose () {
  echo "> $@"
  "$@"
}

timespec="$1"
shift

delta=$(($(date --date="now + $timespec" +%s) - $(date +%s)))

if ! [ 0 -lt "$delta" ]
then
  echo "invalid timespec $timespec"
  return 1
fi

while :
do
  ( verbose "$@" )
  verbose sleep $delta
done
