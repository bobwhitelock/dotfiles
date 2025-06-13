
AI tools and agents should always follow the following rules when making
changes to code.  General rules always apply; language-specific rules only
apply when writing code of that language.

# General

- End comments with full stops.
- Do not put lots of unnecessary comments \- only add a comment when we need to
  explain -why- we’re doing something, or something is done in a particularly
  unusual way.
- Files should generally be written from top level functions working down
  through specific details \- e.g. `main` or similar at the top, then things
  called by `main`, then things called by these etc.
- Imports should be written in groups separated by gaps (just include nothing
  for a group if we have no modules of that type in use):
  - Built-in modules
  - Third party modules
  - Internal modules


# Python

- Follow PEP8, except don't add docstrings to every function.
- Code should conform to Black and isort formats.
- Mypy types should be included for function signatures. They are not needed
  for variables unless type checking indicates this is required. Avoid comments
  with `type: ignore` in if at all possible.
- Variables defined at the top level of a modules should be in upper snakecase,
  indicating they are globals.


# Bash/shell

- Local variables should be used for variables used internally in functions.
