#!/bin/bash
# 统一音效播放入口
# 用法: play-sound.sh <文件名> [音量 0.0-1.0]

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOUND_DIR="${SCRIPT_DIR}/../sounds"
SOUND_FILE="${SOUND_DIR}/$1"
VOLUME="${2:-0.4}"

[ -f "$SOUND_FILE" ] || exit 0

# 防止重叠：kill 上一个播放进程
PID_FILE="/tmp/claude-sound.${USER:-nobody}.pid"
if [ -f "$PID_FILE" ]; then
  old_pid=$(cat "$PID_FILE" 2>/dev/null)
  [ -n "$old_pid" ] && kill "$old_pid" 2>/dev/null
  rm -f "$PID_FILE"
fi

case "$(uname -s)" in
  Darwin) afplay -v "$VOLUME" "$SOUND_FILE" >/dev/null 2>&1 & ;;
  Linux)
    if command -v aplay >/dev/null 2>&1; then
      aplay "$SOUND_FILE" >/dev/null 2>&1 &
    elif command -v paplay >/dev/null 2>&1; then
      paplay "$SOUND_FILE" >/dev/null 2>&1 &
    fi
    ;;
esac

echo $! > "$PID_FILE"
