# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/mcarius/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

# Aliases
# ------------------------------------------------

alias ls='ls --color=auto --classify'

# Custom prompt
# ------------------------------------------------

declare -r PROMPT_VCS_BRANCH_SYMBOL=''
declare -r PROMPT_VCS_CLEAN_SYMBOL=''
declare -r PROMPT_VCS_DIRTY_SYMBOL=''

precmd() {
  set-prompt
}

set-prompt() {
  local -a lines
  lines=(
    "╭ %B%F{magenta}%/%f%b $(git-branch)"
    "╰ %F{magenta}λ%f "
  )
  PS1="${(F)lines}"
}

git-branch() {
  local -r refname="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"
  local -r changes="$(git diff-index HEAD -- 2>/dev/null)"
  local -r untracked="$(git ls-files --exclude-standard --others 2>/dev/null)"

  local result
  if [[ "${#refname}" > 0 ]]
  then
    result="%F{blue}$PROMPT_VCS_BRANCH_SYMBOL $refname%f"
  fi

  if [[ "${#changes}" > 0 || "${#untracked}" > 0 ]]
  then
    result="$result %F{yellow}$PROMPT_VCS_DIRTY_SYMBOL%f"
  else
    result="$result %F{green}$PROMPT_VCS_CLEAN_SYMBOL%f"
  fi

  echo "$result"
}

# Environment
# ------------------------------------------------

export EDITOR=vim

# nvm
# ------------------------------------------------

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
