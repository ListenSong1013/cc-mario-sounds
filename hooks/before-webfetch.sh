#!/bin/bash
# WebFetch 前 → 取回宝物
echo "📡 PreToolUse:WebFetch triggered at $(date)" >> /tmp/claude-hook-debug.log
"$(dirname "$0")/play-sound.sh" web_fetch.wav 0.4
