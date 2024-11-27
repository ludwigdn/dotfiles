# Start diagnostics on .zshrc loading time
# -----------------
# zmodload zsh/zprof

autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C


# Source prepend config
# ---------------------
source $HOME/.zshrc.prepend

# Code repositories
# -----------------
mkdir ~/code > /dev/null 2>&1
export CODE_HOME="$HOME/code"
export CDPATH=".:${CDPATH}:$CODE_HOME"

# Dotnet folders
# --------------
export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet


# NeoVim as editor
# ----------------

# Define default editor
has_nvim=$(command -v nvim >/dev/null)
if $has_nvim; then
  export EDITOR="/usr/local/bin/nvim"
else
  export EDITOR="/usr/local/bin/vim"
fi


# ZSH config
# ----------

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git)
source $ZSH/oh-my-zsh.sh


# Nvm
# ---

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  [[ -a .nvmrc ]] || return

  if [[ -f .nvmrc && -r .nvmrc ]]; then
    # echo "Switching to version from local .nvmrc"
    nvm use
  elif [ "$(nvm version)" != "$(nvm version default)" ]; then
    # echo "Switching to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc


# User configurations
# -------------------

# Tell FZF to use Ripgrgep by default
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi


# Aliases
# -------

function gitRebaseFrom() {
  branch_to_rebase_from=$1
  echo "Rebasing from $branch_to_rebase_from"
  git switch $branch_to_rebase_from && git pull --rebase && git switch - && git rebase $branch_to_rebase_from
}

# Shell
alias lsl='ls -lA'
alias nv='nvim'

# Tmux
alias tm='tmux new-session -n "Terminal"'

# Npm
alias nci="npm ci"
alias nr="npm run"
alias nrs="npm run start"
alias nrsv="npm run serve"
alias nrb="npm run build"
alias nrd="npm run dev"
alias nrt="npm run test"
alias nrtu="npm run test:unit"
alias nrti="npm run test:integration"
alias nrl="npm run lint"
alias nrlf="npm run lint-fix > /dev/null 2>&1 || npm run lint:fix"

# Git
alias gcan='git commit --amend --no-edit'
alias gcut='git stash'
alias gpst='git stash pop'
alias grbf="gitRebaseFrom"


# Prompt configs
# --------------
# prompt_context() {
#   if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
#     prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
#   fi
# }
# Keep last (adds hour to prompt)
# PROMPT='%{$fg[white]%}[%D{%H:%M:%S}]'$PROMPT


# Stop diagnostics
# ----------------
# zprof

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
