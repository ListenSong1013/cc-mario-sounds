# 🍄 CC Mario Sounds

用超级马里奥经典音效为 Claude Code 的每一个操作提供实时声音反馈，让你通过声音感知 AI 的执行状态，无需盯着屏幕。

🎵 **[点击试听所有音效](https://listensong1013.github.io/cc-mario-sounds/)**

## 音效映射

| 事件 | 音效 | 说明 |
|------|------|------|
| Bash 命令 | `smb_kick.wav` | 踢出龟壳 |
| MCP 工具 | `smb_kick.wav` | 踢出龟壳 |
| Read 读文件 | `smb_bump.wav` | 撞到砖块 |
| Write 写文件 | `smb_jump-super.wav` | 超级大跳 |
| Edit 编辑文件 | `smb_jump-small.wav` | 小跳 |
| Grep 搜索 | `smb_stomp.wav` | 踩扁栗宝宝 |
| Glob 文件匹配 | `glob_search.wav` | 扫描地图 |
| WebSearch 搜网页 | `web_search.wav` | 探索新世界 |
| WebFetch 抓内容 | `web_fetch.wav` | 取回宝物 |
| 权限请求 | `smb_warning.wav` | 前方有危险 |
| 吃蘑菇提示 | `powerup.wav` | 道具变身 |
| 空闲提示 | `1up.wav` | 额外生命 |
| 会话启动 | `smb_pipe.wav` | 钻进传送管 |
| 任务完成 | `smb_world_clear.wav` | 通关！ |
| 执行失败 | `smb_warning.wav` | 危险警告 |
| 工具报错 | `smb_warning.wav` | 危险警告 |

## 快速安装

### Claude Code

#### 1. 克隆仓库

```bash
git clone https://github.com/your-username/cc-mario-sounds.git
cd cc-mario-sounds
```

#### 2. 复制 hooks 脚本

```bash
mkdir -p ~/.claude/hooks
cp hooks/*.sh ~/.claude/hooks/
chmod +x ~/.claude/hooks/*.sh
```

#### 3. 配置 Claude Code

将 `examples/settings.json` 中的内容合并到 `~/.claude/settings.json`。

#### 4. 重新开启一个 Session

新建 session 后即可生效，听到传送管音效说明安装成功。

---

### Codex CLI

Codex CLI 0.118+ 原生支持 hooks，无需额外工具。

#### 1. 开启 hooks 功能

在 `~/.codex/config.toml` 的 `[features]` 段加一行：

```toml
[features]
codex_hooks = true
```

#### 2. 配置 hooks

将 `examples/codex-hooks.json` 复制到 `~/.codex/hooks.json`：

```bash
cp examples/codex-hooks.json ~/.codex/hooks.json
```

> **前提**：已按上方 Claude Code 步骤安装好 `~/.claude/hooks/`，Codex 直接复用这套脚本。

#### 3. 重启 Codex

新开一个 Codex session，执行任意 Bash 命令，听到踢龟壳音效说明生效。

## 文件结构

```
cc-mario-sounds/
├── README.md
├── LICENSE
├── sounds/                      # 马里奥音效文件
│   ├── smb_kick.wav
│   ├── smb_bump.wav
│   ├── smb_jump-small.wav
│   ├── smb_jump-super.wav
│   ├── smb_stomp.wav
│   ├── smb_warning.wav
│   ├── smb_pipe.wav
│   ├── smb_world_clear.wav
│   ├── glob_search.wav
│   ├── web_search.wav
│   ├── web_fetch.wav
│   ├── coin.wav
│   ├── powerup.wav
│   ├── 1up.wav
│   └── session_start.wav
├── hooks/
│   ├── play-sound.sh            # 统一播放入口
│   ├── before-bash.sh
│   ├── before-mcp.sh
│   ├── before-read.sh
│   ├── before-write.sh
│   ├── before-edit.sh
│   ├── before-grep.sh
│   ├── before-glob.sh
│   ├── before-websearch.sh
│   ├── before-webfetch.sh
│   ├── after-tool-use.sh        # 错误检测
│   ├── notification.sh
│   ├── session-start.sh
│   ├── stop.sh
│   └── stop-failure.sh
└── examples/
    ├── settings.json            # Claude Code 配置示例
    └── codex-hooks.json         # Codex CLI 配置示例
```

## 自定义音效

直接替换 `sounds/` 目录下的 `.wav` 文件即可，保持文件名不变。

如需更改映射关系，修改对应的 `.sh` 脚本中的文件名：

```bash
# 例：把任务完成改成吃金币音效
# 编辑 hooks/stop.sh
"$(dirname "$0")/play-sound.sh" coin.wav 0.2
```

音量范围 `0.0–1.0`，在 `play-sound.sh` 调用时传入第二个参数。

## 调试

```bash
# 查看 Hook 执行日志
tail -f /tmp/claude-hook-debug.log

# 手动测试音效
afplay -v 0.3 sounds/smb_world_clear.wav
```

## 平台支持

| 平台 | 播放器 |
|------|--------|
| macOS | `afplay`（支持音量控制） |
| Linux | `aplay`（优先）或 `paplay` |

## 许可证

MIT
