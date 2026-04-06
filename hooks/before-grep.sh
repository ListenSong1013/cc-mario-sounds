#!/bin/bash
# Grep 搜索前 → 踩敌人
echo "🔍 PreToolUse:Grep triggered at $(date)" >> /tmp/claude-hook-debug.log
"$(dirname "$0")/play-sound.sh" smb_stomp.wav 0.4
