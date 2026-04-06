#!/bin/bash
# MCP 工具调用前 → 踢龟壳
echo "🔧 PreToolUse:MCP triggered at $(date)" >> /tmp/claude-hook-debug.log
"$(dirname "$0")/play-sound.sh" smb_kick.wav 0.4
