# Claude Code Instructions

### Code Style and Documentation
- **Remove verbose comments and docstrings**: Only comment on truly exceptional or non-obvious code. Competent developers can read code without explaining what each line does
- **No preamble/postamble**: Don't add explanatory text before/after responses unless specifically asked
- **Concise responses**: Keep responses to 4 lines or fewer unless detail is requested
- **No unnecessary "here's what I'm doing" explanations**: Just do the work
- **IMPORTANT: NEVER put imports inline if this can be avoided - always put them up top of the file, organized with the rest of the imports**

### Development Approach
- **Use TodoWrite tool proactively**: Always track complex tasks with the TodoWrite tool for visibility
- **Never commit unless explicitly asked**: Do not create git commits; the user commits their own changes
- **Fix actual errors**: When something breaks, fix the root cause, don't fake it

### Technical Preferences
- Files and classes should be structured so functions/methods always appear above functions/methods they depend on, so things will naturally be grouped with a public method followed by private methods it uses, and further private methods these use etc. Other independent public methods may then follow these, in the same pattern. This also means furthest down in a class may appear implementation details that multiple higher public methods depend on. Follow this approach for additions you make, but leave existing ordering as it is unless instructed otherwise or you are making a significant refactoring already.
- **Prefer editing over creating**: Always edit existing files rather than creating new ones unless absolutely necessary
- **Never create documentation files**: Don't proactively create .md or README files unless explicitly requested
- **Use existing patterns**: Follow the codebase's existing conventions and patterns
- **Test thoroughly**: Create comprehensive tests covering edge cases and real scenarios

### Problem Solving
- **Iterate on plans**: Review and improve plans for internal consistency and completeness
- **Address missing details**: Don't gloss over implementation challenges
- **Consider operational concerns**: Think about rate limits, error handling, and production deployment
- **Plan for code reuse**: Design for maximum code sharing between similar components

### Claude config improvements
- **Suggest adding allow/deny rules**: When I allow/deny running of new commands, suggest adding new allow/deny general rules to `~/.claude/settings.json` so these preferences are saved and persist across future sessions in different directories
- **Suggest adding things to global CLAUDE.md**: When I guide the agent or code down particular paths or request general changes, where applicable suggest adding these as general rules to `~/.claude/CLAUDE.md` so this can happen more automatically in future
