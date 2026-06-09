eval "$(starship init zsh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"

source "$HOME/.vars.sh"
source "$HOME/.aliases.sh"
source "$HOME/.secrets.sh"
source "$HOME/.cargo/env"
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

BASE_FUNCTIONS_PATH="$HOME/.functions"
for function_file in $BASE_FUNCTIONS_PATH/*.sh; do
    chmod +x "$function_file"
    source "$function_file"
done

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt autocd
setopt appendhistory
setopt share_history

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

__conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup


