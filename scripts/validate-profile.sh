#!/usr/bin/env bash

# Validate the organization profile and working handbook without relying on
# network access or third-party Markdown services. This check intentionally
# focuses on durable organization facts and delivery-policy language.

set -euo pipefail

repository_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repository_root"

required_files=(
    "README.md"
    "profile/README.md"
    "profile/images/redrafting-america-logo-web.png"
)

for required_file in "${required_files[@]}"; do
    if [ ! -f "$required_file" ]; then
        printf 'ERROR: Required profile file is missing: %s\n' "$required_file" >&2
        exit 1
    fi
done

stale_phrases=(
    "logs/gitsyncall"
    "git-sync-all_v20"
    "final ownership and organizational home have not yet been decided"
    "final personal-versus-organizational ownership model has not yet been decided"
)

for stale_phrase in "${stale_phrases[@]}"; do
    if grep -Fn -- "$stale_phrase" README.md profile/README.md; then
        printf 'ERROR: Stale organization information remains: %s\n' "$stale_phrase" >&2
        exit 1
    fi
done

grep -Eq '^\*\*Version:\*\* [0-9]{3}\.[0-9]{8}\.[0-9]{6}$' README.md || {
    printf '%s\n' "ERROR: Handbook version is missing or malformed." >&2
    exit 1
}
grep -Eq 'Version: [0-9]{3}\.[0-9]{8}\.[0-9]{6}' profile/README.md || {
    printf '%s\n' "ERROR: Public profile version is missing or malformed." >&2
    exit 1
}
grep -Fq 'feature branch' README.md || {
    printf '%s\n' "ERROR: Handbook does not document feature-branch delivery." >&2
    exit 1
}
grep -Fq 'requires at least one successful GitHub' README.md || {
    printf '%s\n' "ERROR: Handbook does not document the green-check gate." >&2
    exit 1
}
grep -Fq 'nonprofit-owned software' README.md || {
    printf '%s\n' "ERROR: Handbook does not state the approved ownership direction." >&2
    exit 1
}
grep -Fq 'nonprofit-owned software' profile/README.md || {
    printf '%s\n' "ERROR: Public profile does not state the approved ownership direction." >&2
    exit 1
}

printf '%s\n' "Organization profile validation passed."
