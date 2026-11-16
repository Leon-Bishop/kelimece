#!/bin/bash
# Kelimece macOS local preview. Requires only Python 3 (no project dependencies).
set -u
cd "$(dirname "$0")" || exit 1
printf '\n==================================\n'
printf '  KELIMECE - Mac test\n'
printf '==================================\n\n'
if command -v python3 >/dev/null 2>&1 && python3 -c 'import http.server' >/dev/null 2>&1; then
    python3 -u - <<'PY'
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer
from subprocess import run

# Keep the same localhost origin across launches so Safari preserves today's progress.
port = 8765
try:
    server = ThreadingHTTPServer(('127.0.0.1', port), SimpleHTTPRequestHandler)
except OSError:
    print('Port 8765 is in use. Close the other preview and start again.', flush=True)
    raise SystemExit(1)
url = f'http://127.0.0.1:{server.server_port}/'
print('Kelimece is ready:', url, flush=True)
print('Safari will open automatically. Leave this Terminal window open while testing.', flush=True)
print('When finished, press Control+C in this window.', flush=True)
try:
    run(['open', '-a', 'Safari', url], check=False)
except FileNotFoundError:
    print('Open this address in your browser:', url, flush=True)
try:
    server.serve_forever()
except KeyboardInterrupt:
    print('\nPreview stopped.', flush=True)
finally:
    server.server_close()
PY
else
    printf 'Python 3 was not found. Opening the static file in Safari instead.\n'
    printf 'For the most reliable local saves and sharing, install Python 3 and rerun this launcher.\n\n'
    open -a Safari "$(pwd)/index.html"
    printf 'Press Return to close this window.\n'
    read -r _
fi
