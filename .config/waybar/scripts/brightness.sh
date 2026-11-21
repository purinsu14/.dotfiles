#!/bin/sh
# usage: brightness.sh [up|down]   (no arg = just print current value)
BUS=5   # from `ddcutil detect`: /dev/i2c-(number)

case "$1" in
  up)   ddcutil --bus $BUS --noverify setvcp 10 + 5 ;;
  down) ddcutil --bus $BUS --noverify setvcp 10 - 5 ;;
esac

# terse output looks like: VCP 10 C 40 100
cur=$(ddcutil --bus $BUS -t getvcp 10 | awk '{print $4}')
[ -z "$cur" ] && exit 1

printf '{"text":"%s","percentage":%s,"tooltip":"Brightness: %s%%"}\n' "$cur%" "$cur" "$cur"
