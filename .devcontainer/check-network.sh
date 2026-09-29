#!/usr/bin/env bash
set -e

echo "== DNS =="
getent hosts github.com
getent hosts raw.githubusercontent.com

echo
echo "== HTTPS =="
curl -fsSI https://github.com/ >/dev/null
curl -fsSI https://raw.githubusercontent.com/ >/dev/null

echo
echo "== Git =="
git --version
git ls-remote https://github.com/HackerN64/HackerSM64.git HEAD
git ls-remote https://github.com/xFredrer/showfloor-flapped.git HEAD

echo
echo "Network/DNS check passed."
