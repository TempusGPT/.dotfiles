eval "$(fnm env)"
fnm install --lts
fnm use default

# Install local CA for Drizzle Studio
mkcert -install
