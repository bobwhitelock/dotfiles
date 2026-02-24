
# Dotfiles

These are my dotfiles &mdash; various config files and scripts that I like to
carry with me between machines.

Things are mostly written by me unless indicated otherwise; feel free to steal
anything you like whole or in part.

Comments, questions, and suggestions are always welcome; the best way to do
this is probably just adding an
[issue](https://github.com/bobwhitelock/dotfiles/issues).

## Installation

(This is mostly for my own reference - you probably want to just pick and
choose things rather than install everything if you're not me).

1. Install Linux (currently I'm on various distros on different machines - some
   things currently in this repo are specific to Arch, and won't work on other
   distros).

2. Do the following:
  ```bash
  mkdir -p ~/src/github.com/bobwhitelock
  cd !$
  git clone git@github.com:bobwhitelock/dotfiles.git

  cd dotfiles
  ./install
  vim zsh/env.private.sh # And appropriately set any needed secret env vars.
  source zshrc

  # Copy over private files, SSH keys, AWS credentials etc.
  ```

3. Fix the things which will probably break/be incomplete in the above, and
   update steps for next time.
