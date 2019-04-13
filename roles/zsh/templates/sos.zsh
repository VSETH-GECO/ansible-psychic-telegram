# Managed by ansible (role zsh), do not edit!
# This file is intended to be source'd from zsh

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh context dir rbenv pyenv virtualenv vcs dir_writable root_indicator)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time status background_jobs time)
POWERLEVEL9K_CONTEXT_TEMPLATE_TMUX="%n"
# POWERLEVEL9K_MODE='awesome-fontconfig' is still experimental...

if [ -z "$DEFAULT_USER" ] ; then
	export DEFAULT_USER="$(whoami)"
fi

# powerlevel9k doesn't handle tmux and ssh correctly :/
if [[ $TERM = "screen" ]] ; then
        export TERM="xterm-256color"
fi

source /etc/zsh/powerlevel9k/powerlevel9k.zsh-theme

# Only show SSH prompt if we're not in TMUX
prompt_ssh() {
	if ( [[ -n "$SSH_CLIENT" ]] || [[ -n "$SSH_TTY" ]] ) && [[ -z "$TMUX" ]] ; then
      "$1_prompt_segment" "$0" "$2" "$DEFAULT_COLOR" "yellow" "" 'SSH_ICON'
  fi
}

# Only show the host if we are not in TMUX
prompt_context() {
  local current_state="DEFAULT"
  typeset -AH context_states
  context_states=(
    "ROOT"      "yellow"
    "DEFAULT"   "white"
  )

  local content=""

  if [[ "$USER" != "$DEFAULT_USER" ]]; then
    current_state="ROOT"
  fi

  if [[ -z "$TMUX" ]] ; then
     content="${POWERLEVEL9K_CONTEXT_TEMPLATE}"
  else
     content="${POWERLEVEL9K_CONTEXT_TEMPLATE_TMUX}" 
  fi

  "$1_prompt_segment" "${0}_${current_state}" "$2" "$DEFAULT_COLOR" "${context_states[$current_state]}" "${content}"
}

# Other stuff
alias la='ls -la --color'
alias ll='ls -l --color'
alias ls='ls --color'

autoload -Uz compinit
compinit

setopt share_history
setopt extended_history
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt no_hist_beep

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

bindkey -e
