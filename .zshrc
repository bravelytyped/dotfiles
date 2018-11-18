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

# Colorize grep and ls, and make ls append type sigils to filenames.
alias grep='grep --color=auto'
alias ls='ls --color=auto --classify'

# Custom prompt
# ------------------------------------------------

# Prompt symbols for interpolation.
declare -r PROMPT_VCS_BRANCH_SYMBOL=$'\uE725'
declare -r PROMPT_VCS_CLEAN_SYMBOL=$'\uF111'
declare -r PROMPT_VCS_DIRTY_SYMBOL=$'\uF10C'
declare -r PROMPT_COMMAND_SYMBOL=$'\u03BB'

# Hook run once per prompt.
precmd() {
  set-prompt
}

set-prompt() {
  # Build prompt as an array of lines.
  local -a lines
  lines=(
    "╭ %B%F{magenta}%/%f%b $(git-branch)"
    "╰ %F{magenta}$PROMPT_COMMAND_SYMBOL%f "
  )

  # The (F) expansion flag joins an array variable with newlines.
  PS1="${(F)lines}"
}

git-branch() {
  # Check if we're in a Git repository.
  local -r refname="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"
  local result
  if [[ "${#refname}" > 0 ]]
  then
    result="%F{blue}$PROMPT_VCS_BRANCH_SYMBOL $refname%f"

    # Check the dirty state.
    local -r changes="$(git diff-index HEAD -- 2>/dev/null)"
    local -r untracked="$(git ls-files --exclude-standard --others 2>/dev/null)"
    if [[ "${#changes}" > 0 || "${#untracked}" > 0 ]]
    then
      result="$result %F{yellow}$PROMPT_VCS_DIRTY_SYMBOL%f"
    else
      result="$result %F{green}$PROMPT_VCS_CLEAN_SYMBOL%f"
    fi
  fi

  echo "$result"
}

# Environment
# ------------------------------------------------

# Edit config files, git commits, etc. using Vim.
export EDITOR=vim

# nvm loader (do not modify, nvm installer checks for these lines)
# ------------------------------------------------

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
