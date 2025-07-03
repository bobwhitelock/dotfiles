
# XXX exporting in here breaks things for other things that need some of these
# env vars like Aider - use a subshell to avoid polluting env? Or a separate
# script?
codex() {
    # XXX use `run_in_container.sh` for sandboxing - see
    # https://github.com/openai/codex?tab=readme-ov-file#platform-sandboxing-details
    nvm use 22
    # XXX This env var appears to need to be set for Azure to work, but the
    # `OPENAI_API_KEY` will actually be used.
    export AZURE_OPENAI_API_KEY="placeholder"
    export OPENAI_API_KEY="$AZURE_API_KEY"
    export AZURE_BASE_URL="$AZURE_API_BASE/openai"
    command codex --provider azure --model gpt-4.1 --approval-mode full-auto
}
