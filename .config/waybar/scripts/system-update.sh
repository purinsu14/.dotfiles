#!/bin/sh
n=$(xbps-install -un 2>/dev/null | grep -c ' update ')
if [ "${n:-0}" -gt 0 ]; then
  printf '{"text":"\\uf021 %s","class":"updates","tooltip":"%s updates available\\nClick to run xbps-install -Syu"}\n' "$n" "$n"
else
  printf '{"text":"\\uf00c","class":"updated","tooltip":"System is up to date"}\n'
fi
