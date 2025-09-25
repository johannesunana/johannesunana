# append to the history file, don't overwrite it
shopt -s histappend

# Save timestamp in the history file
HISTTIMEFORMAT="%F %T "

# Prevent unset of histfile
# https://askubuntu.com/a/820852/150957
HISTFILE=~/.bash_history
HISTSIZE=10000
HISTFILESIZE=999999
# Don't store duplicates
HISTCONTROL=ignoredups
# Allow "sharing" of history between instances
PROMPT_COMMAND="history -a; history -c; history -r"

# Prefer Gpg4win GnuPG over Git's bundled GnuPG
export PATH="/c/Program Files (x86)/GnuPG/bin:$PATH"
