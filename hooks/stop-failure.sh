#!/bin/bash
# 执行失败/限流/错误 → 警告音
INPUT=$(cat)
ERROR_TYPE=$(echo "$INPUT" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('error_type','unknown'))" 2>/dev/null)
echo "❌ StopFailure ($ERROR_TYPE) at $(date)" >> /tmp/claude-hook-debug.log
"$(dirname "$0")/play-sound.sh" smb_warning.wav 1.0
