# Create ~/.codex directory if it doesn't exist
mkdir -p ~/.codex

# Create config.toml with specified settings
cat > ~/.codex/config.toml << 'EOF'
model = "gpt-5-codex"
model_reasoning_effort = "high"
model_verbosity = "high"
tools.web_search = true
EOF
