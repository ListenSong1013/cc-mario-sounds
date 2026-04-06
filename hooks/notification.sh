#!/bin/bash
# 通知事件：根据类型播放不同音效
echo "🔔 Notification triggered at $(date)" >> /tmp/claude-hook-debug.log
INPUT=$(cat)
TYPE=$(echo "$INPUT" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('notification_type',''))" 2>/dev/null)

case "$TYPE" in
  permission_prompt)
    "$(dirname "$0")/play-sound.sh" smb_warning.wav 0.8
    ;;
  elicitation_dialog)
    "$(dirname "$0")/play-sound.sh" powerup.wav 0.8
    ;;
  idle_prompt)
    "$(dirname "$0")/play-sound.sh" 1up.wav 0.4
    ;;
  *)
    "$(dirname "$0")/play-sound.sh" smb_warning.wav 0.6
    ;;
esac
