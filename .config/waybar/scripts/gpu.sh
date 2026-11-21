#!/bin/sh
# GPU usage/temp/VRAM for waybar (NVIDIA or AMD). Prints JSON.

if command -v nvidia-smi >/dev/null 2>&1; then
  out=$(nvidia-smi --query-gpu=utilization.gpu,temperature.gpu,memory.used,memory.total \
        --format=csv,noheader,nounits 2>/dev/null | head -n1)
  [ -n "$out" ] || exit 1
  IFS=', ' read -r use temp mu mt <<EOT
$out
EOT
  printf '{"text":"%s%%","tooltip":"GPU: %s%% | %s°C\\nVRAM: %s / %s MiB"}\n' "$use" "$use" "$temp" "$mu" "$mt"
  exit 0
fi

for d in /sys/class/drm/card[0-9]/device; do
  [ -r "$d/gpu_busy_percent" ] || continue
  use=$(cat "$d/gpu_busy_percent")
  t=$(cat "$d"/hwmon/hwmon*/temp1_input 2>/dev/null | head -n1)
  temp=$(( ${t:-0} / 1000 ))
  vu=$(( $(cat "$d/mem_info_vram_used" 2>/dev/null || echo 0) / 1048576 ))
  vt=$(( $(cat "$d/mem_info_vram_total" 2>/dev/null || echo 0) / 1048576 ))
  printf '{"text":"%s%%","tooltip":"GPU: %s%% | %s°C\\nVRAM: %s / %s MiB"}\n' "$use" "$use" "$temp" "$vu" "$vt"
  exit 0
done

exit 1
