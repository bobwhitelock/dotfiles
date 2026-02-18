
alias k='kubectl'
alias kcontexts='k config get-contexts'

# TODO BW 2026-02-18: If/when need to do Kubernetes work switching across lots
# of contexts again, set useful names for contexts and add an FZF alias to help
# switch between them - previousl did this but it's pretty clunky:
# while IFS= read -r context; do
#   alias "$context=k config use-context $context"
# done < <(k config get-contexts -o name)
