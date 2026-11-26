#!/usr/bin/env bash
# Launcher: ./run.sh [menu|demo|tests|clean]
set -euo pipefail
cd "$(dirname "$0")"

command -v python >/dev/null 2>&1 || { echo "python is required"; exit 1; }
for d in logs outputs/charts outputs/traces outputs/screenshots; do mkdir -p "$d"; done
chmod +x scripts/*.sh

case "${1:-menu}" in
    menu)  python main.py ;;
    demo)  python main.py --demo ;;
    tests) bash scripts/run_tests.sh ;;
    clean) rm -f logs/activity.log outputs/charts/* outputs/traces/* outputs/*.csv outputs/*.md; echo "cleaned" ;;
    *)     echo "Usage: $0 [menu|demo|tests|clean]"; exit 1 ;;
esac
