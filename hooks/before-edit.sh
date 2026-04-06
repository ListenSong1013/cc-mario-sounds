#!/bin/bash
# 编辑文件前 → 小跳
echo "✏️ PreToolUse:Edit triggered at $(date)" >> /tmp/claude-hook-debug.log
"$(dirname "$0")/play-sound.sh" smb_jump-small.wav 0.4
