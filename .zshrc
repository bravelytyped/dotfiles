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

# ------------------------------------------------------------------------------

# Enable reverse-i-search. Why it's not enabled by default, I don't know.
bindkey '^R' history-incremental-search-backward

# Enable using comments interactively. Again, uncertain why this isn't a default.
setopt interactive_comments

# Colorize grep and ls, and make ls append type sigils to filenames.
alias grep='grep --color=auto'
alias ls='ls --color=auto --classify'

# Lambda symbol in UTF-8.
declare -r PROMPT_COMMAND_SYMBOL=$'\u03BB'

# Configures a dynamic toplevel prompt.
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

# Runs once per prompt, before the prompt is shown.
precmd() {
  set-prompt
}

# Edit config files, git commits, etc. using Vim.
export EDITOR="vim"

# nvm loader (do not modify, the nvm updater checks for these lines)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
