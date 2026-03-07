# Create necessary directory
mkdir -p ~/.codex

# Symlink configuration files
ln -snf ~/.dotfiles/config/.codex/AGENTS.md ~/.codex/AGENTS.md
ln -snf ~/.dotfiles/config/.codex/skills ~/.codex/skills/user

# Create configuration file
cat > ~/.codex/config.toml << 'EOF'
model = "gpt-5.4"
model_reasoning_effort = "high"
plan_mode_reasoning_effort = "high"
service_tier = "fast"
personality = "none"

[features]
js_repl = true
multi_agent = true
prevent_idle_sleep = true

[mcp_servers.context7]
url = "https://mcp.context7.com/mcp"

[[skills.config]]
path = "~/.codex/skills/.system/skill-creator/SKILL.md"
enabled = false

[[skills.config]]
path = "~/.codex/skills/.system/skill-installer/SKILL.md"
enabled = false

[[skills.config]]
path = "~/.codex/skills/.system/slides/SKILL.md"
enabled = false

[[skills.config]]
path = "~/.codex/skills/.system/spreadsheets/SKILL.md"
enabled = false
EOF
