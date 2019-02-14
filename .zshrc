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
declare -r PROMPT_COMMAND_SYMBOL=$'\u03BB'

# Hook run once per prompt.
precmd() {
  set-prompt
}

set-prompt() {
  # Build prompt as an array of lines.
  local -a lines
  lines=(
    "╭ %B%F{magenta}%/%f%b"
    "╰ %F{magenta}$PROMPT_COMMAND_SYMBOL%f "
  )

  # The (F) expansion flag joins an array variable with newlines.
  PS1="${(F)lines}"
}

# Environment
# ------------------------------------------------

# Edit config files, git commits, etc. using Vim.
export EDITOR="vim"

# Search for scripts in this directory.
export PATH="$PATH:$HOME/Scripts"

# nvm loader (do not modify, nvm installer checks for these lines)
# ------------------------------------------------

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
