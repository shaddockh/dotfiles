export PATH="/usr/local/bin:/usr/local/share/npm/bin:$PATH"
export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"
alias ll="ls -al"
alias cd..="cd .."

# Point vi and vim to the current version of vim
alias vim="/Applications/MacVim.app/Contents/MacOS/Vim" 
alias vi="/Applications/MacVim.app/Contents/MacOS/Vim" 

# Set vi mode on command line
set -o vi

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export TERM=xterm-256color

############################################
# Modified from emilis bash prompt script
# from https://github.com/emilis/emilis-config/blob/master/.bash_ps1
#
# Modified for Mac OS X by
# @corndogcomputer

###########################################
# Fill with minuses
# (this is recalculated every time the prompt is shown in function prompt_command):

#fill="--- "
#
reset_style='\[\033[00m\]'
status_style=$reset_style'\[\033[0;90m\]' # gray color; use 0;37m for lighter color
prompt_style=$reset_style
command_style=$reset_style'\[\033[1;29m\]' # bold black

# Prompt variable:
#PS1="$status_style"'$fill \t\n'"$prompt_style"'${debian_chroot:+($debian_chroot)}\u:\w\$'"$command_style "
PS1="$prompt_style"'${debian_chroot:+($debian_chroot)}\u:\w\$'"$command_style "

## Reset color for command output
## (this one is invoked every time before a command is executed):
#trap 'echo -ne "\033[00m"' DEBUG
#
#function prompt_command {
#	# create a $fill of all screen width minus the time string and a space:
#	let fillsize=${COLUMNS}-9
#	fill=""
#	while [ "$fillsize" -gt "0" ]
#	do
#		fill="-${fill}" # fill with underscores to work on
#		let fillsize=${fillsize}-1
#	done
#
#	# If this is an xterm set the title to user@host:dir
#	case "$TERM" in
#		xterm*|rxvt*)
#		bname=`basename "${PWD/$HOME/~}"`
#		echo -ne "\033]0;${bname}: ${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"
#		;;
#		*)
#		;;
#	esac
#}
#
#PROMPT_COMMAND=prompt_command
#
# MacPorts Installer addition on 2013-02-23_at_15:43:42: adding an appropriate PATH variable for use with MacPorts.
#export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

############################################
# TMUX Stuff
############################################
alias tma='tmux attach -d -t '
alias tmr='tmux attach -d -t $(basename $(pwd))'
alias tmux-new='tmux new -s $(basename $(pwd))'
alias tml='tmux list-sessions'


# When starting a new prompt launch into a new session called 'default'.  When exiting a session, re-attach to the next running session
#if [[ -z "$TMUX" ]] ;then
#    ID="`tmux ls | grep -vm1 attached | cut -d: -f1`" # get the id of a deattached session
#    if [[ -z "$ID" ]] ;then # if not available create a new one
#        tmux new-session -s default
#    else
#        tmux attach-session -t "$ID" # if available attach to it
#    fi
#fi
