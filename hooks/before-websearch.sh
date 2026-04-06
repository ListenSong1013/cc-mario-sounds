#!/bin/bash
# WebSearch 前 → 探索新世界
echo "🌐 PreToolUse:WebSearch triggered at $(date)" >> /tmp/claude-hook-debug.log
"$(dirname "$0")/play-sound.sh" web_search.wav 0.4
