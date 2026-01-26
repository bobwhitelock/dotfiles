# shellcheck shell=bash

alias k='kubectl'
alias kcontexts='k config get-contexts'

# Create an alias for each Kubernetes context.
# TODO BW 2025-10-17: Give my other contexts more consistent and concise names
# so this is actually helpful.
# TODO BW 2025-10-23: Alternatively could switch to just have a FZF alias to
# allow selecting a Kubernetes context?
if command -v kubectl >/dev/null 2>&1; then
  while IFS= read -r context; do
    # shellcheck disable=SC2139 # Auto-suppressed when enabling Shellcheck.
    alias "$context=k config use-context $context"
  done < <(k config get-contexts -o name 2>/dev/null)
fi
