#!/usr/bin/env bash
set -euo pipefail

ROOT="$(git rev-parse --show-toplevel 2>/dev/null || true)"
if [[ -z "$ROOT" ]]; then
  echo "Error: ejecuta este script dentro del repositorio clonado."
  exit 1
fi

cd "$ROOT"

declare -A MAP=(
  ["Screenshot From 2026-10-06 16-48-30.png"]="screenshots/tests/01-users-web-denied.png"
  ["Screenshot From 2026-10-06 16-49-00.png"]="screenshots/fortigate/01-users-deny-logs.png"
  ["Screenshot From 2026-10-07 15-08-53.png"]="screenshots/fortigate/02-jump-to-web-allow-logs.png"
  ["Screenshot From 2026-10-07 15-12-18.png"]="screenshots/fortigate/03-allow-deny-combined-logs.png"
  ["Screenshot From 2026-10-07 15-27-11.png"]="screenshots/troubleshooting/01-ssl-vpn-settings-attempt.png"
  ["Screenshot From 2026-10-07 15-30-02.png"]="screenshots/troubleshooting/02-ssl-vpn-policy-attempt.png"
  ["Screenshot From 2026-10-07 16-03-40.png"]="screenshots/troubleshooting/03-forticlient-ssl-vpn-attempt.png"
  ["Screenshot From 2026-10-07 16-14-59.png"]="screenshots/vpn/01-ipsec-wizard-remote-access.png"
  ["Screenshot From 2026-10-07 16-16-04.png"]="screenshots/vpn/02-ipsec-authentication.png"
  ["Screenshot From 2026-10-07 16-19-48.png"]="screenshots/vpn/03-ipsec-policy-routing.png"
  ["Screenshot From 2026-10-07 16-22-25.png"]="screenshots/vpn/04-ipsec-review-settings.png"
  ["Screenshot From 2026-10-07 16-23-29.png"]="screenshots/vpn/05-ipsec-created.png"
  ["Screenshot From 2026-10-07 16-26-43.png"]="screenshots/fortigate/04-ipsec-rdp-policy.png"
  ["Screenshot From 2026-10-07 18-03-39.png"]="screenshots/tests/02-vpn-web-blocked-rdp-warning.png"
  ["Screenshot From 2026-10-07 18-03-53.png"]="screenshots/tests/03-vpn-rdp-jump-success.png"
)

SEARCH_DIRS=(
  "$HOME/Pictures"
  "$HOME/Desktop"
  "$HOME/Downloads"
)

mkdir -p screenshots/{fortigate,vpn,tests,troubleshooting}

copied=0
missing=0

for src_name in "${!MAP[@]}"; do
  target="${MAP[$src_name]}"
  found=""

  for dir in "${SEARCH_DIRS[@]}"; do
    [[ -d "$dir" ]] || continue
    found="$(find "$dir" -type f -name "$src_name" -print -quit 2>/dev/null || true)"
    [[ -n "$found" ]] && break
  done

  if [[ -n "$found" ]]; then
    cp -f "$found" "$target"
    echo "OK   $src_name -> $target"
    ((copied+=1))
  else
    echo "MISS $src_name"
    ((missing+=1))
  fi
done

echo
echo "Copiadas: $copied"
echo "Faltantes: $missing"
echo

git status --short screenshots/

if [[ "${1:-}" == "--push" ]]; then
  git add screenshots/
  if git diff --cached --quiet; then
    echo "No hay cambios nuevos para commit."
  else
    git commit -m "Add Infra2 validation screenshots"
    git push
  fi
fi
