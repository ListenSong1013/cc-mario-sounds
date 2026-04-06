#!/bin/bash
# 写入文件前 → 超级大跳
echo "✏️ PreToolUse:Write triggered at $(date)" >> /tmp/claude-hook-debug.log
"$(dirname "$0")/play-sound.sh" smb_jump-super.wav 0.4
