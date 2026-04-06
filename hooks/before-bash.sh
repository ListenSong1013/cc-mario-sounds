#!/bin/bash
# Bash 命令执行前 → 踢龟壳
echo "🔨 PreToolUse:Bash triggered at $(date)" >> /tmp/claude-hook-debug.log
"$(dirname "$0")/play-sound.sh" smb_kick.wav 0.4
