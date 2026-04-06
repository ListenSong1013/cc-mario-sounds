#!/bin/bash
# 读取文件前 → 头顶砖块
echo "📖 PreToolUse:Read triggered at $(date)" >> /tmp/claude-hook-debug.log
"$(dirname "$0")/play-sound.sh" smb_bump.wav 0.4
