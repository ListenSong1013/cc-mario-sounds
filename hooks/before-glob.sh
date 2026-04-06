#!/bin/bash
# Glob 文件匹配前 → 扫描地图
echo "🗂️ PreToolUse:Glob triggered at $(date)" >> /tmp/claude-hook-debug.log
"$(dirname "$0")/play-sound.sh" glob_search.wav 0.4
