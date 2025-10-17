
alias k='kubectl'
alias kcontexts='k config get-contexts'

# Create an alias for each Kubernetes context.
# TODO BW 2025-10-17: Give my other contexts more consistent and concise names
# so this is actually helpful.
while IFS= read -r context; do
  alias "$context=k config use-context $context"
done < <(k config get-contexts -o name)
