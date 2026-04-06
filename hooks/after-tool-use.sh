#!/bin/bash
# 工具执行后：检测 Bash/MCP 错误 → 警告音
INPUT=$(cat)
TOOL_NAME=$(echo "$INPUT" | grep -o '"tool_name":"[^"]*"' | cut -d'"' -f4)

if [[ "$TOOL_NAME" == "Bash" ]]; then
  HAS_STDERR=$(echo "$INPUT" | grep -o '"stderr":"[^"]*"' | grep -v '"stderr":""')
  HAS_ERROR=$(echo "$INPUT" | grep -E '(<error>|"error":|Failed|Exception)')
  if [[ -n "$HAS_STDERR" ]] || [[ -n "$HAS_ERROR" ]]; then
    "$(dirname "$0")/play-sound.sh" smb_warning.wav 0.8
    echo "❌ Bash error at $(date)" >> /tmp/claude-hook-debug.log
  fi
fi

if [[ "$TOOL_NAME" == mcp__* ]]; then
  if echo "$INPUT" | grep -Eqi '(<error>|"error":|Failed|timeout|invalid)'; then
    "$(dirname "$0")/play-sound.sh" smb_warning.wav 0.8
    echo "❌ MCP error: $TOOL_NAME at $(date)" >> /tmp/claude-hook-debug.log
  fi
fi
