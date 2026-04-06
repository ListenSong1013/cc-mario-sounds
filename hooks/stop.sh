#!/bin/bash
# 任务完成 → 通关音乐
echo "✅ Stop triggered at $(date)" >> /tmp/claude-hook-debug.log
"$(dirname "$0")/play-sound.sh" smb_world_clear.wav 0.2
