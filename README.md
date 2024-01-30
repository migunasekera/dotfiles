## Dotfiles
Dotfiles to be stored and shared across multiple machines. Approach used is a github bare repository. Idea taken from [here](https://www.atlassian.com/git/tutorials/dotfiles)

## To-do
- [x] Add .vimrc
- [x] Add .zshrc
- [x] Add .bashrc and .inputrc
- [ ] Create shell script to perform required installations
- [ ] Create branch for Mac vs Linux

## Setup on a new machine
```bash
git clone --bare <git-repo-url> $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
config checkout
```
