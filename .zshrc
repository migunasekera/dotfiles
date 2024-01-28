# ZSH completion
autoload -U compinit; compinit
### Vi mode
bindkey -v
export KEYTIMEOUT=1

#Vi configs which I got from [someone else](https://rm-rf.ca/posts/2020/zsh-vi-mode/)
# beginning search in insert mode, redundant with the up/down arrows above
# but a little easier to press.
bindkey "^K" history-search-backward
bindkey "^J" history-search-forward

# incremental search in vi command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward
# navigate matches in incremental search
bindkey -M viins '^R' history-incremental-pattern-search-backward
bindkey -M viins '^F' history-incremental-pattern-search-forward

##bindkey -v
#bindkey '\e[A'  history-search-backward
#bindkey '\e[B'  history-search-forward

# Colorize output of terminal commands, but if piped to anything else than terminal, then done colorize
export CLICOLOR=1
# Set LS_COLORS environment variable
eval "$(gdircolors)"



# Pyenv entry
eval "$(pyenv init -)"
export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET"

# Create a new Man page
#export MANPAGER="col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -"

export MANPAGER="vim -M +MANPAGER -"

# Create an alias to go straight into the journal folder
#test
function entry(){
	# Create date-formatted file as a Journal entry for today. Add a date to the beginning of the entry, if it doesn't exist
	#
	# Save to a variable
	export JOURNALFILE=$HOME/Documents/journals/$(gdate "+%Y_%m_%d.md")
	# echo $JOURNALFILE
	# Checks if file does not exist. If true, then append a date-formatted (e.g. April 18, 2022)
	# Note: you can test these statements withs the command "test"
	if [ ! -f $JOURNALFILE ]; then
		echo "$(gdate "+%B %d, %Y")" > $JOURNALFILE 
	fi
	# Enter into the session, regardless of whether you added this. '+' sign means that the cursor will start at the bottom of the file
	vim + $JOURNALFILE 
}

# FZF keybindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## Info keybinds for vi-mode
alias info='info --vi-keys'

# Designed .local/bin is where the poetry repository is
export PATH="$HOME/.local/bin:$PATH"

# Make sure that INPUTRC is being read
export INPUTRC=$HOME/.inputrc

function activate() {
	set -a
	source .env
	set +a
}

# Configuration of dotfiles in $HOME 
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
