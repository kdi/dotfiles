PS1="\w$ "  # Custom prompt text (full pwd).

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

export CLICOLOR=1  # Enable terminal colors
export LSCOLORS=Gxfxbxdxcxegedabagacad  # File-type color definition (e.g. files=grey, directories=bold cyan, etc.) -- Dark background.
#export LSCOLORS=ExFxCxDxBxegedabagacad  # Light background.


# STDERR Red.
# NOTE: Installing on OS X will break the `open` command line utility. So
# things like `mvim` and `open` itself will not work unless the application being
# opened is already opened. It's because of flat namespace forced by
# `DYLD_FORCE_FLAT_NAMESPACE` which is required by `DYLD_INSERT_LIBRARIES`.

# Alternative to enabling it globally via shell config is to create alias and
# use it to selectively colorize stderr for the commands you run:

# $ alias stderred='LD_PRELOAD=/absolute/path/to/lib/stderred.so'
# $ stderred java lol
#export DYLD_INSERT_LIBRARIES=$HOME/Documents/dotfiles/stderred/lib/stderred.dylib DYLD_FORCE_FLAT_NAMESPACE=1
#export DYLD_INSERT_LIBRARIES=""$HOME/Documents/dotfiles/stderred/lib/stderred.dylib${DYLD_INSERT_LIBRARIES:+:$DYLD_INSERT_LIBRARIES}"

alias cls="clear"  # Windows command. :)
alias vim="vi"
alias ll="ls -l"
alias la="ls -Al"  # show hidden files, with -l.
alias grep="grep --color=auto -I"  # Colorful, skipping binary files.
alias less="less -R"  # Colorful less.
alias ghci="ghci-color"


export LESS="FRSXQ"  # Colorful diffing in Mercurial.

export LESS_TERMCAP_mb=$'\E[01;31m'  # Colorful man pages.
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'


# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion


# init z   https://github.com/rupa/z
. ~/code/z/z.sh

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Keys 

# Generate a new ssh-rsa key
newkey () { cd ~/.ssh | mkdir _old | cp id_rsa* _old | rm id_rsa* | ssh-keygen -t rsa -C "$1"; }

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults


