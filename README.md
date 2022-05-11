
# Dotfiles

These are my dotfiles&mdash;various config files and scripts that I like to
carry with me between machines.

Things are mostly written by me unless indicated otherwise; feel free to steal
anything you like whole or in part.

Comments, questions, and suggestions are always welcome; the best way to do
this is probably just adding an
[issue](https://github.com/bobwhitelock/dotfiles/issues).

## Installation

If you aren't me, I don't recommend installing and using these
directly&mdash;everything in this repo is very specific to my own workflow,
languages I use, projects I've worked on, places I've worked etc., and will
also change without warning&mdash;instead just steal the bits you like and
which are relevant to you.

If you are me, or you just want to ignore this and try things out locally:

1. Install Linux, preferably Arch, and preferably via
   [ArchLabs](https://archlabslinux.com/) (setting things up on other
   OSes/distros will vary).

2. Do the following:
  ```bash
  mkdir -p ~/src/bobwhitelock
  cd !$
  git clone git@github.com:bobwhitelock/dotfiles.git

  cd dotfiles
  ./install
  vim zsh/env.private.sh # And appropriately set any needed secret env vars.
  source zshrc

  # Everything below definitely won't work if you aren't me ¯\_(ツ)_/¯.

  # Copy over private files, SSH keys, AWS credentials etc.

  ssh-add ~/.ssh/id_rsa.bob
  clone bobwhitelock/dotfiles-private

  # Need to re-install to link in private files.
  ./install

  ```

3. Fix the things which will probably break/be incomplete in the above, and
   update steps for next time.
