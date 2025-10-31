# Install extensions from Cursorfile
cat Cursorfile | xargs -L 1 cursor --install-extension
