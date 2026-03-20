eval "$(fnm env)"
fnm install --lts --use

# Install local CA for Drizzle Studio
mkcert -install
