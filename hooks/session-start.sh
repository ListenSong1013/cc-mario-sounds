#!/bin/bash
# 会话启动 → 进入水管
echo "🚀 SessionStart triggered at $(date)" >> /tmp/claude-hook-debug.log
"$(dirname "$0")/play-sound.sh" smb_pipe.wav 0.4
