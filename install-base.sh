#!/usr/bin/env bash
set -euo pipefail

# Install the official-repository packages requested for a basic Wayland setup.
# Run with: bash install-pacman.sh

printf '仓库要求：普通软件包来自官方 [core]/[extra]；32 位兼容包需要启用官方 [multilib]。\n'
printf '请确认 /etc/pacman.conf 中已启用 [multilib]，之后执行完整系统升级（sudo pacman -Syu）。\n\n'

if ! command -v pacman >/dev/null 2>&1; then
  printf '错误：未找到 pacman；此脚本适用于 Arch Linux 及其衍生发行版。\n' >&2
  exit 1
fi

if [[ ${EUID} -eq 0 ]]; then
  PACMAN=(pacman)
else
  if ! command -v sudo >/dev/null 2>&1; then
    printf '错误：需要 sudo 权限，请安装 sudo 或以 root 运行。\n' >&2
    exit 1
  fi
  PACMAN=(sudo pacman)
fi

packages=(
  # 基础命令行与常用工具
  bash
  neovim
  aria2
  yazi
  smartmontools

  # 网络与蓝牙
  networkmanager
  blueman

  # Wayland 桌面与显示管理
  kanshi
  wlr-randr
  swaylock
  swayidle
  wlopm
  swaybg
  foot
  wofi
  swayimg
  mpv
  fnott

  # 输入法、剪贴板与截图
  fcitx5
  wl-clipboard
  cliphist
  grim
  slurp
  swappy

  # 字体
  noto-fonts
  noto-fonts-cjk
  noto-fonts-emoji
  ttf-hack
  ttf-nerd-fonts-symbols
  ttf-nerd-fonts-symbols-common

  # PipeWire / ALSA 音频（含 32 位兼容库）
  pipewire
  pipewire-audio
  pipewire-alsa
  pipewire-pulse
  pipewire-jack
  pipewire-v4l2
  wireplumber
  alsa-lib
  alsa-utils
  lib32-pipewire
  lib32-libpipewire
  lib32-pipewire-jack
  lib32-pipewire-v4l2
  lib32-alsa-lib
  lib32-libpulse

  # 桌面门户（文件选择器、屏幕共享等）
  xdg-desktop-portal-gtk
  xdg-desktop-portal-wlr
)

cpu_vendor=$(awk -F ':' '/^vendor_id[[:space:]]*:/ { gsub(/^[[:space:]]+|[[:space:]]+$/, "", $2); print $2; exit }' /proc/cpuinfo)
case "$cpu_vendor" in
  GenuineIntel)
    microcode_package=intel-ucode
    ;;
  AuthenticAMD)
    microcode_package=amd-ucode
    ;;
  *)
    printf '错误：无法识别 CPU 厂商（vendor_id: %s），未执行安装。\n' "${cpu_vendor:-未知}"
    exit 1
    ;;
esac
packages+=("$microcode_package")
printf '检测到 CPU 厂商：%s，将安装微码包：%s\n' "$cpu_vendor" "$microcode_package"

read -r -p '安装前先执行完整系统升级（pacman -Syu）？[Y/n] ' update_choice
case "$update_choice" in
  n|N|no|NO)
    printf '跳过系统升级，继续安装所选软件包。\n'
    ;;
  *)
    "${PACMAN[@]}" -Syu
    ;;
esac

printf '即将通过 pacman 安装以下官方仓库软件包：\n'
printf '  %s\n' "${packages[@]}"
printf '\n'
"${PACMAN[@]}" -S --needed "${packages[@]}"

printf '\n安装完成。\n'
